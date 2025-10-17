package kr.or.ddit.page.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.notice.service.NoticeService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

//EnableMethodSecurity(securedEnabled = true, prePostEnabled = true)에 의해서
//.requestMatchers("/notice/**").hasAnyRole("GY","IS","JJ","GH","MR","GMJ") 뿐만 아니라
// 클래스 또는 메소드 레벨에서도 접근제한이 가능
@Slf4j
@Controller
@RequestMapping("/")
public class NoticeController {

	@Autowired
	NoticeService service;
	
	@GetMapping("notice")
	public String list() {
		return "notice/notice";
	}
	
//	@PreAuthorize("hasAnyRole('ROLE_GY','ROLE_IS','ROLE_JJ','ROLE_GH','ROLE_MR','ROLE_GMJ')")
//	@GetMapping("/notice")
//	public String list(
//			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
//			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
//			Model model) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("keyword", keyword);
//		map.put("currentPage", currentPage);
//		log.info("list->map : " + map);
//		
//		int total = this.service.getTotal(map);
//		
//		List<NoticeVO> noticeVOList = this.service.list(map);
//		ArticlePage<NoticeVO> articlePage
//			= new ArticlePage<NoticeVO>(total, currentPage, 10, noticeVOList, keyword);
//		
//		model.addAttribute("noticeVOList",noticeVOList);
//		model.addAttribute("articlePage",articlePage);
//		return "notice/list";
//	}
	
	//JSONString{"currentPage": 2,"keyword": "버스"}
	@ResponseBody
	@PostMapping("/listAjax")
	public ArticlePage<NoticeVO> listAjax(@RequestBody Map<String, Object> map) {
		//noticeAjax -> map : {currentPage=2, keyword=버스}
		//처음 검색 => map : {currentPage=1, keyword=버스}
		log.info("noticeAjax -> map : " + map);
		
		int total = this.service.getTotal(map);
		//noticeAjax -> total : 20
		log.info("noticeAjax -> total : " + total);
		
		List<NoticeVO> noticeVOList = this.service.list(map);
		log.info("noticeAjax -> noticeVOList : " + noticeVOList);
		
		int currentPage = 1;
		
		if(map.get("currentPage") != null) {
			currentPage = Integer.parseInt(map.get("currentPage").toString());
		}
		
		String keyword = "";
		
		if(map.get("keyword") != null) {
			keyword = map.get("keyword").toString();
		}
		
		ArticlePage<NoticeVO> articlePage = new ArticlePage<>(total, currentPage, 10, noticeVOList, keyword, "ajax");
		
		return articlePage;
	}
	//////////////////////////////////////////
		
//	@GetMapping("/company/notice")
//	public String comList() {
//		return "notice/companyNotice";
//	}
	
	
	@GetMapping("/companypage/notice")
	public String comlist(
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		log.info("list->map : " + map);
		
		int total = this.service.getTotal(map);
		
		List<NoticeVO> noticeVOList = this.service.list(map);
		ArticlePage<NoticeVO> articlePage
			= new ArticlePage<NoticeVO>(total, currentPage, 10, noticeVOList, keyword);
		
		model.addAttribute("noticeVOList",noticeVOList);
		model.addAttribute("articlePage",articlePage);
		return "notice/companyNotice";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@ResponseBody
	@PostMapping("/companypage/comListAjax")
	public ArticlePage<NoticeVO> comListAjax(@RequestBody Map<String, Object> map) {
		//noticeAjax -> map : {currentPage=2, keyword=버스}
		//처음 검색 => map : {currentPage=1, keyword=버스}
		log.info("noticeAjax -> map : " + map);
		
		int total = this.service.getTotal(map);
		//noticeAjax -> total : 20
		log.info("noticeAjax -> total : " + total);
		
		List<NoticeVO> noticeVOList = this.service.list(map);
		log.info("noticeAjax -> noticeVOList : " + noticeVOList);
		
		int currentPage = 1;
		
		if(map.get("currentPage") != null) {
		currentPage = Integer.parseInt(map.get("currentPage").toString());
		}
		
		String keyword = "";
		
		if(map.get("keyword") != null) {
		keyword = map.get("keyword").toString();
		}
		
		ArticlePage<NoticeVO> articlePage = new ArticlePage<>(total, currentPage, 10, noticeVOList, keyword, "ajax");
		
		return articlePage;
	}
	
	
	@ResponseBody
	@PostMapping("/companypage/createPostAjax")
	public int createPostAjax(@RequestParam NoticeVO noticeVO)
	{
		//NoticeVO(ntceBoardNo=0, ntceBoardTtl=1, ntceBoardCn=2, memId=null
		//, regDate=null, uploadFiles=[org.springframework.web.
		log.info("createPostAjax -> noticeVO : " + noticeVO);
		int result = this.service.createPostAjax(noticeVO);
		log.info("createPostAjax -> result : " + result);
		
		return result;
	}
	
	
	
	@ResponseBody
	@DeleteMapping("/companypage/deletePostAjax")
	public NoticeVO deletePostAjax(@RequestParam NoticeVO noticeVO) {
		log.info("deletePostAjax -> noticeVO : " + noticeVO);
		int result = this.service.deletePostAjax(noticeVO);
		log.info("deletePostAjax -> result : " + result);
		return noticeVO;
	
	}
	
	@ResponseBody
	@PostMapping("/companypage/updatePostAjax")
	public NoticeVO updatePostAjax(@RequestParam NoticeVO noticeVO) {
		log.info("updatePostAjax -> noticeVO : " + noticeVO);
		int result = this.service.updatePostAjax(noticeVO);
		log.info("updatePostAjax -> result : " + result);
		return noticeVO;
	}
}

