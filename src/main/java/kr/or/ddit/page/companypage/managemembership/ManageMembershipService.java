package kr.or.ddit.page.companypage.managemembership;

import java.util.List;

import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.MembershipVO;

public interface ManageMembershipService {

	// 멤버십 리스트 조회
	List<MembershipVO> getMembershipList();

	// 멤버십 가입자 조회
	// <select id="signMembershipList" resultType="kr.or.ddit.vo.MembershipVO">
	List<MembershipVO> signMembershipList();

	void registerMemship(MembershipVO membershipVO); // 멤버십 등록

	List<GroupsVO> getAllGroups();
	
    boolean updateMembership(int memshipNo, int groupNo, String memshipNm, int memshipAmount);

	List<MembershipVO> listAll();

	List<MembershipVO> listByGroupNo(int groupNo);


}
