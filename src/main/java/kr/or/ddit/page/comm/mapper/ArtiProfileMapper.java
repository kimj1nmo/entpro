package kr.or.ddit.page.comm.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import kr.or.ddit.vo.ArtistVO;

@Mapper
public interface ArtiProfileMapper {
    ArtistVO getArtistProfile(@Param("artistNo") String artistNo);
    ArtistVO getArtistBirth(@Param("memId")String memId);
    ArtistVO getArtistBirth1(@Param("memId")String memId2);
   
}
