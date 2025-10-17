package kr.or.ddit.page.companypage.managemembership;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CommReportVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.MembershipVO;

@Mapper
public interface ManageMembershipMapper {
	
	//멤버십 리스트 조회
    List<MembershipVO> selectMembershipList();
    
    // 멤버십 가입자 조회
	// <select id="signMembershipList" resultType="kr.or.ddit.vo.MembershipVO">
    List<MembershipVO> signMembershipList();
    
    void insertMemship(MembershipVO memsbershipVO); // 멤버십 등록

    List<GroupsVO> getGroupList();
    
    int updateMembership(Map<String, Object> params); // 멤버십 수정
    
    public List<MembershipVO> listAll();

	List<MembershipVO> listByGroupNo(@Param("groupNo") int groupNo);

}
