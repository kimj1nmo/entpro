package kr.or.ddit.page.companypage.managealbum;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AlbumVO;
import kr.or.ddit.vo.ArtistVO;

public interface ManageAlbumService {

	//얼범 총 갯수 가져오기
	int getTotal(Map<String, Object> map);

	//앨범 리스트 가져오기
	List<AlbumVO> list(Map<String, Object> map);



}
