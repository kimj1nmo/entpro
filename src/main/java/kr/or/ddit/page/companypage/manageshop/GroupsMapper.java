package kr.or.ddit.page.companypage.manageshop;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.vo.GroupsVO;

@Mapper
public interface GroupsMapper {

    // GROUPS 테이블에서 모든 그룹 정보를 조회
	List<GroupsVO> selectGroups();
}
