package kr.or.ddit.page.companypage.manageshop;

import java.util.List;
import kr.or.ddit.vo.GdsCtgryVO;

/**
 * GdsCtgry 관련 서비스 인터페이스
 */
public interface GdsCtgryService {

    /**
     * 모든 카테고리를 조회하는 메서드
     * @return List<GdsCtgryVO> - 카테고리 리스트 반환
     */
    List<GdsCtgryVO> getAllCategories();
}
