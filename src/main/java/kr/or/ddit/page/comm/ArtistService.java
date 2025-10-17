package kr.or.ddit.page.comm;

import java.util.List;

import kr.or.ddit.vo.ArtistVO;

public interface ArtistService {

	List<ArtistVO> getArtistsByGroupNo(int groupNo);

}
