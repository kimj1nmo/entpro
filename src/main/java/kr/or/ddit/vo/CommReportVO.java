package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommReportVO {

	// 신고 테이블 필드
    private int commReportNo;    // 신고 번호
    private int commNo;          // 게시글 번호
    private String memId;        // 신고자 아이디
    private String commReportCn; // 신고 사유
    private int commReportYn;    // 처리 여부
    private Date commReportDt;   // 신고 일시
    private String commReportAc; // 조치 내용
    private String commReportAcDt; // 처리 일시

    // 추가 필드 (조인 결과)
    private String communityName;  // 커뮤니티명
    private String postContent;    // 게시글 내용
    private String postAuthor;     // 글쓴이 아이디
    private String postAuthorNick; // 글쓴이 닉네임
    private String reporterNick;   // 신고자 닉네임

}
