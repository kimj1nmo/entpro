package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ApprLineVO {
	private int atrzLineNo; // 결재선번호
	private String atrzLineNm; // 결재선이름
	private Date regDate; // 등록일자
}

/*

<result property="atrzLineNo" column="ATRZ_LINE_NO"/>
<result property="atrzLineNm" column="ATRZ_LINE_NM"/>
<result property="regDate" column="REG_DATE"/>
 */

