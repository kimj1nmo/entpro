package kr.or.ddit.page.companypage.managecomm;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CommReportVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.GroupsVO;

@Mapper
public interface ManageCommMapper {

	// 신고 처리
	public int accessReport(@Param("commNos") List<Integer> commNos);
	
	// 그룹 이름 조회
	public String getGroupName(int groupNo);

	// 게시글 총 갯수 가져오기
	int getTotal(Map<String, Object> map);

	// 게시글 리스트 가져오기(sort
	List<CommunityVO> list(Map<String, Object> map);

	public List<CommunityVO> listAll();

	List<CommunityVO> listByGroupNo(@Param("groupNo") int groupNo);
	
    // 모든 그룹 리스트 조회
	List<GroupsVO> getGroupsList();
	
	 // 그룹별 신고된 게시글 조회
    List<CommReportVO> reportedPostsByGroupNo(@Param("groupNo") int groupNo);

    // 전체 신고된 게시글 조회
    List<CommReportVO> reportAllReportedPosts();
    
    List<CommReportVO> reportedPostsByStatus(@Param("commReportYn") int commReportYn);
    List<CommReportVO> reportedPostsByGroupNoAndStatus(@Param("groupNo") int groupNo, @Param("commReportYn") int commReportYn);

	List<CommReportVO> reportAll();

}
