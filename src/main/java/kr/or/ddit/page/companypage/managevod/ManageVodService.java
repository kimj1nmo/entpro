package kr.or.ddit.page.companypage.managevod;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.LiveVO;
import kr.or.ddit.vo.VodVO;

public interface ManageVodService {

	//그룹 전체 가져오가ㅣ
	public int getTotal(Map<String, Object> map);

	//한페이지당 리스트 가져오기
	public List<VodVO> listSort(Map<String, Object> map);


	//상태 바꾸기
	public int updataStatus(Map<String, Object> map);

	//라이브 진행중인 리스트 가져오기
	public List<LiveVO> liveList(Map<String, Object> map);

	public int getLiveTotal(Map<String, Object> map);

}
