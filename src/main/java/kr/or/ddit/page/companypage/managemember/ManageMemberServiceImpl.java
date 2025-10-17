package kr.or.ddit.page.companypage.managemember;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.MemberVO;

@Service("manageMemberService")
public class ManageMemberServiceImpl implements ManageMemberService {

	 @Autowired
	    ManageMemberMapper manageMemberMapper;
	    
	
    @Override
    public List<MemberVO> getAllMembers() {
        return manageMemberMapper.selectAllMembers();
    }

    @Override
    public int updateMember(MemberVO memberVO) {
    	return this.manageMemberMapper.updateMember(memberVO);
    }

    @Override
    public int deleteMember(MemberVO memberVO) {
        return this.manageMemberMapper.deleteMember(memberVO);
    }

	@Override
	public List<MemberVO> list(Map<String, Object> map) {
		return manageMemberMapper.list(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return manageMemberMapper.getTotal(map);
	}

	// 탈퇴 처리: MEM_ENABLE을 'n'으로 업데이트
    @Override
    public boolean updateMemberEnable(String memId) {
        // memId를 이용해 MEM_ENABLE을 'n'으로 업데이트하는 쿼리 호출
        int result = manageMemberMapper.updateMemberEnable(memId);
        return result > 0; // 업데이트된 행이 있으면 true 반환
    }
	
}
