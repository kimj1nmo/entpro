package kr.or.ddit.util;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.page.mypage.mypageService;


@Slf4j
@RequiredArgsConstructor
@RequestMapping("/order")
@Controller

public class KakaoApiController {

    private final KakaoPayService kakaoPayService;

    @Autowired
    private mypageService mypageService;

    @PostMapping("/pay/ready")
    @ResponseBody
    public ReadyResponse payReady(
            @RequestParam("name") String name,
            @RequestParam("orderName") String orderName,
            @RequestParam("totalPrice") int totalPrice,
            HttpSession session) {

        log.info("✅ 주문자 이름: {}", name);
        log.info("✅ 주문 상품 이름: {}", orderName);
        log.info("✅ 주문 금액: {}", totalPrice);

        // 카카오 결제 준비하기
        ReadyResponse readyResponse = kakaoPayService.payReady(name, totalPrice,orderName);
        log.info("✅ tid: {}", readyResponse.getTid());

        // 세션에 결제 고유번호(TID) 저장
        session.setAttribute("tid", readyResponse.getTid());

        // ✅ 추가: 세션에 주문 정보 저장
        session.setAttribute("orderName", name);
        session.setAttribute("orderTotalPrice", totalPrice);

        log.info("✅ 결제 고유번호: {}", readyResponse.getTid());

        return readyResponse;
    }

    @GetMapping("/pay/completed")
    public String payCompleted(@RequestParam("pg_token") String pgToken,
    		@RequestParam("totalPrice") int totalPrice,
    		@RequestParam("orderName") String orderName,
    		@RequestParam("name") String name,
    		HttpSession session, Model model) {
        log.info("✅ 결제 승인 요청을 인증하는 토큰: {}", pgToken);


        // ✅ 세션에서 주문 정보 불러오기


        // ✅ 로그 출력 (값이 정상적으로 있는지 확인)
        log.info("✅ 주문자 이름: {}", name);
        log.info("✅ 세션에서 불러온 주문 이름: {}", orderName);
        log.info("✅ 세션에서 불러온 주문 금액: {}", totalPrice);

        // ✅ JSP에 전달
        model.addAttribute("orderName", orderName);
        model.addAttribute("orderTotalPrice", totalPrice);
        model.addAttribute("pgToken", pgToken);

        return "shop/paycomplete";  // ✅ JSP로 이동하여 모달 표시
    }

    @PostMapping("/payCrrncy/ready")
    @ResponseBody
    public ReadyResponse payCrrncy(
            @RequestParam("name") String name,
            @RequestParam("memId") String memId,
            @RequestParam("amount") int amount,
            @RequestParam("cost") int cost,
            HttpSession session) {

        log.info("✅ 주문 상품 이름: {}", name);
        log.info("✅ 주문 금액: {}", amount);
        log.info("✅ memId: {}", memId);
        log.info("✅ cost: {}", cost);
        // 카카오 결제 준비하기

//      // ✅ 추가: 세션에 주문 정보 저장
      session.setAttribute("name", name);
      session.setAttribute("amount", amount);
      session.setAttribute("memId", memId);
      session.setAttribute("cost", cost);

      String memIdr = (String) session.getAttribute("memId");
      Integer costr = (Integer) session.getAttribute("cost");


      log.info("✅ 충전 대상자: {}", memIdr);
      log.info("✅ 충전 금액: {}", costr);
        ReadyResponse readyResponse = kakaoPayService.payReady(name, amount,memId,cost);
        log.info("✅ tid: {}", readyResponse.getTid());
//
//        // 세션에 결제 고유번호(TID) 저장
        session.setAttribute("tid", readyResponse.getTid());
//
//        // ✅ 추가: 세션에 주문 정보 저장
//        session.setAttribute("memId", memId);
//        session.setAttribute("cost", cost);
//
        log.info("✅ 결제 고유번호: {}", readyResponse.getTid());

        return readyResponse;
    }

    @GetMapping("/payCrrncy/completed")
    public String payCrrncyCompleted(@RequestParam("pg_token") String pgToken,
    		@RequestParam("cost") int cost,
    		@RequestParam("memId") String memId, HttpSession session, Model model) {
        log.info("✅ 결제 승인 요청을 인증하는 토큰: {}", pgToken);
        log.info("✅ 맴버 정보", cost);


        // ✅ 세션에서 주문 정보 불러오기
        String name = (String) session.getAttribute("name");
        Integer amount = (Integer) session.getAttribute("amount");
//        String memId = (String) session.getAttribute("memId");

        // ✅ 로그 출력 (값이 정상적으로 있는지 확인)
        log.info("✅ 세션에서 불러온 주문 이름: {}", name);
        log.info("✅ 세션에서 불러온 주문 금액: {}", amount);
        log.info("✅ 충전 대상자: {}", memId);
        log.info("✅ 충전 금액: {}", cost);

        // ✅ JSP에 전달
        model.addAttribute("orderName", name);
        model.addAttribute("orderTotalPrice", amount);
        model.addAttribute("pgToken", pgToken);

        HashMap<String, Object> map=new HashMap<>();
       map.put("memId", memId);
       map.put("cost", cost);
        mypageService.chargeCrrncy(map);
        return "mypage/payCrrncycomplete";  // ✅ JSP로 이동하여 모달 표시
    }


}
