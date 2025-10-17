package kr.or.ddit.page.shop.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import kr.or.ddit.vo.ReviewVO;

@Mapper
public interface ReviewMapper {
    
    /**
     * 특정 상품의 리뷰 목록 조회
     * @param gdsNo 상품 번호
     * @return 리뷰 목록
     */
    List<ReviewVO> getReviewsByGdsNo(@Param("gdsNo") int gdsNo);

    /**
     * 리뷰 등록 (파일 업로드 포함)
     * @param reviewVO 리뷰 정보
     */
    void insertReview(ReviewVO reviewVO);

    /**
     * 리뷰 삭제 (RE_STATUS = 0으로 업데이트)
     * @param reNo 리뷰 번호
     */
    void deleteReview(@Param("reNo") int reNo);
    
    /**
     * 리뷰 수정 (파일 포함)
     * @param reviewVO 수정할 리뷰 정보
     */
    void updateReview(ReviewVO reviewVO);
}
