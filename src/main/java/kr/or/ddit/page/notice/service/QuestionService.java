package kr.or.ddit.page.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.QuestionVO;

public interface QuestionService {

	// 모델 주입
	public List<QuestionVO> questionAllList();
	// 고객센터 리스트
	public List<QuestionVO> questionList(Map<String, Object> map);
	// 고객센터 리스트 총 갯수
	public int getTotal(Map<String, Object> map);
	// 고객센터 생성
	public int createQuestion(QuestionVO questionVO);
	// 고객센터 답변
	public QuestionVO answerQuestion(QuestionVO questionVO);
	// 고객센터 답변 등록
	public int managerAnswer(QuestionVO questionVO);
	// 답변 상태 업데이트
	public int questionState(QuestionVO questionVO);
	// 비활성화
	public int deleteAnswer(QuestionVO questionVO);

}
