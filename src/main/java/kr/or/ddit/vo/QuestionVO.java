package kr.or.ddit.vo;

import lombok.Data;

@Data
public class QuestionVO {
	private int rnum;
	private int qstnNo;
	private String qstnTtl;
	private String qstnCn;
	private int fileGroupNo;
	private String qstnDate;
	private int qstnYn;
	private String memId;
	// 고객센터 카테고리 이름
	private String qstnCtgryNm;
	// 고객센터 카테고리 번호
	private int qstnCtgryNo;
	
	// ANSWER 테이블
	private String ansTtl;
	private String ansCn;
	private String ansDate;
	private String ansMemId;
}
