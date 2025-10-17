package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ApprFormVO {
	private int atrzFormNo; // 문서양식번호
	private String atrzFormNm; // 양식명칭
	private String atrzFormCn; // 양식내용
}

/*

<result property="atrzFormNo" column="ATRZ_FORM_NO"/>
<result property="atrzFormNm" column="ATRZ_FORM_NM"/>
<result property="atrzFormCn" column="ATRZ_FORM_CN"/>
 */
