package kr.or.ddit.page.comm;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ArtistVO;
@Mapper
public interface ArtistMapper {

	List<ArtistVO> getArtistsByGroupNo(int groupNo);

}
