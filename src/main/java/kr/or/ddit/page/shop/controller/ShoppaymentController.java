package kr.or.ddit.page.shop.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.shop.service.AddressService;
import kr.or.ddit.page.shop.service.GoodsService;
import kr.or.ddit.page.shop.mapper.OrderInfoMapper;
import kr.or.ddit.page.shop.mapper.OrderListMapper;
import kr.or.ddit.page.shop.mapper.CartMapper;
import kr.or.ddit.page.shop.mapper.GoodsPaymentMapper;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.OrderInfoVO;
import kr.or.ddit.vo.OrderListVO;
import kr.or.ddit.vo.GoodsPaymentVO;
import lombok.extern.slf4j.Slf4j;
import kr.or.ddit.vo.AddressVO;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class ShoppaymentController {

	 @Autowired
	    private AddressService addressService;
    @Autowired
    private GoodsService goodsService;

    @Autowired
    private OrderInfoMapper orderInfoMapper;

    @Autowired
    private OrderListMapper orderListMapper;

    @Autowired
    private GoodsPaymentMapper goodsPaymentMapper;

    @Autowired
    private CartMapper cartMapper;

    /**
     * 결제 페이지 진입
     */
    @PostMapping("/shop/payment")
    public String handlePayment(
            @RequestParam(value = "cartNo", required = false) Integer cartNo, // 외부에서 cartNo를 optional로 받음
            @RequestParam("gdsNos") List<Integer> gdsNos,
            @RequestParam("quantities") List<Integer> quantities,
            @AuthenticationPrincipal MemberVO memberVO,
            Principal principal,
            Model model) {

        String memId = null;

        // 로그인 상태 확인
        if (memberVO == null) {
            if (principal != null) {
                memId = principal.getName();
            } else {
                return "redirect:/login";
            }
        } else {
            memId = memberVO.getMemId();
        }

        // 상품 정보를 가져오고 총 금액 계산
        int totalPrice = 0;
        List<GoodsVO> goodsList = new ArrayList<>();
        for (int i = 0; i < gdsNos.size(); i++) {
            GoodsVO goodsVO = goodsService.getGoodsById(gdsNos.get(i));
            if (goodsVO == null) {
                model.addAttribute("error", "상품 정보를 찾을 수 없습니다.");
                return "shop/paymentError";
            }
            goodsList.add(goodsVO);
            totalPrice += goodsVO.getGdsPrice() * quantities.get(i);
        }

        // cartNo가 비어있는 경우에 대한 처리
        if (cartNo == null) {
            log.warn("cartNo가 비어 있습니다. 장바구니 번호 없이 처리합니다.");
            cartNo = 0; // 기본값 설정
        }

        // 결제 페이지에 필요한 데이터 추가
        model.addAttribute("memId", memId);
        model.addAttribute("cartNo", cartNo); // 장바구니 번호 추가
        model.addAttribute("goodsList", goodsList);
        model.addAttribute("quantities", quantities);
        model.addAttribute("totalPrice", totalPrice);

        return "shop/payment";
    }

    /**
     * 결제 처리 로직
     */
    @Transactional
    @PostMapping("/shop/processPayment")
    public String processPayment(
            @RequestParam(value = "cartNo", required = false) Integer cartNo,
            OrderInfoVO orderInfoVO,
            @AuthenticationPrincipal MemberVO memberVO,
            Principal principal,
            Model model) {

        String memId = null;

        if (memberVO == null) {
            if (principal != null) {
                memId = principal.getName();
                log.warn("MemberVO가 null이지만 Principal 정보로 사용자 인증 확인. 사용자 이름: {}", memId);
            } else {
                log.warn("로그인이 안되어있습니다. Principal 객체도 null입니다.");
                return "redirect:/login"; // 로그인 페이지로 리다이렉트
            }
        } else {
            memId = memberVO.getMemId();
            log.info("로그인되어 있습니다. memId = {}", memId);
        }

        orderInfoVO.setMemId(memId);
        orderInfoVO.setOrderAdd(orderInfoVO.getPostalCode() + " "
                + orderInfoVO.getOrderAddress() + " "
                + orderInfoVO.getOrderDetailAddress());

        try {
            // 주문 정보 저장
            orderInfoMapper.insertOrderInfo(orderInfoVO);
            int orderNo = orderInfoVO.getOrderNo();
            log.info("새로 생성된 ORDER_NO: {}", orderNo);

            // 주문 상세 저장
            List<OrderListVO> orderListVOList = new ArrayList<>();
            String[] gdsNos = orderInfoVO.getGdsNos();
            String[] orderListQys = orderInfoVO.getQuantities();
            int counter = 0;
            String orderName="";
            for (String gdsNo : gdsNos) {
                OrderListVO orderListVO = new OrderListVO();
                orderListVO.setOrderNo(orderNo);
                orderListVO.setGdsNo(Integer.parseInt(gdsNo));
                orderListVO.setOrderListQy(Integer.parseInt(orderListQys[counter++]));
                orderListMapper.insertOrderList(orderListVO);
                log.info("orderListVO {}", orderListVO);
                if (counter==1) {
                	orderName=goodsService.getGoodsName(orderListVO.getGdsNo());
                }
            }
            log.info("orderName: {}", orderName);
            log.info("counter: {}", counter);
            if(counter==1) {}
            else {
            	orderName+= "외 "+(counter-1)+"개";
            }

            // 결제 정보 저장
            GoodsPaymentVO goodsPaymentVO = new GoodsPaymentVO();
            goodsPaymentVO.setOrderNo(orderNo);
            goodsPaymentVO.setPaycoNo(orderInfoVO.getGoodsPaymentVO().getPaycoNo());
            goodsPaymentVO.setGdsPayAmt(orderInfoVO.getOrderTotalAmount());
            goodsPaymentVO.setGdsPayState(1);
            goodsPaymentMapper.insertGoodsPayment(goodsPaymentVO);

            log.info("orderInfoVO {}", orderInfoVO);
            // cartState 업데이트
            if (cartNo != null && cartNo != 0) {
                log.info("cartNo가 {}입니다. cartState를 0으로 업데이트합니다.", cartNo);
                Map<String, Object> params = new HashMap<>();
                params.put("cartNo", cartNo);
                params.put("cartState", 0);
                cartMapper.updateCartState(params);
            } else {
                log.info("cartNo가 0이므로 cartState를 수정하지 않습니다.");
            }

            // ✅ **카카오페이 결제 로직 추가**
            if (goodsPaymentVO.getPaycoNo() == 2) {
                log.info("카카오페이 결제 선택됨. payReady API 호출 중...");
                String ip = "";

	    		try {
	    			Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
//	    		            System.out.println("networkInterfaces: " + networkInterfaces);

	    			while (networkInterfaces.hasMoreElements()) {
	    				NetworkInterface networkInterface = networkInterfaces.nextElement();
//	    			        System.out.println("networkInterface: " + networkInterface.getDisplayName());
	    				Enumeration<InetAddress> inetAddresses = networkInterface.getInetAddresses();
//	    			        System.out.println("inetAddresses: " + inetAddresses.toString());
	    				while (inetAddresses.hasMoreElements()) {
	    					InetAddress inetAddress = inetAddresses.nextElement();
//	    			          System.out.println("inetAddress: " + inetAddress.toString());
	    					if (inetAddress.isSiteLocalAddress()) {
//	    			            System.out.println("내부 IP 주소: " + inetAddress.getHostAddress());
	    						if (networkInterface.getDisplayName().contains("RTL8852AE WiFi 6 802.11ax PCIe Adapter")) {
	    							ip = inetAddress.getHostAddress();
	    						}
	    					}
	    				}
	    			}
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    		ip="http://"+ip;
                RestTemplate restTemplate = new RestTemplate();
                String kakaoPayUrl = ip+"/order/pay/ready";
                // 요청 파라미터 설정 (form-urlencoded 형식)
                MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
                params.add("name", orderInfoVO.getOrderName());
                params.add("orderName",orderName);
                params.add("totalPrice", String.valueOf(orderInfoVO.getOrderTotalAmount()));

                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

                HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);

                try {
                    ResponseEntity<String> response = restTemplate.postForEntity(kakaoPayUrl, request, String.class);

                    // ✅ JSON 응답에서 `next_redirect_pc_url` 값 추출
                    ObjectMapper objectMapper = new ObjectMapper();
                    JsonNode jsonResponse = objectMapper.readTree(response.getBody());
                    String redirectUrl = jsonResponse.get("next_redirect_pc_url").asText(); // ✅ 카카오페이 결제 URL 추출

                    log.info("카카오페이 결제 URL: {}", redirectUrl);
                    return "redirect:" + redirectUrl; // ✅ 정상적인 URL로 리다이렉트

                } catch (Exception e) {
                    log.error("카카오페이 결제 준비 요청 중 오류 발생", e);
                    model.addAttribute("error", "카카오페이 결제 준비 중 오류가 발생했습니다.");
                    return "shop/paymentError";
                }
            }
            // 일반 결제 성공 페이지
            model.addAttribute("orderNo", orderNo);
            model.addAttribute("message", "주문이 성공적으로 처리되었습니다.");
            return "shop/paymentSuccess";

        } catch (Exception e) {
            log.error("결제 처리 중 오류 발생", e);
            model.addAttribute("error", "주문 처리 중 오류가 발생했습니다.");
            return "shop/paymentError";
        }
    }
    @PostMapping("/shop/addresses")
    @ResponseBody
    public List<AddressVO> getAddresses(@RequestBody Map<String, String> requestBody) {
        String memId = requestBody.get("memId");

        if (memId == null || memId.trim().isEmpty()) {
            log.warn("❌ memId가 제공되지 않았습니다.");
            return new ArrayList<>(); // 빈 리스트 반환
        }

        log.info("📢 주소 조회 요청: 회원 ID = {}", memId);
        return addressService.getAddressesByMemId(memId);
    }

}