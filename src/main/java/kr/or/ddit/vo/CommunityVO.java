package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class CommunityVO {
	private int     RNUM; 		// 행 번호
	private int     commNo; 		// 게시글 번호
	private int     groupNo; 		// 그룹 번호
	private String  memId;			// 작성자
	private String  commCn;			// 내용
	private String  commWriteDate;	// 작성 날자
	private String  commUpdtDate;	// 수정 날짜
	private int     commView;		// 조회수
	private int     commStatus;		// 상태
	private int     memshipState;	// 멤버십 전용 여부
	
	private int  	cmmtNo;		// 댓글 번호
	private String cmmtCn;  // 댓글 내용
	private Date cmmtDate;		//댓글 작성 날짜
	
	private String groupNoCr;
    private String memIdCr;
	private int    commRegNo;   // 커뮤니티 가입번호
	private Date   commRegJoin; // 가입일
	private String commRegNick; // 닉네임
	private Long    fileGroupNo; // 프로필 사진 파일 그룹 번호
	
	// 별칭으로 매핑된 속성
    private Long  fileGroupNoC; // community 테이블의 file_group_no
    private Long  fileGroupNoCr; // community_regdata 테이블의 file_group_no
    private Long  fileGroupNoG; // GROUPS 테이블의 file_group_no
    
	//게시글 : 파일그룹 = 1 : 1
	private FileGroupVO fileGroupVO;
	
	//이미지 파일들
	private MultipartFile[] uploadFiles;

	private String fileSaveLocate;
	private String proSaveLocate;
	private String groupSaveLocate;
	
	private int likeCount;   // 좋아요 수 추가
	private int commentCount;   // 댓글 수 추가
	private int isLiked;   // 좋아요 수 추가
	
	private String groupName;  // 그룹 이름 추가
	
	private int 	commReportNo; // 신고 번호
//	private int 	commNo;
//	private String	 memId;
	private String 	commReportCn; // 신고 사유
	private int 	commReportYn; // 신고 처리 여부
	private Date 	commReportDt; // 신고 일시
	private String commReportAc;  // 조치 내용
	
	
	

}
