package kr.or.ddit.page.survey;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.SurveyArticleVO;
import kr.or.ddit.vo.SurveyQuestionVO;
import kr.or.ddit.vo.SurveyResponseVO;
import kr.or.ddit.vo.SurveyVO;

@Mapper
public interface SurveyMapper {

	// 설문 상태
	int updateSurveyStatus(@Param("srvyNo") int srvyNo, @Param("status") int status);
	/*
	 * // 설문 재시작 int startSurvey(@Param("srvyNo") int srvyNo, @Param("status") int
	 * status); // 설문 중지 int stopSurvey(@Param("srvyNo") int
	 * srvyNo, @Param("status") int status); // 설문 종료 int endSurvey(@Param("srvyNo")
	 * int srvyNo, @Param("status") int status);
	 */

	// 설문조사 리스트 조회
	public List<SurveyVO> getSurveyList(Map<String, Object> map);

	public int getTotal(Map<String, Object> map);

	// 설문 상세 조회
	public SurveyVO getSurveyDetail(@Param("srvyNo") int srvyNo);

	// 설문 상세 조회
	public SurveyVO getSurveyForm(@Param("srvyNo") int srvyNo);

	public SurveyVO getSurveyResponse(@Param("srvyNo") int srvyNo);

	// 설문 등록
	void createSurvey(SurveyVO surveyVO);

	// 설문 등록
	void insertSurvey(SurveyVO surveyVO); // 설문 등록

	void insertQuestion(SurveyQuestionVO questionVO); // 질문 등록

	void insertArticle(SurveyArticleVO articleVO); // 항목 등록

	// 설문 수정
	public int updateSurvey(SurveyVO surveyVO);

	public int updateQuestion(SurveyQuestionVO questionVO);

	public int updateArticle(SurveyArticleVO articleVO);

	// 설문 삭제
	public int deleteSurvey(@Param("srvyNo") int srvyNo);

	// 단일 응답 삽입
	void insertResponse(SurveyResponseVO response);

	// @@@ 설문 결과 조회 @@@
	// 일자별 응답
	public List<Map<String, Object>> getSurveyParticipationBySurvey(@Param("srvyNo") int srvyNo,
			@Param("startDate") String startDate, @Param("endDate") String endDate);

	// 종합 결과
	List<Map<String, Object>> getQuestionResponseStats(@Param("srvyNo") int srvyNo);

	// 참여자 수 조회
	int getSurveyTotalParticipants(@Param("srvyNo") int srvyNo);

	// 결과
	List<Map<String, Object>> getSurveyResponseData(int srvyNo);

	// 참여자별 결과
	public List<Map<String, Object>> getResponse(SurveyVO syrveyVO);
	
	// 응답자 목록 조회
	public List<Map<String, Object>> getSurveyParticipants(int srvyNo);


//	void insertResponses(@Param("responseList") List<SurveyResponseVO> responseList);

//    void submitResponses(List<SurveyResponseVO> responseList); // 다중 응답 삽입

}
