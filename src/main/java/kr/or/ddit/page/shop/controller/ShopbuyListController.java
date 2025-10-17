package kr.or.ddit.page.shop.controller;

import kr.or.ddit.page.shop.service.OrderInfoService;
import kr.or.ddit.vo.OrderInfoVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopbuyListController {

    private final OrderInfoService orderInfoService;

    public ShopbuyListController(OrderInfoService orderInfoService) {
        this.orderInfoService = orderInfoService;
    }

    @GetMapping("/buyList")
    public String buyList(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null || !authentication.isAuthenticated() || "anonymousUser".equals(authentication.getPrincipal())) {
            return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리디렉트
        }

        // 사용자 ID 가져오기
        Object principal = authentication.getPrincipal();
        String loggedInUserId;

        if (principal instanceof org.springframework.security.core.userdetails.UserDetails) {
            loggedInUserId = ((org.springframework.security.core.userdetails.UserDetails) principal).getUsername();
        } else {
            loggedInUserId = authentication.getName();
        }

        // ✅ 특정 회원의 주문 내역 조회 (상품명 및 가격 포함)
        List<OrderInfoVO> orderList = orderInfoService.selectOrdersByMemId(loggedInUserId);

        // ✅ 모델에 데이터 추가 (JSP에서 사용 가능)
        model.addAttribute("userId", loggedInUserId);
        model.addAttribute("orderList", orderList);

        log.info("✅ 주문 내역 페이지 접근 전체 - 사용자 ID: {}, 주문 개수: {}", loggedInUserId, orderList.size());

        // ✅ 상품명과 가격도 로그에 출력하여 디버깅 가능
        for (OrderInfoVO order : orderList) {
            log.info("🛒 주문번호: {}, 상품명: {}, 가격: {}", order.getOrderNo(), order.getGdsName(), order.getGdsPrice());
        }

        return "shop/buyList";  // ✅ JSP 페이지로 이동
    }

    // ✅ 환불 요청 처리 API 추가
    @PostMapping("/requestRefund")
    @ResponseBody
    public String requestRefund(@RequestParam("orderNo") int orderNo) {
        try {
            int updatedRows = orderInfoService.updateOrderChangeStatus(orderNo, 3); // ORDER_CHANGE_NO = 3 (환불 요청)
            
            if (updatedRows > 0) {
                log.info("✅ 환불 요청 성공 - 주문 번호: {}", orderNo);
                return "환불 요청이 성공적으로 접수되었습니다.";
            } else {
                log.warn("⚠️ 환불 요청 실패 - 주문 번호: {}", orderNo);
                return "환불 요청 처리 중 오류가 발생했습니다.";
            }
        } catch (Exception e) {
            log.error("❌ 환불 요청 중 예외 발생 - 주문 번호: {}", orderNo, e);
            return "서버 오류로 인해 환불 요청이 처리되지 않았습니다.";
        }
    }
}
