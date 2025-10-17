package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ApprDocVO {
	private int    rnum;	
	private int atrzDocNo; // 문서번호
	private int atrzFormNo; // 문서양식번호
	private String atrzDocNm; // 제목
	private String atrzDocCn; // 내용
	private int atrzDocState; // 상태
	private Date atrzDocDt; // 작성일시
	private String atrzStep; // 결재단계
	private String atrzWriter;
	private int atrzPreserved;
	private String atrzSecurity;
	
	
	private int fileGroupNo;
	private FileGroupVO fileGroupVO;
	private MemberVO memberVO;
	
	private String departName;
	
	private ApprAttrVO apprAttrVO;
    private ApprLineVO apprLineVO;       // 결재선 정보 포함
    private List<ApprManVO> apprManList; // 결재자 리스트 포함
	
    private int atrzLineNo; // 결재선 번호 (추가된 필드)
	private ApprManVO apprManVO;
	
}

/*

<result property="atrzDocNo" column="ATRZ_DOC_NO"/>
<result property="atrzFormNo" column="ATRZ_FORM_NO"/>
<result property="atrzDocNm" column="ATRZ_DOC_NM"/>
<result property="atrzDocCn" column="ATRZ_DOC_CN"/>
<result property="atrzDocState" column="ATRZ_DOC_STATE"/>
<result property="atrzDocDt" column="ATRZ_DOC_DT"/>
<result property="atrzStep" column="ATRZ_STEP"/>
<result property="atrzWriter" column="ATRZ_WRITER"/>
<result property="fileGroupNo" column="FILE_GROUP_NO"/>
<result property="atrzPreserved" column="ATRZ_PRESERVED"/>
<result property="atrzSecurity" column="ATRZ_SECURITY"/>
 */
