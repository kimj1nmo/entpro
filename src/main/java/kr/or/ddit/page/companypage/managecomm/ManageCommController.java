package kr.or.ddit.page.companypage.managecomm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.vo.CommReportVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.GroupsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/companypage")
public class ManageCommController {


	@Autowired
	ManageCommService manageCommService;

	// 회원 관리 메인 페이지
	 @GetMapping("/manageComm")
	    public String list(@RequestParam(name = "groupNo", required = false) Integer groupNo, Model model) {
	        // 그룹별 게시글 조회
	        if (groupNo != null) {
	            model.addAttribute("groupNo", groupNo);
	            List<CommunityVO> communityVO = manageCommService.listByGroupNo(groupNo);
	            model.addAttribute("communityVO", communityVO);
	        } else {
	            List<CommunityVO> communityVO = manageCommService.listAll();
	            model.addAttribute("communityVO", communityVO);
	        }

	        // 모든 그룹 리스트 전달
	        List<GroupsVO> groupsList = manageCommService.getGroupsList();
	        model.addAttribute("groupsList", groupsList);

	        return "companypage/manageComm";
	    }
	// 그룹별 게시글 AJAX 요청 처리
	 @GetMapping("/group")
	 @ResponseBody
	 public List<CommunityVO> getPostsByGroup(@RequestParam(name = "groupNo") int groupNo) {
	     if (groupNo == 0) {
	         return manageCommService.listAll(); // 전체 보기
	     }
	     return manageCommService.listByGroupNo(groupNo); // 특정 그룹 게시글
	 }
	 
	// 신고된 게시글 리스트 출력
	 @GetMapping("/reportReply")
	 public String getReportedPosts(
	         @RequestParam(name = "groupNo", required = false, defaultValue = "0") int groupNo,
	         @RequestParam(name = "status", required = false, defaultValue = "all") String status,
	         Model model) {

	     List<CommReportVO> reportedPosts;

	     if ("all".equals(status)) {
	         if (groupNo == 0) {
	             reportedPosts = manageCommService.listAllReportedPosts();
	         } else {
	             reportedPosts = manageCommService.listReportedByGroupNo(groupNo);
	         }
	     } else {
	         int commReportYn = Integer.parseInt(status);
	         if (groupNo == 0) {
	             reportedPosts = manageCommService.listReportedByStatus(commReportYn);
	         } else {
	             reportedPosts = manageCommService.listReportedByGroupNoAndStatus(groupNo, commReportYn);
	         }
	     }

	     // 데이터를 모델에 추가
	     model.addAttribute("reportedPosts", reportedPosts);

	     // JSP 페이지 반환
	     return "companypage/reportReply";
	 }
	 
	// 그룹별 게시글 AJAX 요청 처리
		 @GetMapping("/groupreport")
		 @ResponseBody
		 public List<CommReportVO> reportedByGroupNo(@RequestParam(name = "groupNo") int groupNo) {
		     if (groupNo == 0) {
		         return manageCommService.reportAll(); // 전체 보기
		     }
		     return manageCommService.listReportedByGroupNo(groupNo); // 특정 그룹 게시글
		 }

		 
		 @ResponseBody
		    @PostMapping("/accessReport")
		    public int accessReport(@RequestBody Map<String, Object> requestBody) {
		        List<Integer> commNos = (List<Integer>) requestBody.get("commNos");
//		        int commReportAc = (int) requestBody.get("commReportAc"); // 1: 비공개 처리
		        log.info("accessReport -> commNos: " + commNos);
		        if (commNos == null || commNos.isEmpty()) {
		        	log.warn("No commNos received!");
		            return 0; // 처리할 게시글이 없을 경우
		        }

		        log.info("accessReport -> commNos: " + commNos);
//		        log.info("accessReport -> commReportAc: " + commReportAc);

		        int result = manageCommService.accessReport(commNos);
		        log.info("accessReport SQL 실행 결과: " + result);
		        return result;
		 }
	 
	 /*
	 @ResponseBody
		@RequestMapping(value="/listAjax",method=RequestMethod.POST)
		public ArticlePage<CommunityVO> listAjax(@RequestBody Map<String,Object> map) {
			//map{"currentPage":"1","keyword"="도서"}
			log.info("listAjax->map : " + map);
			
			//전체 행의 수 *******
			int total = this.manageCommService.getTotal(map);
			log.info("list->total : " + total);
			
			//map{currentPage=1,keyword=}
			List<CommunityVO> communityVO = this.manageCommService.list(map);
			log.info("list->lprodVOList : " + communityVO);
			
			//map.get("currentPage") : Object 타입
			int currentPage = Integer.parseInt(map.get("currentPage").toString());//Object->"1"->1
			String keyword = "";
			//검색어가 없을 수 있으므로 처리
			if(map.get("keyword")!=null) {
				keyword = map.get("keyword").toString();//"도서"
			}
			
			//페이지네이션
			ArticlePage<CommunityVO> articlePage 
				= new ArticlePage<CommunityVO>(total, currentPage, 
						10, communityVO, keyword);
			
			return articlePage;
		}
		*/

}
