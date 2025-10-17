package kr.or.ddit.page.event.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.event.service.EventService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.EventVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class EventController {

    @Autowired
    EventService service;

    @GetMapping("list")
    public String list(
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
            @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
            Model model) {
        
        Map<String, Object> map = new HashMap<>();
        map.put("keyword", keyword);
        map.put("currentPage", currentPage);
        
        int total = service.getTotal(map);
        List<EventVO> eventVOList = service.list(map);
        ArticlePage<EventVO> articlePage = new ArticlePage<>(total, currentPage, 10, eventVOList, keyword);
        
        model.addAttribute("eventVOList", eventVOList);
        model.addAttribute("articlePage", articlePage);
        
        return "event/list";
    }
    
    @GetMapping("companypage/noticeManage")
    public String list1(
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
            @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
            Model model) {
        
        Map<String, Object> map = new HashMap<>();
        map.put("keyword", keyword);
        map.put("currentPage", currentPage);
        
        int total = service.getTotal(map);
        List<EventVO> eventVOList = service.list(map);
        ArticlePage<EventVO> articlePage = new ArticlePage<>(total, currentPage, 10, eventVOList, keyword);
        
        model.addAttribute("eventVOList", eventVOList);
        model.addAttribute("articlePage", articlePage);
        
        return "companypage/goodsNoticeManage";
    }
    @ResponseBody
    @PostMapping("/list")
    public ArticlePage<EventVO> listAjax(@RequestBody Map<String, Object> map) {
        int total = service.getTotal(map);
        List<EventVO> eventVOList = service.list(map);
        int currentPage = map.getOrDefault("currentPage", 1) instanceof Integer ? (int) map.get("currentPage") : 1;
        String keyword = map.getOrDefault("keyword", "").toString();
        return new ArticlePage<>(total, currentPage, 10, eventVOList, keyword, "ajax");
    }

    @GetMapping("detail")
    public String detail(@RequestParam("evtBoardNo") int evtBoardNo, Model model) {
        EventVO eventDetail = service.detail(evtBoardNo);
        
        model.addAttribute("eventVO", eventDetail);
		log.info("detail->evtBoardNo : " + evtBoardNo);
		log.info("detail->eventDetail : " + eventDetail);
		
        return "event/detail";
    }
    @GetMapping("companypage/adminDetail")
    public String detail2(@RequestParam("evtBoardNo") int evtBoardNo, Model model) {
    	EventVO eventDetail = service.detail(evtBoardNo);
    	model.addAttribute("eventVO", eventDetail);
    	return "companypage/goodsNoticeDetail";
    }
    /*
	요청URI : 
       요청파라미터 :
       요청방식 : post
       
       속성이 하나일 때는 속성명을 생략할 수 있다.
	 */
	//골뱅이RequestMapping(value="/insertPost",method=RequestMethod.POST)
	@PostMapping("/insertPost")
	public String insertPost(EventVO eventVO) {
		/*
		BoardVO(boNo=0, boTitle=개똥이게임, boWriter=이정재, boContent=<p>개똥이게임2탄</p>
			  , boDate=null, boHit=0,uploadFile=파일객체)
		 */
		log.info("insertPost->boardVO : " + eventVO);
		log.info("insertPost->uploadFile : " + eventVO.getUploadFile());
		
		//1. 서비스레이어(Service, ServiceImpl)의 insertPost메서드 호출. 
		//			-> 퍼시스턴스 레이어(Mapper) -> 매퍼XML의 쿼리를 호출
		//   insert 후 리턴타입은 int result에 할당. log.info로 콘솔에 출력.
		int result = this.service.insertPost(eventVO);
		log.info("insertPost->boardVO : " + eventVO);

		log.info("insertPost->result : " + result);
		
		//1-2. form.jsp를 복사해서 detail.jsp를 생성
		
		//2. redirect : 새로운 URI요청
		return "redirect:companypage/adminDetail?evtBoardNo="+eventVO.getEvtBoardNo();		
	}
	
	// 게시글 수정
	@PostMapping("updatePost")
	public String updatePost(EventVO eventVO) {
	    log.info("updatePost->eventVO : " + eventVO);
	    int result = this.service.updatePost(eventVO);
	    log.info("updatePost->result : " + result);
	    return "redirect:/companypage/adminDetail?evtBoardNo=" + eventVO.getEvtBoardNo();
	}


	// 게시글 삭제
	@PostMapping("deletePost")
	public String deletePost(EventVO eventVO) {
	    log.info("deletePost->eventVO : " + eventVO);
	    
	    // DB 삭제 처리
	    int result = this.service.deletePost(eventVO);
	    
	    log.info("deletePost->result : " + result);
	    
	    // 목록 페이지로 리다이렉트
	    return "redirect:companypage/noticeManage";
	}
	   // 이벤트 등록 페이지 이동
    @GetMapping("event/form")
    public String form() {
        return "event/form"; // 이벤트 등록 페이지
    }
}
