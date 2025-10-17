package kr.or.ddit.page.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import kr.or.ddit.page.shop.service.CartDetailService;
import kr.or.ddit.page.shop.service.CartService;
import kr.or.ddit.vo.CartDetailVO;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class ShopCartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private CartDetailService cartDetailService;

    /**
     * 장바구니 추가 로직
     */
    @PostMapping("/shop/cart/delete")
    @ResponseBody
    public Map<String, Object> deleteCartItem(
            @RequestParam("cartNo") int cartNo,
            @RequestParam("gdsNo") int gdsNo) {
        Map<String, Object> response = new HashMap<>();
        try {
            cartDetailService.deleteCartDetail(cartNo, gdsNo); // 서비스 호출
            response.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("error", "삭제 중 오류가 발생했습니다.");
        }
        return response;
    }

    @Transactional
    @PostMapping("/shop/cart")
    public String addToCart(
            @RequestParam("gdsNo") int gdsNo,
            @RequestParam("orderListQy") int orderListQy,
            @AuthenticationPrincipal MemberVO memberVO,
            Principal principal,
            HttpSession session,
            Model model) {

        log.info("장바구니 추가 요청 - 상품번호: {}, 수량: {}", gdsNo, orderListQy);

        String memId = getMemberId(memberVO, principal, model);
        if (memId == null) {
            return "redirect:/login";
        }

        // CSRF 토큰 확인
        if (!isValidCsrfToken(session)) {
            log.warn("CSRF 토큰이 유효하지 않습니다.");
            model.addAttribute("error", "유효하지 않은 요청입니다.");
            return "shop/carterror";
        }

        try {
            CartVO existingCart = cartService.selectRecentCartById(memId);
            int cartNo = initializeCart(existingCart, memId);

            // 중복 데이터 체크 및 처리
            CartDetailVO existingDetail = cartDetailService.selectCartDetailByCartNoAndGdsNo(cartNo, gdsNo);
            if (existingDetail != null) {
                updateCartDetailQuantity(existingDetail, orderListQy);
            } else {
                addNewCartDetail(cartNo, gdsNo, orderListQy);
            }

            return "redirect:/shop/cart";

        } catch (Exception e) {
            log.error("장바구니 추가 중 오류 발생", e);
            model.addAttribute("error", "장바구니 추가 중 오류가 발생했습니다.");
            return "shop/carterror";
        }
    }

    /**
     * 장바구니 조회 로직
     */
    @GetMapping("/shop/cart")
    public String viewCart(
            @AuthenticationPrincipal MemberVO memberVO,
            Principal principal,
            Model model) {

        String memId = getMemberId(memberVO, principal, model);
        if (memId == null) {
            return "redirect:/login";
        }

        List<CartVO> cartList = cartService.getCartWithDetails(memId);

        if (cartList == null || cartList.isEmpty()) {
            log.info("장바구니가 비어 있습니다. 사용자: {}", memId);
        } else {
            logCartDetails(cartList);
        }

        model.addAttribute("cartList", cartList);
        model.addAttribute("memId", memId);

        return "shop/cart";
    }

    /**
     * 장바구니 수량 업데이트 로직
     */
    @PostMapping("/shop/cart/update")
    @ResponseBody
    public Map<String, Object> updateCartDetail(
            @RequestParam("cartNo") Integer cartNo,
            @RequestParam("gdsNo") Integer gdsNo,
            @RequestParam("quantity") Integer quantity) {

        Map<String, Object> response = new HashMap<>();
        if (cartNo == null || gdsNo == null || quantity == null || quantity <= 0) {
            log.warn("유효하지 않은 요청 데이터 - cartNo: {}, gdsNo: {}, quantity: {}", cartNo, gdsNo, quantity);
            response.put("success", false);
            response.put("error", "유효하지 않은 데이터 요청입니다.");
            return response;
        }

        try {
            log.info("수량 업데이트 요청 - 장바구니 번호: {}, 상품 번호: {}, 수량: {}", cartNo, gdsNo, quantity);

            CartDetailVO cartDetail = cartDetailService.selectCartDetailByCartNoAndGdsNo(cartNo, gdsNo);
            if (cartDetail == null) {
                log.warn("장바구니 상세 정보를 찾을 수 없습니다. 장바구니 번호: {}, 상품 번호: {}", cartNo, gdsNo);
                response.put("success", false);
                response.put("error", "장바구니 항목을 찾을 수 없습니다.");
                return response;
            }

            cartDetail.setCartDetailQy(quantity);
            cartDetailService.updateCartDetailQy(cartDetail);

            log.info("수량 업데이트 성공 - 장바구니 번호: {}, 상품 번호: {}, 새 수량: {}", cartNo, gdsNo, quantity);
            response.put("success", true);

        } catch (Exception e) {
            log.error("수량 업데이트 중 오류 발생", e);
            response.put("success", false);
            response.put("error", "수량 업데이트 중 오류가 발생했습니다.");
        }

        return response;
    }

    /**
     * 사용자 ID 가져오기
     */
    private String getMemberId(MemberVO memberVO, Principal principal, Model model) {
        if (memberVO != null) {
            log.info("로그인된 사용자: {}", memberVO.getMemId());
            return memberVO.getMemId();
        } else if (principal != null) {
            log.info("Principal 사용자 ID: {}", principal.getName());
            return principal.getName();
        } else {
            model.addAttribute("error", "로그인이 필요합니다.");
            return null;
        }
    }

    /**
     * CSRF 토큰 유효성 검사
     */
    private boolean isValidCsrfToken(HttpSession session) {
        String csrf = (String) session.getAttribute("csrf");
        return csrf != null && !csrf.isEmpty();
    }

    /**
     * 장바구니 초기화
     */
    private int initializeCart(CartVO existingCart, String memId) {
        if (existingCart != null) {
            if (existingCart.getCartState() == 0) {
                // 최근 장바구니 상태가 0이면 새로운 장바구니를 생성
                CartVO newCart = new CartVO();
                newCart.setMemId(memId);
                newCart.setCartState(1); // 활성 상태
                cartService.insertCart(newCart);
                log.debug("최근 장바구니 상태가 0이므로 새로운 장바구니 생성: {}", newCart.getCartNo());
                return newCart.getCartNo();
            } else {
                // 기존 장바구니가 활성 상태인 경우 해당 장바구니 사용
                log.debug("기존 활성 장바구니 번호: {}", existingCart.getCartNo());
                return existingCart.getCartNo();
            }
        } else {
            // 기존 장바구니가 없는 경우 새로운 장바구니 생성
            CartVO newCart = new CartVO();
            newCart.setMemId(memId);
            newCart.setCartState(1); // 활성 상태
            cartService.insertCart(newCart);
            log.debug("새로운 장바구니 생성: {}", newCart.getCartNo());
            return newCart.getCartNo();
        }
    }

    /**
     * 장바구니 상세 데이터 수량 업데이트
     */
    private void updateCartDetailQuantity(CartDetailVO existingDetail, int orderListQy) {
        int newQuantity = existingDetail.getCartDetailQy() + orderListQy;
        existingDetail.setCartDetailQy(newQuantity);
        cartDetailService.updateCartDetailQy(existingDetail);
        log.info("기존 상품 수량 업데이트: 장바구니 번호 {}, 상품 번호 {}, 새 수량 {}",
                existingDetail.getCartNo(), existingDetail.getGdsNo(), newQuantity);
    }

    /**
     * 새 장바구니 상세 데이터 추가
     */
    private void addNewCartDetail(int cartNo, int gdsNo, int orderListQy) {
        CartDetailVO cartDetailVO = new CartDetailVO();
        cartDetailVO.setCartNo(cartNo);
        cartDetailVO.setGdsNo(gdsNo);
        cartDetailVO.setCartDetailQy(orderListQy);
        cartDetailService.insertCartDetail(cartDetailVO);
        log.info("새로운 상품 추가: 장바구니 번호 {}, 상품 번호 {}, 수량 {}", cartNo, gdsNo, orderListQy);
    }

    /**
     * 장바구니 상세 정보 로그 출력
     */
    private void logCartDetails(List<CartVO> cartList) {
        log.info("장바구니 조회 결과 - 총 {}개의 장바구니 항목", cartList.size());
        for (CartVO cart : cartList) {
            log.info("장바구니 번호: {}, 회원 ID: {}, 상태: {}", cart.getCartNo(), cart.getMemId(), cart.getCartState());
            if (cart.getCartDetails() != null) {
                for (CartDetailVO detail : cart.getCartDetails()) {
                    log.info("  상세 - 상품 번호: {}, 수량: {}", detail.getGdsNo(), detail.getCartDetailQy());
                    if (detail.getGoods() != null) {
                        log.info("    상품 정보 - 이름: {}, 설명: {}, 가격: {}",
                                detail.getGoods().getGdsNm(),
                                detail.getGoods().getGdsDc(),
                                detail.getGoods().getGdsPrice());
                    }
                }
            }
        }
    }
}
