package kr.or.ddit.page.survey;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.vo.SurveyArticleVO;
import kr.or.ddit.vo.SurveyQuestionVO;
import kr.or.ddit.vo.SurveyResponseVO;
import kr.or.ddit.vo.SurveyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	SurveyMapper surveyMapper;

	// 설문 상태
	public int updateSurveyStatus(int srvyNo, int status) {
		return surveyMapper.updateSurveyStatus(srvyNo, status);
	}
	// 시작
	/*
	public int startSurvey(int srvyNo, int status) {
		return surveyMapper.startSurvey(srvyNo, status);
	}
	//중지
	public int stopSurvey(int srvyNo, int status) {
		return surveyMapper.stopSurvey(srvyNo, status);
	}
	//종료
	public int endSurvey(int srvyNo, int status) {
		return surveyMapper.endSurvey(srvyNo, status);
	}*/

	// 설문조사 리스트 조회
	@Override
	public List<SurveyVO> getSurveyList(Map<String, Object> map) {
		return this.surveyMapper.getSurveyList(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.surveyMapper.getTotal(map);
	}

	@Override
	public SurveyVO getSurveyDetail(int srvyNo) {
		return this.surveyMapper.getSurveyDetail(srvyNo);
	}

	@Override
	public SurveyVO getSurveyForm(int srvyNo) {
		return this.surveyMapper.getSurveyDetail(srvyNo);
	}

	@Override
	public SurveyVO getSurveyResponse(int srvyNo) {
		return this.surveyMapper.getSurveyDetail(srvyNo);
	}

	@Override
	public void createSurvey(SurveyVO surveyVO) {
		surveyMapper.insertSurvey(surveyVO);

		for (SurveyQuestionVO question : surveyVO.getSurveyQuestionVOList()) {
			question.setSrvyNo(surveyVO.getSrvyNo());
			surveyMapper.insertQuestion(question);

			for (SurveyArticleVO article : question.getSurveyArticleVOList()) {
				article.setSrvyQstnNo(question.getSrvyQstnNo());
				surveyMapper.insertArticle(article);
			}
		}
	}

	@Transactional
	@Override
	public int updateSurvey(SurveyVO surveyVO) {
		int result = surveyMapper.updateSurvey(surveyVO);

		// 질문 업데이트
		if (surveyVO.getSurveyQuestionVOList() != null) {
			for (SurveyQuestionVO questionVO : surveyVO.getSurveyQuestionVOList()) {
				int questionResult = surveyMapper.updateQuestion(questionVO);

				// 항목 업데이트
				if (questionVO.getSurveyArticleVOList() != null) {
					for (SurveyArticleVO articleVO : questionVO.getSurveyArticleVOList()) {
						int articleResult = surveyMapper.updateArticle(articleVO);
						result += articleResult;
					}
				}

				result += questionResult;
			}
		}

		return result;
	}

	@Override
	public int deleteSurvey(int srvyNo) throws Exception {
		return surveyMapper.deleteSurvey(srvyNo);
	}

	// 설문 응답
	@Override
	public void submitResponses(List<SurveyResponseVO> responseList) {
		if (responseList == null || responseList.isEmpty()) {
			throw new IllegalArgumentException("응답 리스트가 비어 있습니다.");
		}

		for (SurveyResponseVO response : responseList) {
			surveyMapper.insertResponse(response); // 단일 응답 삽입
		}
	}

	// @@@@ 설문 결과 조회 @@@@
	// 설문 결과 일자별 조회
	@Override
	public List<Map<String, Object>> getSurveyParticipationBySurvey(int srvyNo, String startDate, String endDate) {
		return surveyMapper.getSurveyParticipationBySurvey(srvyNo, startDate, endDate);
	}

	// 종합 결과

	@Override
	public List<Map<String, Object>> getQuestionResponseStats(int srvyNo) {
		return surveyMapper.getQuestionResponseStats(srvyNo);
	}

	// 참여자 수 조회
	@Override
	public int getSurveyTotalParticipants(int srvyNo) {
		return surveyMapper.getSurveyTotalParticipants(srvyNo);
	}
	
	//결과
	@Override
	public List<Map<String, Object>> getSurveyResponseData(int srvyNo) {
	    List<Map<String, Object>> responseData = surveyMapper.getSurveyResponseData(srvyNo);
	    System.out.println("Survey Response Data: " + responseData); // 데이터 로깅
	    return responseData;
	}
	
	@Override
	public String getSurveyTitle(int srvyNo) {
	    // getSurveyDetail 또는 getSurveyForm을 호출하여 설문 제목 가져오기
	    SurveyVO survey = surveyMapper.getSurveyDetail(srvyNo);
	    return survey != null ? survey.getSrvyTtl() : null;
	}
	
	// 참여자별 결과
	@Override
	public List<Map<String, Object>> getResponse(SurveyVO surveyVO) {
	    return this.surveyMapper.getResponse(surveyVO);
	}

	// 응답자 목록 조회
	@Override
	public List<Map<String, Object>> getSurveyParticipants(int srvyNo) {
	    return this.surveyMapper.getSurveyParticipants(srvyNo);
	}

	
//	    public void insertResponses(@Param("responseList") List<SurveyResponseVO> responseList) {
//	        if (responseList == null || responseList.isEmpty()) {
//	            throw new IllegalArgumentException("응답 리스트가 비어 있습니다.");
//	        }
//
//	        // Mapper 호출
//	        surveyMapper.insertResponses(responseList);
//	    }
//	    @Override
//	    public void submitResponses(List<SurveyResponseVO> responseList) {
//	        for (SurveyResponseVO response : responseList) {
//	            // 응답 삽입
//	            surveyMapper.insertResponse(response);
//	        }
//	    }
}
