package kr.or.ddit.page.shop.service;

import java.util.List;
import kr.or.ddit.vo.GdsCtgryVO;

/**
 * GdsCtgry 관련 서비스 인터페이스
 */
public interface GoodsCtgryService {

    /**
     * 모든 카테고리를 조회하는 메서드
     * @return 카테고리 목록 (List<GdsCtgryVO>)
     */
    List<GdsCtgryVO> getAllCategories();
}
