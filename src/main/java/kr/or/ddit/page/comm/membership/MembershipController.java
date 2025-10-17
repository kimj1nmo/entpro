//package kr.or.ddit.page.comm.membership;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@Controller
//@RequestMapping("/{groupNo}")
//public class MembershipController {
//	
//	@Autowired
//	MembershipService membershipService;
//	
////	@GetMapping("/membership")
////	public String managemembership(Model model) {
////		log.info("멤버십 가입 페이지");
////
////		return "comm/membership";
////	}
//	
//	@PostMapping("/registerMembership")
//    public String registerMembership(
//        @RequestParam int commRegNo,
//        @RequestParam String memId
//    ) {
//        try {
//            boolean result = membershipService.registerMembership(commRegNo, memId);
//            return result ? "멤버십 가입 성공!" : "멤버십 가입 실패!";
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "오류: " + e.getMessage();
//        }
//    }
//	
//	
//}
