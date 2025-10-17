package kr.or.ddit.page.companypage.managemember;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.vo.MemberVO;

@Mapper
public interface ManageMemberMapper {
	List<MemberVO> list(Map<String, Object> map);
	public int getTotal(Map<String, Object> map);
    List<MemberVO> selectAllMembers();
    public int updateMember(MemberVO memberVO);
    public int deleteMember(MemberVO memberVO);
	int updateMemberEnable(String memId);

}