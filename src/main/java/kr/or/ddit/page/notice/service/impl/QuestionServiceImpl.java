package kr.or.ddit.page.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.page.notice.mapper.QuestionMapper;
import kr.or.ddit.page.notice.service.QuestionService;
import kr.or.ddit.vo.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionMapper questionMapper;
	
	// 모델 주입
	@Override
	public List<QuestionVO> questionAllList() {
		return this.questionMapper.questionAllList();
	}

	// 고객센터 리스트
	@Override
	public List<QuestionVO> questionList(Map<String, Object> map) {
		return this.questionMapper.questionList(map);
	}

	// 고객센터 리스트 총 갯수
	@Override
	public int getTotal(Map<String, Object> map) {
		return this.questionMapper.getTotal(map);
	}

	// 고객센터 생성
	@Override
	public int createQuestion(QuestionVO questionVO) {
		return this.questionMapper.createQuestion(questionVO);
	}

	// 고객센터 답변
	@Override
	public QuestionVO answerQuestion(QuestionVO questionVO) {
		return this.questionMapper.answerQuestion(questionVO);
	}

	// 고객센터 답변 등록
	@Override
	public int managerAnswer(QuestionVO questionVO) {
		return this.questionMapper.managerAnswer(questionVO);
	}

	// 답변 상태 업데이트
	@Override
	public int questionState(QuestionVO questionVO) {
		return this.questionMapper.questionState(questionVO);
	}

	// 비활성화
	@Override
	public int deleteAnswer(QuestionVO questionVO) {
		return this.questionMapper.deleteAnswer(questionVO);
	}

}
