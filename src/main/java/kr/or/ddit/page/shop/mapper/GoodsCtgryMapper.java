package kr.or.ddit.page.shop.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.vo.GdsCtgryVO;

@Mapper
public interface GoodsCtgryMapper {
	
    /**
     * GDS_CTGRY 테이블에서 모든 카테고리를 조회하는 메서드
     * @return 카테고리 목록 (List<GdsCtgryVO>)
     */
    List<GdsCtgryVO> selectCategories();
}
