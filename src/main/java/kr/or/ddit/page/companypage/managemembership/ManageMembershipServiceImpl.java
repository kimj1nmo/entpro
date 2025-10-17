package kr.or.ddit.page.companypage.managemembership;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.MembershipVO;

@Service
public class ManageMembershipServiceImpl implements ManageMembershipService {

	@Autowired
	private ManageMembershipMapper membershipMapper;

	@Override
	public List<MembershipVO> getMembershipList() {
		return membershipMapper.selectMembershipList();
	}

	// 멤버십 가입자 조회
	// <select id="signMembershipList" resultType="kr.or.ddit.vo.MembershipVO">
	public List<MembershipVO> signMembershipList(){
		return membershipMapper.signMembershipList();
	}
	
	  @Override
	    public void registerMemship(MembershipVO membershipVO) {
		  membershipMapper.insertMemship(membershipVO); // 멤버십 등록 쿼리 호출
	    }
	  
	  @Override
	    public List<GroupsVO> getAllGroups() {
	        return membershipMapper.getGroupList();
	    }
	  
	  @Override
	    public boolean updateMembership(int memshipNo, int groupNo, String memshipNm, int memshipAmount) {
	        Map<String, Object> params = new HashMap<>();
	        params.put("memshipNo", memshipNo);
	        params.put("groupNo", groupNo);
	        params.put("memshipNm", memshipNm);
	        params.put("memshipAmount", memshipAmount);

	        int updatedRows = membershipMapper.updateMembership(params);
	        return updatedRows > 0; // 업데이트된 행 수가 0보다 크면 성공
	    }
	  
	  @Override
		public List<MembershipVO> listAll() {
			return this.membershipMapper.listAll();
		}

		@Override
		public List<MembershipVO> listByGroupNo(int groupNo) {
			return membershipMapper.listByGroupNo(groupNo);
		}
}
