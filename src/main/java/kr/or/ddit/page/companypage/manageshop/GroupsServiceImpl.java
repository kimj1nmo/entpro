package kr.or.ddit.page.companypage.manageshop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.vo.GroupsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GroupsServiceImpl implements GroupsService {

    private final GroupsMapper groupsMapper;

    // 생성자 주입 (Spring이 GroupsMapper를 주입하도록 설정)
    @Autowired
    public GroupsServiceImpl(GroupsMapper groupsMapper) {
        this.groupsMapper = groupsMapper;
    }

    @Override
    public List<GroupsVO> getAllGroups() {
        log.info("그룹 조회 요청 실행");
        return groupsMapper.selectGroups();
    }
}
