package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ApprManVO {

	private int atrzManNo; // 결재자번호
	private int atrzDocNo; // 문서번호
	private int atrzLineNo; // 결재선번호
	private String atrzManSeq; // 결재순서
	private String atrzManId; // 결재자아이디
	private Date atrzManDate; // 결재일시
	private String atrzManResn; // 결재사유
	private int atrzManCode; // 결재상태코드
	private int atrzManType; // 결재 참조 구분
	
    private String memId;
    private int departNo;
    private String memPw;
    private String memEnable;
    private String memName;
    private int memGender;
    private String memRegDate;
    private String memEmail;
    private int fileGroupNo;
    private String memTel;
    private int posNo;
    private int addNo;
    private String memBir;
	
    
	
	
	// DEPARTMENT 테이블 기본 컬럼
	private String departName;
	private int departParent;
	// 회원 리스트
	private List<MemberVO> memberVOList;
	
	
	private String posName;
	private int posParent;
	
}

/*

<result property="atrzManNo" column="ATRZ_MAN_NO"/>
<result property="atrzDocNo" column="ATRZ_DOC_NO"/>
<result property="atrzLineNo" column="ATRZ_LINE_NO"/>
<result property="atrzManSeq" column="ATRZ_MAN_SEQ"/>
<result property="atrzManId" column="ATRZ_MAN_ID"/>
<result property="atrzManDate" column="ATRZ_MAN_DATE"/>
<result property="atrzManResn" column="ATRZ_MAN_RESN"/>
<result property="atrzManCode" column="ATRZ_MAN_CODE"/>
*/