package kr.or.ddit.util;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

/*
카카오페이에 전송할 값들을 HashMap에 저장
(카카오페이 측에서 요청하는 Request Body Payload 중 Required 항목 필수 입력)
HttpEntity로 Map에 저장한 값들과 내 정보(getHeaders)를 담아서 카카오페이 통신
RestTemplate을 통해 카카오의 REST API를 호출
RestTemplate의 postForEntity() 메소드를 사용해 응답으로 받은 결과를 ResponseEntity의 getBody()로 받아서 반환
최종적으로 Controller에서 그 반환받은 ReadyResponse를 HTML(클라이언트)에게 전송
 */

@Slf4j
@Service
public class KakaoPayService {


    private String ip;

    public KakaoPayService() {
        this.ip = getLocalIpAddress();
        log.info("설정된 IP 주소: {}", this.ip);
    }


    private String getLocalIpAddress() {
        try {
            Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
            while (networkInterfaces.hasMoreElements()) {
                NetworkInterface networkInterface = networkInterfaces.nextElement();
                Enumeration<InetAddress> inetAddresses = networkInterface.getInetAddresses();
                while (inetAddresses.hasMoreElements()) {
                    InetAddress inetAddress = inetAddresses.nextElement();
                    if (inetAddress.isSiteLocalAddress() &&
                        networkInterface.getDisplayName().contains("RTL8852AE WiFi 6 802.11ax PCIe Adapter")) {
                        return "http://" + inetAddress.getHostAddress();
                    }
                }
            }
        } catch (Exception e) {
            log.error("IP 주소 설정 중 오류 발생", e);
        }
        return "http://localhost"; // 기본값 설정
    }

	// 카카오페이 결제창 연결
    public ReadyResponse payReady(String name, int totalPrice,String orderName) {

        Map<String, String> parameters = new HashMap<String, String>();
        parameters.put("cid", "TC0ONETIME");                                    // 가맹점 코드(테스트용)
        parameters.put("partner_order_id", "1234567890");                       // 주문번호
        parameters.put("partner_user_id", "roommake");                          // 회원 아이디
        parameters.put("item_name", name);                                      // 상품명
        parameters.put("quantity", "1");                                        // 상품 수량
        parameters.put("total_amount", String.valueOf(totalPrice));             // 상품 총액
        parameters.put("tax_free_amount", "0");                                 // 상품 비과세 금액
        parameters.put("approval_url", ip+"/order/pay/completed?name="+name+"&totalPrice="+totalPrice+"&orderName="+orderName); // 결제 성공 시 URL
        parameters.put("cancel_url", ip+"/order/pay/cancel");      // 결제 취소 시 URL
        parameters.put("fail_url", ip+"/order/pay/fail");          // 결제 실패 시 URL

        // HttpEntity : HTTP 요청 또는 응답에 해당하는 Http Header와 Http Body를 포함하는 클래스
        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

        // RestTemplate
        // : Rest 방식 API를 호출할 수 있는 Spring 내장 클래스
        //   REST API 호출 이후 응답을 받을 때까지 기다리는 동기 방식 (json, xml 응답)
        RestTemplate template = new RestTemplate();
        String url = "https://open-api.kakaopay.com/online/v1/payment/ready";
        log.info("url : " + url);
        // RestTemplate의 postForEntity : POST 요청을 보내고 ResponseEntity로 결과를 반환받는 메소드
        ResponseEntity<ReadyResponse> responseEntity = template.postForEntity(url, requestEntity, ReadyResponse.class);
        log.info("payReady->결제준비 응답객체: " + responseEntity.getBody());

        return responseEntity.getBody();
    }

    // 카카오페이 결제 승인
    // 사용자가 결제 수단을 선택하고 비밀번호를 입력해 결제 인증을 완료한 뒤,
    // 최종적으로 결제 완료 처리를 하는 단계
    public AproveResponse payApprove(String tid, String pgToken) {
        Map<String, String> parameters = new HashMap<>();
        parameters.put("cid", "TC0ONETIME");              // 가맹점 코드(테스트용)
        parameters.put("tid", tid);                       // 결제 고유번호
        parameters.put("partner_order_id", "1234567890"); // 주문번호
        parameters.put("partner_user_id", "roommake");    // 회원 아이디
        parameters.put("pg_token", pgToken);              // 결제승인 요청을 인증하는 토큰

        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

        RestTemplate template = new RestTemplate();
        String url = "https://open-api.kakaopay.com/online/v1/payment/approve";
        AproveResponse approveResponse = template.postForObject(url, requestEntity, AproveResponse.class);
        log.info("결제승인 응답객체: " + approveResponse);

        return approveResponse;
    }

    // 카카오페이 측에 요청 시 헤더부에 필요한 값
    private HttpHeaders getHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "SECRET_KEY DEVA108CCBBE506B92CE6D9108AF70B620695D3B");
        headers.set("Content-type", "application/json");

        return headers;
    }


    public ReadyResponse payReady(String name, int totalPrice,String memId,int cost) {

        Map<String, String> parameters = new HashMap<String, String>();
        parameters.put("cid", "TC0ONETIME");                                    // 가맹점 코드(테스트용)
        parameters.put("partner_order_id", "1234567890");                       // 주문번호
        parameters.put("partner_user_id", "roommake");                          // 회원 아이디
        parameters.put("item_name", name);                                      // 상품명
        parameters.put("quantity", "1");                                        // 상품 수량
        parameters.put("total_amount", String.valueOf(totalPrice));             // 상품 총액
        parameters.put("tax_free_amount", "0");                                 // 상품 비과세 금액
        parameters.put("approval_url", ip+"/order/payCrrncy/completed?cost="+cost+"&memId="+memId); // 결제 성공 시 URL
        parameters.put("cancel_url", ip+"/order/pay/cancel");      // 결제 취소 시 URL
        parameters.put("fail_url", ip+"/order/pay/fail");          // 결제 실패 시 URL

        // HttpEntity : HTTP 요청 또는 응답에 해당하는 Http Header와 Http Body를 포함하는 클래스
        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

        // RestTemplate
        // : Rest 방식 API를 호출할 수 있는 Spring 내장 클래스
        //   REST API 호출 이후 응답을 받을 때까지 기다리는 동기 방식 (json, xml 응답)
        RestTemplate template = new RestTemplate();
        String url = "https://open-api.kakaopay.com/online/v1/payment/ready";
        log.info("url : " + url);
        // RestTemplate의 postForEntity : POST 요청을 보내고 ResponseEntity로 결과를 반환받는 메소드
        ResponseEntity<ReadyResponse> responseEntity = template.postForEntity(url, requestEntity, ReadyResponse.class);
        log.info("payReady->결제준비 응답객체: " + responseEntity.getBody());

        return responseEntity.getBody();
    }
}
