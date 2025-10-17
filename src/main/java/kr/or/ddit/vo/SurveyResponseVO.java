package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class SurveyResponseVO {
	
	private int srvyRspnsNo;	// 설문 응답 번호
	private int srvyArtclNo;	// 설문 항목 번호
	private String memId;		// 설문 응답자
	private String srvyRspnsCn;	// 응답 내용
	private Date srvyCnDate;	// 응답일

}
