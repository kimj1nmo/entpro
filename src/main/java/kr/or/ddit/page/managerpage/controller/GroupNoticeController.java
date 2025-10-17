package kr.or.ddit.page.managerpage.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.managerpage.service.GroupNoticeService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.GroupNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/managepage")
@Controller
public class GroupNoticeController {
	
	@Autowired
	GroupNoticeService groupNoticeService;
	
	@GetMapping("/groupNotice")
	public String groupNotice(Model model) {
		
		// 모든 공지사항 리스트
		List<GroupNoticeVO> GroupNoticeVOAll = this.groupNoticeService.getAllList();
		log.info("모든 공지사항 리스트(GroupNoticeVOAll) : " + GroupNoticeVOAll);
		
		model.addAttribute("GroupNoticeVOAll", GroupNoticeVOAll);
		
		return "managepage/groupNotice";
	}
	
	@ResponseBody
	@PostMapping("/groupNoticeList")
	public ArticlePage<GroupNoticeVO> groupNoticeList(@RequestBody Map<String, Object> map) {
		log.info("그룹별 공지사항 리스트 파라미터(map) : " + map);
		   
		// 그룹별 공지사항 리스트
	    List<GroupNoticeVO> groupNoticeVOList = this.groupNoticeService.getList(map);
	    log.info("그룹별 공지사항 리스트(groupNoticeVOList) : " + groupNoticeVOList);
	    
	    // 그룹별 공지사항 리스트 총 갯수
	    int total = this.groupNoticeService.getTotal(map);//map
	    log.info("그룹별 공지사항 리스트 총 갯수(groupNoticeVOList) : " + groupNoticeVOList);
	    
	    int currentPage = 1; // 1페이지
	 		   
	    // map.get("키") -> object 리턴
	    if(map.get("currentPage") != null) {
	 	   // map.get("currentPage") -> null
	 	   //							null.toString() -> 오류 발생
	 	   currentPage = Integer.parseInt(map.get("currentPage").toString()); 
	    }
	    
//	 	    2. keyword
	    String keyword = ""; // 검색이 없는 것이 기본
	    
	    if(map.get("keyword") != null) {
	 	   // map.get("currentPage") -> null
	 	   // 							null.toString() -> 오류 발생
	 	   keyword = map.get("keyword").toString();
	    }
	    
	    //페이지 객체 생성
	    ArticlePage<GroupNoticeVO> articlePage = 
	 		   new ArticlePage<GroupNoticeVO>(total, currentPage, 10, groupNoticeVOList
	 				   , keyword, "ajax");		
	    log.info("listAjax -> articlePage : " + articlePage);
	    
	    // 데이터 리턴 -> ResponseBody(Object->String)
	    return articlePage;
	}
	
	/**
	 * 공지사항 create
	 * @param groupNoticeVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/createGroupNotice")
	public int createGroupNotice(@RequestBody GroupNoticeVO groupNoticeVO) {
		log.info("그룹공지사항 생성 파라미터(groupNoticeVO) : " + groupNoticeVO);
		
		// 그룹공지사항 생성
		int result = this.groupNoticeService.createGroupNotice(groupNoticeVO);
		log.info("그룹공지사항 생성 결과(result) : " + result);
		
		return result;
	}
	
	/**
	 * 공지사항 delete
	 * @param groupNoticeVO
	 * @return
	 */
	@ResponseBody
	@DeleteMapping("/deleteGroupNotice")
	public int deleteGroupNotice(@RequestBody List<GroupNoticeVO> groupNoticeVOList) {
		log.info("그룹공지사항 삭제 파라미터(groupNoticeVOList) : " + groupNoticeVOList);
		
		int result = 0;
		for (GroupNoticeVO groupNoticeVO : groupNoticeVOList) {
			result += this.groupNoticeService.deleteGroupNotice(groupNoticeVO);
		}
		log.info("그룹공지사항 삭제 결과(result) : " + result);
		
		return result;
	}
	
	
}





























