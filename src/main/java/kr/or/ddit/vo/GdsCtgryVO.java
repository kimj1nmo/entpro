package kr.or.ddit.vo;

import java.util.Date;
import lombok.Data;

/**
 * GDS_CTGRY 테이블을 매핑하는 VO 클래스
 */
@Data
public class GdsCtgryVO {

    private int gdsCtgryNo;         // 카테고리 번호 (PK)
    private String gdsCtgryNm;      // 카테고리 이름
    private Integer gdsCtgryUpNo;   // 상위 카테고리 번호 (nullable)
    private String memId;           // 등록한 사용자 ID
    private Date gdsCtgryRegDate;   // 등록 날짜
}
