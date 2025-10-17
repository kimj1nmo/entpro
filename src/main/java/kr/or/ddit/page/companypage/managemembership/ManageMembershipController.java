package kr.or.ddit.page.companypage.managemembership;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.MembershipVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/companypage")
public class ManageMembershipController {
	
	@Autowired
	ManageMembershipService membershipService;
	
	@GetMapping("/managemembership")
	public String managemembership(Model model) {
		log.info("멤버십 관리 페이지");
		
		// 전체 멤버십 조회
		List<MembershipVO> membershipList = membershipService.getMembershipList();
		// 전체 멤버십 가입자 조회
		List<MembershipVO> signmembershipList = membershipService.signMembershipList();
		// 그룹 목록 조회
        List<GroupsVO> groupsList = membershipService.getAllGroups();

        model.addAttribute("membershipList", membershipList);
        model.addAttribute("signmembershipList", signmembershipList);
        model.addAttribute("groupsList", groupsList);
		return "companypage/manageMembership";
	}
	
	@GetMapping("/signmembership")
	public String signmembership(Model model) {
		log.info("멤버십 관리 페이지");
		List<MembershipVO> membershipList = membershipService.signMembershipList();
        model.addAttribute("membershipList", membershipList);
		return "companypage/manageMembership";
	}
	
	  @PostMapping("/memship")
	    @ResponseBody
	    public String registerMemship(@RequestBody MembershipVO membershipVO) {
	        try {
	        	membershipService.registerMemship(membershipVO);
	            return "멤버십 등록 성공!";
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "멤버십 등록 실패!";
	        }
	    }

	  @GetMapping("/groups")
	  @ResponseBody
	  public List<GroupsVO> getGroupList() {
	      log.info("그룹 목록 조회 요청");
	      return membershipService.getAllGroups();
	  }
	  
	// 그룹별 게시글 AJAX 요청 처리
		 @GetMapping("/groupmem")
		 @ResponseBody
		 public List<MembershipVO> getPostsByGroup(@RequestParam(name = "groupNo") int groupNo) {
		     if (groupNo == 0) {
		         return membershipService.signMembershipList(); // 전체 보기
		     }
		     return membershipService.listByGroupNo(groupNo); // 특정 그룹 게시글
		 }
	  
	  @PostMapping("/updateMembership")
	    public String updateMembership(
	        @RequestParam int memshipNo,
	        @RequestParam int groupNo,
	        @RequestParam String memshipNm,
	        @RequestParam int memshipAmount
	    ) {
	        boolean isUpdated = membershipService.updateMembership(memshipNo, groupNo, memshipNm, memshipAmount);
	        return isUpdated ? "멤버십 수정 성공!" : "멤버십 수정 실패!";
	    }
}
