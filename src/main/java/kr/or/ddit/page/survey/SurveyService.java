package kr.or.ddit.page.survey;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.SurveyArticleVO;
import kr.or.ddit.vo.SurveyQuestionVO;
import kr.or.ddit.vo.SurveyResponseVO;
import kr.or.ddit.vo.SurveyVO;

public interface SurveyService {

	// 설문 상태
	// 설문 재시작
    int updateSurveyStatus(int srvyNo, int status);

//	int updateSurveyStatus(@Param("srvyNo") int srvyNo, @Param("status") int status);
	/*
	int startSurvey(@Param("srvyNo") int srvyNo, @Param("status") int status);

	// 설문 중지
	int stopSurvey(@Param("srvyNo") int srvyNo, @Param("status") int status);

	// 설문 종료
	int endSurvey(@Param("srvyNo") int srvyNo, @Param("status") int status);
	*/
	// 설문조사 리스트 조회
	public List<SurveyVO> getSurveyList(Map<String, Object> map);

	public int getTotal(Map<String, Object> map);

	// 설문 상세 조회
	public SurveyVO getSurveyDetail(@Param("srvyNo") int srvyNo);

	public SurveyVO getSurveyForm(@Param("srvyNo") int srvyNo);

	public SurveyVO getSurveyResponse(@Param("srvyNo") int srvyNo);

	// 설문 등록
	void createSurvey(SurveyVO surveyVO);

	// 설문 수정
	int updateSurvey(SurveyVO surveyVO);
//	public int updateSurvey(SurveyVO surveyVO);
//	public int updateQuestion(SurveyQuestionVO questionVO);
//	public int updateArticle(SurveyArticleVO articleVO);

//	int deleteSurvey(int srvyNo) throws Exception;

	// 설문 응답 삽입
	void submitResponses(List<SurveyResponseVO> responseList);

	// @@@ 설문 결과 조회 @@@@
	// 일자별 조회
	List<Map<String, Object>> getSurveyParticipationBySurvey(int srvyNo, String startDate, String endDate);

	// 종합 결과
	List<Map<String, Object>> getQuestionResponseStats(int srvyNo);

	int getSurveyTotalParticipants(int srvyNo);

	int deleteSurvey(int srvyNo) throws Exception;

	List<Map<String, Object>> getSurveyResponseData(int srvyNo);

	String getSurveyTitle(int srvyNo);
	
	// 참여자별 결과
	public List<Map<String, Object>> getResponse(SurveyVO syrveyVO);

	// 응답자 목록 조회
	public List<Map<String, Object>> getSurveyParticipants(int srvyNo);


	// 결과
//	List<Map<String, Object>> getSurveyResponseData(int srvyNo);


//	List<Map<String, Object>> getQuestionResponseStats(int srvyNo);

//	void insertResponses(@Param("responseList") List<SurveyResponseVO> responseList);

//	void submitResponses(List<SurveyResponseVO> responseList);

//	    void submitResponses(List<SurveyResponseVO> responseList); // 다중 응답 삽입

}
