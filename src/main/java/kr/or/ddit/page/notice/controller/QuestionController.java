package kr.or.ddit.page.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.notice.service.QuestionService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.GroupNoticeVO;
import kr.or.ddit.vo.QuestionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class QuestionController {

	@Autowired
	QuestionService questionService;

	/**
	 * 고객센터 게시판
	 * @return
	 */
	@GetMapping("/question")
	public String question(Model model) {

		// 모델 주입
		List<QuestionVO> questionVOList = this.questionService.questionAllList();
		log.info("고객센터 리스트 가져오기(questionVOList) : " + questionVOList);

		model.addAttribute("questionVOList", questionVOList);

		return "notice/question";
	}

	@ResponseBody
	@PostMapping("/questionList")
	public ArticlePage<QuestionVO> questionList(@RequestBody Map<String, Object> map) {
		log.info("고객센터 리스트 파라미터(map) : " + map);

		// 고객센터 리스트
	    List<QuestionVO> questionAllList = this.questionService.questionList(map);
	    log.info("고객센터 리스트(questionAllList) : " + questionAllList);

	    // 고객센터 리스트 총 갯수
	    int total = this.questionService.getTotal(map);//map
	    log.info("고객센터 리스트 총 갯수(total) : " + total);

	    int currentPage = 1; // 1페이지

	    // map.get("키") -> object 리턴
	    if(map.get("currentPage") != null) {
	 	   // map.get("currentPage") -> null
	 	   //							null.toString() -> 오류 발생
	 	   currentPage = Integer.parseInt(map.get("currentPage").toString());
	    }

	 	// 2. keyword
	    String keyword = ""; // 검색이 없는 것이 기본

	    if(map.get("keyword") != null) {
	 	   // map.get("currentPage") -> null
	 	   // 							null.toString() -> 오류 발생
	 	   keyword = map.get("keyword").toString();
	    }

	    //페이지 객체 생성
	    ArticlePage<QuestionVO> articlePage =
	 		   new ArticlePage<QuestionVO>(total, currentPage, 10, questionAllList
	 				   , keyword, "ajax");
	    log.info("listAjax -> articlePage : " + articlePage);

	    // 데이터 리턴 -> ResponseBody(Object->String)
	    return articlePage;
	}

	/**
	 * 고객센터 생성
	 * @param questionVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/createQuestion")
	public int createQuestion(@RequestBody QuestionVO questionVO) {
		log.info("고객센터 생성 파라미터(questionVO) : " + questionVO);
		return this.questionService.createQuestion(questionVO);
	}

	/**
	 * 고객센터 답변
	 * @param questionVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/answerQuestion")
	public QuestionVO answerQuestion(@RequestBody QuestionVO questionVO) {
		return this.questionService.answerQuestion(questionVO);
	}

	/**
	 * 고객센터 답변 등록 및 상태 업데이트
	 * @param questionVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/managerAnswer")
	public int managerAnswer(@RequestBody QuestionVO questionVO) {

		int result = 0;
		// 고객센터 답변 등록
		result += this.questionService.managerAnswer(questionVO);
		// 답변 상태 업데이트
		result += this.questionService.questionState(questionVO);

		return result;
	}

	/**
	 * 문의 삭제(비활성화)
	 * @param questionVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteAnswer")
	public int deleteAnswer(@RequestBody QuestionVO questionVO) {

		// 비활성화
		int result = this.questionService.deleteAnswer(questionVO);

		return result;
	}

}


















