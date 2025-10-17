package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CartVO {
	
    private int cartNo;       // 장바구니 번호
    private int cartState;    // 장바구니 상태 1,2,3
    private String memId;     // 회원 ID
    private List<CartDetailVO> cartDetails; // 추가된 필드
    
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
    
    
}