package kr.or.ddit.page.companypage.managecomm;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.CommReportVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.GroupsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManageCommServiceImpl implements ManageCommService {

	@Autowired
	ManageCommMapper manageCommMapper;

	// 신고 처리
	 @Override
	    public int accessReport(List<Integer> commNos) {
		 log.info("🛠 업데이트할 commNos 리스트: " + commNos);
	        int result = manageCommMapper.accessReport(commNos);
	        log.info("🛠 accessReport SQL 실행 결과: " + result);
	        return result;
	    }
	 
	// 그룹 이름 조회
	public String getGroupName(int groupNo) {
		return this.manageCommMapper.getGroupName(groupNo);
	}

	// 게시글 총 갯수 가져오기
	@Override
	public int getTotal(Map<String, Object> map) {
		return manageCommMapper.getTotal(map);
	}

	// 게시글 리스트 가져오기
	@Override
	public List<CommunityVO> list(Map<String, Object> map) {
		return manageCommMapper.list(map);
	}
	// 게시글 리스트 가져오기
//	@Override
//	public List<CommReportVO> reportAll() {
////		return manageCommMapper.reportAll();
//	}

	@Override
	public List<CommunityVO> listAll() {
		return this.manageCommMapper.listAll();
	}

	@Override
	public List<CommunityVO> listByGroupNo(int groupNo) {
		return manageCommMapper.listByGroupNo(groupNo);
	}

	@Override
	public List<GroupsVO> getGroupsList() {
		return manageCommMapper.getGroupsList();
	}

	@Override
	public List<CommReportVO> listReportedByGroupNo(int groupNo) {
		return manageCommMapper.reportedPostsByGroupNo(groupNo);
	}

	@Override
	public List<CommReportVO> listAllReportedPosts() {
		return manageCommMapper.reportAllReportedPosts();
	}

	    @Override
	    public List<CommReportVO> listReportedByStatus(int commReportYn) {
	        return manageCommMapper.reportedPostsByStatus(commReportYn);
	    }

	    @Override
	    public List<CommReportVO> listReportedByGroupNoAndStatus(int groupNo, int commReportYn) {
	        return manageCommMapper.reportedPostsByGroupNoAndStatus(groupNo, commReportYn);
	    }

		@Override
		public List<CommReportVO> reportAll() {
			return manageCommMapper.reportAll();
		}

}
