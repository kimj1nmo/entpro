package kr.or.ddit.page.companypage.managecomm;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CommReportVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.GroupsVO;

public interface ManageCommService {

	// 신고 처리
	 int accessReport(@Param("commNos") List<Integer> commNos);
    
	// 그룹 이름 조회
	public String getGroupName(int groupNo);

	// 게시글 총 갯수 가져오기
	int getTotal(Map<String, Object> map);

	// 앨범 리스트 가져오기
	List<CommunityVO> list(Map<String, Object> map);

	// !!! 게시글 전체 리스트!!!
	public List<CommunityVO> listAll();

	List<CommunityVO> listByGroupNo(@Param("groupNo") int groupNo);

	List<GroupsVO> getGroupsList();

	  // 그룹별 신고된 게시글 조회
    List<CommReportVO> listReportedByGroupNo(int groupNo);

    // 전체 신고된 게시글 조회
    List<CommReportVO> listAllReportedPosts();
    List<CommReportVO> listReportedByStatus(int commReportYn);
    List<CommReportVO> listReportedByGroupNoAndStatus(int groupNo, int commReportYn);

	List<CommReportVO> reportAll();

}
