package kr.or.ddit.page.comm;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.comm.membership.MembershipService;
import kr.or.ddit.security.CustomUser;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/{groupNo}")
@Slf4j
@Controller
public class MembershipController {

	@Autowired
	PostService postService;
	
	@Autowired
	MembershipService membershipService;
	
	@GetMapping("/membership")
	public String membership(@PathVariable int groupNo, Model model, @AuthenticationPrincipal CustomUser customUser) {
		log.info("멤버십: groupNo={}", groupNo);
		
		// 로그인된 사용자 정보 가져오기
		MemberVO loginUser = (customUser != null) ? customUser.getMember() : null;
		String userId = (customUser != null && customUser.getMember() != null) ? customUser.getMember().getMemId()
				: null;
		log.info("customUser: {}", customUser);

		// 멤버십 가입 상태 확인
	    boolean isMembershipActive = membershipService.isMembershipActive(groupNo, userId);
	    log.info("로그인 유저 loginUser", loginUser);
	    log.info("로그인 유저 userId", userId);
	    log.info("멤버십 가입 유무", isMembershipActive);
	    
		// groupName 전달
	    String groupName = postService.getGroupName(groupNo);
	    model.addAttribute("groupName", groupName);
		model.addAttribute("groupNo", groupNo);
		
		// 멤버십 가입 상태
	    model.addAttribute("isMembershipActive", isMembershipActive);
		return "comm/membership";

	}
	
	@GetMapping("/joinmembership")
	public String joinmembership(@PathVariable int groupNo, Model model) {
		log.info("멤버십 가입: groupNo={}", groupNo);
		
		// groupName 전달
		String groupName = postService.getGroupName(groupNo);
		model.addAttribute("groupName", groupName);
		
		model.addAttribute("groupNo", groupNo);
		return "comm/joinmembership";
		
	}
	@PostMapping("/registerMembership")
	@ResponseBody
	public Map<String, String> registerMembership(
	    @PathVariable int groupNo, 
	    @RequestParam String memId,
	    @RequestParam int memshipNo
	) {
	    log.debug("Received groupNo: {}", groupNo);
	    log.debug("Received memId: {}", memId);
	    log.debug("Received memshipNo: {}", memshipNo);

	    Map<String, String> response = new HashMap<>();

	    boolean result = membershipService.registerMembership(groupNo, memId);

	    if (!result) {
	        response.put("status", "fail");
	        response.put("message", "젤리가 부족합니다.");
	        return response;
	    }

	    response.put("status", "success");
	    response.put("message", "멤버십 가입 성공!");
	    return response;
	}



	
	@GetMapping("/media")
	public String media(@PathVariable int groupNo, Model model) {
		log.info("멤버십 미디어: groupNo={}", groupNo);
		
		// groupName 전달
	    String groupName = postService.getGroupName(groupNo);
	    model.addAttribute("groupName", groupName);
	    
		model.addAttribute("groupNo", groupNo);
		return "comm/media";

	}

}
