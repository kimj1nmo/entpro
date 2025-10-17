package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CartDetailVO {
    private int cartNo;        // 장바구니 번호
    private int gdsNo;         // 상품 번호
    private int cartDetailQy;  // 장바구니 상세 수량

    private GoodsVO goods;     // 상품 정보 (GoodsVO 객체 추가)

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
	
    // GoodsVO의 gdsName 필드를 반환
    public String getGdsName() {
        return goods != null ? goods.getGdsNm() : null;
    }

    // GoodsVO의 gdsDesc 필드를 반환
    public String getGdsDesc() {
        return goods != null ? goods.getGdsDc() : null;
    }
}



