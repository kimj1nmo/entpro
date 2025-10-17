package kr.or.ddit.page.companypage.managemember;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.EventVO;
import kr.or.ddit.vo.MemberVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/companypage/manageMember")
public class ManageMemberController {

	@Autowired
    private ManageMemberService service;

	@GetMapping("")
	public String manageMemberPage(
	        @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
	        @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
	        Model model) {
	    
	    // 검색 키워드와 현재 페이지를 담을 Map 생성
	    Map<String, Object> map = new HashMap<>();
	    map.put("keyword", keyword);
	    map.put("currentPage", currentPage);
	    
	    // 전체 회원 수 조회 (검색 포함)
	    int total = service.getTotal(map);
	    
	    // 회원 리스트 조회 (검색 및 페이징 처리)
	    List<MemberVO> memberVOList = service.list(map);
	    
	    // ArticlePage 객체 생성 (페이징 처리)
	    ArticlePage<MemberVO> articlePage = new ArticlePage<>(total, currentPage, 10, memberVOList, keyword);
	    
	    // Model 객체에 데이터 추가
	    model.addAttribute("memberVOList", memberVOList);
	    model.addAttribute("articlePage", articlePage);
	    
	    return "companypage/manageMember";
	} 
	// 회원 목록 조회 (페이징 및 검색)
	@ResponseBody
	@PostMapping("/list")
	public ArticlePage<MemberVO> listAjax(@RequestBody Map<String, Object> map) {
		// 전체 회원 수 조회 (검색 포함)
		int total = service.getTotal(map);
		// 회원 리스트 조회 (검색 및 페이징 처리)
		List<MemberVO> memberVOList = service.list(map);
	    // 현재 페이지와 검색어 추출
	    int currentPage = map.getOrDefault("currentPage", 1) instanceof Integer ? (int) map.get("currentPage") : 1;
	    String keyword = map.getOrDefault("keyword", "").toString();

//	    // 검색 키워드와 현재 페이지를 담을 Map 생성
//	    Map<String, Object> params = new HashMap<>();
//	    params.put("keyword", keyword);
//	    params.put("currentPage", currentPage);
	    
	    

	    // ArticlePage 객체 생성 (페이징 처리)
	    return new ArticlePage<>(total, currentPage, 10, memberVOList, keyword,"ajax");
	}



	// 회원 수정 요청
	@PostMapping("/update")
	public String updateMember(@RequestBody MemberVO memberVO) {
	    int result = this.service.updateMember(memberVO);
	    return "redirect:/companypage/manageMember";
	}
	
	// 탈퇴 처리 (회원 상태를 'n'으로 업데이트)
    @PostMapping("/delete")
    @ResponseBody
    public String updateMemberEnable(@RequestBody Map<String, String> params) {
        String memId = params.get("memId");

        // 서비스 호출하여 MEM_ENABLE을 'n'으로 업데이트
        boolean result = service.updateMemberEnable(memId);

        if (result) {
            return "회원이 정지 처리되었습니다.";
        } else {
            return "이미 정지된 회원입니다.";
        }
    }

//	// 회원 삭제 요청
//	@PostMapping("/update2")
//	public String deleteMember(@RequestBody MemberVO memberVO) {
//	    int result = this.service.deleteMember(memberVO);
//	    return "redirect:/companypage/manageMember";
//	}


}
