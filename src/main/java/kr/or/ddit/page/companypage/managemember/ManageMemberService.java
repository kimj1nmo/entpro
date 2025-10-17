package kr.or.ddit.page.companypage.managemember;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EventVO;
import kr.or.ddit.vo.MemberVO;

public interface ManageMemberService {
	List<MemberVO> list(Map<String, Object> map);
    List<MemberVO> getAllMembers();
    int getTotal(Map<String, Object> map);
    int updateMember(MemberVO memberVO);
    int deleteMember(MemberVO memberVO);
    boolean updateMemberEnable(String memId);  // 탈퇴 처리 메소드 추가
}