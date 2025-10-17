package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class SurveyArticleVO {
	private int srvyArtclNo;		//설문 항목 번호
	private int srvyQstnNo;			// 설문 질문 번호
	private int srvyArtclOrder;		// 항목 순서
	private String srvyArtclCn;		// 항목 내용
	
	 // 설문 응답 리스트 (1:N 관계)
    private List<SurveyResponseVO> surveyResponseVOList;
}
