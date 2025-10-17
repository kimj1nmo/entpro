package kr.or.ddit.page.mypage;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.GoodsPaymentVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.OrderInfoVO;
import kr.or.ddit.vo.OrderListVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/mypage")
@Slf4j
@Controller
public class mypageController {

	@Autowired
	mypageService mypageService;

	@GetMapping("/")
	public String main() {
		log.info("메인페이지");

		return "mypage/main";
	}

	@GetMapping("/address")
	public String address() {
		log.info("address페이지");

		return "mypage/address";
	}

	@GetMapping("/myProfile")
	public String myProfile() {
		log.info("myProfile페이지");

		return "mypage/myProfile";
	}


	// 각 가입 정보 가져오기
	@ResponseBody
	@PostMapping("/getListSumAjax")
	public Map<String, Object> getListSumAjax(@RequestBody Map<String, Object> map) {
		Map<String, Object> result = new HashMap<>();

		int commTotal = mypageService.getCommTotal(map);
		int memshipTotal = mypageService.getMemshipTotal(map);
		map.put("commTotal", commTotal);
		map.put("memshipTotal", memshipTotal);
		return map; // 페이지네이션 데이터를 반환
	}

	//커뮤니티 리스트 가져오기
	@ResponseBody
	@PostMapping("/getCommListmAjax")
	public List<GroupsVO> getCommList(@RequestBody Map<String, Object> map) {
		List<GroupsVO> result = mypageService.getCommList(map);
		return result;
	}

	//맴버쉽 리스트 가져오기
	@ResponseBody
	@PostMapping("/getMemShipListmAjax")
	public List<GroupsVO> getMemShipList(@RequestBody Map<String, Object> map) {
		List<GroupsVO> result = mypageService.getMemShipList(map);
		return result;
	}

	//주소 리스트 가져오기
	@ResponseBody
	@PostMapping("/addressList")
	public List<GroupsVO> addressList(@RequestBody Map<String, Object> map) {
		List<GroupsVO> result = mypageService.addressList(map);
		return result;
	}


	//주소 리스트 추가하기
	@ResponseBody
	@PostMapping("/addAddressAjax")
	public int addAddressAjax(AddressVO addressVO) {
		log.info("addAddressAjax->addressVO : " + addressVO);
		int result = mypageService.addAddressAjax(addressVO);

		return result; // 실제 데이터 반환
	}

	//주소 업데이트하기
	@ResponseBody
	@PostMapping("/UpdateAddressAjax")
	public int UpdateAddressAjax(AddressVO addressVO) {
		log.info("UpdateAddressAjax->addressVO : " + addressVO);
		int result = mypageService.UpdateAddressAjax(addressVO);

		return result; // 실제 데이터 반환
	}

	// 주소 삭제하기
	@ResponseBody
	@PostMapping("/addressDetailAjax")
	public AddressVO addressDetailAjax(@RequestBody Map<String, Object> map) {
		int addNo = (int) map.get("addNo");
		int sn = (int) map.get("sn");
		log.info("addressDetailAjax->addNo : " + addNo);
		log.info("addressDetailAjax->sn : " + sn);
		AddressVO addressVO = mypageService.addressDetail(map);
		log.info("addressDetailAjax->addressVO : " + addressVO);

		return addressVO; // 실제 데이터 반환
	}

	// 주소 미리 가져오기
	@ResponseBody
	@PostMapping("/addressDelAjax")
	public int addressDelAjax(@RequestBody Map<String, Object> map) {
		int addNo = (int) map.get("addNo");
		int sn = (int) map.get("sn");
		log.info("addressDelAjax->addNo : " + addNo);
		log.info("addressDelAjax->sn : " + sn);
		int result = mypageService.addressDelAjax(map);
		log.info("addressDelAjax->result : " + result);

		return result; // 실제 데이터 반환
	}
// 회원 프로필 가져오기
	@ResponseBody
	@PostMapping("/myProfileAjax")
	public MemberVO myProfileAjax(@RequestBody Map<String, Object> map) {

		MemberVO memberVO =mypageService.myProfileAjax(map);
		return memberVO;
	}
	//회원 주소번호 가져오기
	@ResponseBody
	@PostMapping("/getMemberAddNO")
	public MemberVO getMemberAddNO(@RequestBody Map<String, Object> map) {

		MemberVO memberVO =mypageService.getMemberAddNO(map);
		log.info("getMemberAddNO	->memberVO : " + memberVO);

		return memberVO;
	}
	//회원 프로필 변경
	@ResponseBody
	@PostMapping("/memProfileUpdat")
	public int memProfileUpdat(@RequestBody Map<String, Object> map) {

		int result =mypageService.memProfileUpdat(map);
		return result;
	}
	//회원 탈퇴하기
	@ResponseBody
	@PostMapping("/deleteMemberAjax")
	public int deleteMemberAjax(@RequestBody Map<String, Object> map) {
		log.info("deleteMemberAjax->map : " + map);

		int result =mypageService.deleteMemberAjax(map);
		return result;
	}
	//전자화폐 충전 페이지
	@GetMapping("/chargeCrrncy")
	public String chargeCrrncy() {
		log.info("chargeCrrncy페이지");

		return "mypage/chargeCrrncy";
	}
	//전자화폐 충전 종료
	@GetMapping("/payCrrncycomplete")
	public String payCrrncycomplete() {
		log.info("payCrrncycomplete페이지");

		return "mypage/payCrrncycomplete";
	}

	//전자화폐 구매
	@ResponseBody
	  @Transactional
	    @PostMapping("/chargeAmount")
	    public String chargeAmount(
	    		@RequestBody Map<String, Object> map,
	            Model model) {
		  int cost=(int) map.get("cost");
		  int amount=(int) map.get("amount");
	        String memId =  (String) map.get("memId");;
	        log.info("memId={}cost={}amount={}",memId,cost,amount);

//			return memId;


	        try {


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
	            // 결제 정보 저장

	            // cartState 업데이트

	            // ✅ **카카오페이 결제 로직 추가**
	                log.info("카카오페이 결제 선택됨. payReady API 호출 중...");

	                RestTemplate restTemplate = new RestTemplate();
	                String kakaoPayUrl = ip+"/order/payCrrncy/ready";
	        		log.info("kakaoPayUrl {}",kakaoPayUrl);

	                // 요청 파라미터 설정 (form-urlencoded 형식)
	                MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
	                params.add("memId",memId);
	                params.add("name","젤리충전"+amount+"개");
	                params.add("cost", String.valueOf(cost));
	                params.add("amount", String.valueOf(amount));

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
	                    return "mypage/chargeCrrncy";
	                }


	        } catch (Exception e) {
	            log.error("결제 처리 중 오류 발생", e);
	            model.addAttribute("error", "주문 처리 중 오류가 발생했습니다.");
	            return "mypage/chargeCrrncy";
	        }
	    }
}
