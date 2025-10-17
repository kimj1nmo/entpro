package kr.or.ddit.page.shop.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.page.shop.mapper.ReviewMapper;
import kr.or.ddit.page.shop.service.ReviewService;
import kr.or.ddit.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;

    /**
     * 특정 상품의 리뷰 목록 조회
     * @param gdsNo 상품 번호
     * @return 리뷰 목록
     */
    @Override
    public List<ReviewVO> getReviewsByGdsNo(int gdsNo) {
        return reviewMapper.getReviewsByGdsNo(gdsNo);
    }

    /**
     * 리뷰 등록 (파일 업로드 포함)
     * @param reviewVO 리뷰 정보
     */
    @Override
    public void addReview(ReviewVO reviewVO) {  // ✅ 올바른 메서드 이름 사용
        reviewMapper.insertReview(reviewVO);
    }

    /**
     * 리뷰 삭제 (RE_STATUS = 0 업데이트)
     * @param reNo 리뷰 번호
     */
    @Override
    public void deleteReview(int reNo) {
        reviewMapper.deleteReview(reNo); // ✅ 삭제 대신 RE_STATUS 업데이트
    }
    
    /**
     * 리뷰 수정 (파일 포함)
     * @param reviewVO 수정할 리뷰 정보
     */
    @Override
    public void updateReview(ReviewVO reviewVO) {
        reviewMapper.updateReview(reviewVO);
    }
    
}
