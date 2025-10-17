package kr.or.ddit.page.companypage.manageshop;

import java.util.List;
import kr.or.ddit.vo.GroupsVO;

public interface GroupsService {
    // GROUPS 테이블에서 모든 그룹 정보를 조회하는 메서드
    List<GroupsVO> getAllGroups();
}
