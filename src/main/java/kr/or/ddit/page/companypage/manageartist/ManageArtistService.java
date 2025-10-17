package kr.or.ddit.page.companypage.manageartist;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;

public interface ManageArtistService {

	//전체 아티스트 수 가져오기
	public int getTotal(Map<String, Object> map);

	//화면에 나오는 아티스트 목록 리스트
	public List<ArtistVO> list(Map<String, Object> map);

	//아티스트 한명 정보 가져오기
	public ArtistVO artistDetail(int artistNo);

	//아티스트 아이디 체크
	public ArtistVO memIdChk(ArtistVO artistVO);

	//아티스트 추가
	public int createArtist(ArtistVO artistVO);

	//아티스트 수정
	public int updateArtist(ArtistVO artistVO);

	//아티스트 삭제
	public int deleteArtist(ArtistVO artistVO);

	//리스트 sort
	public List<ArtistVO> listSort(Map<String, Object> map);

	//아티스트가 소속된 그룹 가져오기
	public List<GroupsVO> artistGroupList(Map<String, Object> map);
}
