package kr.or.ddit.page.shop.service;

import java.util.List;
import kr.or.ddit.vo.ReviewVO;

public interface ReviewService {
    /**
     * 특정 상품의 리뷰 목록 조회
     * @param gdsNo 상품 번호
     * @return 리뷰 목록
     */
    List<ReviewVO> getReviewsByGdsNo(int gdsNo);

    /**
     * 리뷰 등록 (파일 업로드 포함)
     * @param reviewVO 리뷰 정보
     */
    void addReview(ReviewVO reviewVO);

    /**
     * 리뷰 삭제 (실제 삭제가 아닌 RE_STATUS = 0 업데이트)
     * @param reNo 리뷰 번호
     */
    void deleteReview(int reNo);
    
    /**
     * 리뷰 수정 (파일 포함)
     * @param reviewVO 수정할 리뷰 정보
     */
    void updateReview(ReviewVO reviewVO);
}
