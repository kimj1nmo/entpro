package kr.or.ddit.page.companypage.manageshop;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.vo.GdsCtgryVO;

@Mapper
public interface GdsCtgryMapper {
	
    List<GdsCtgryVO> selectCategories(); // XML의 <select id="selectCategories">와 일치해야 함
}
