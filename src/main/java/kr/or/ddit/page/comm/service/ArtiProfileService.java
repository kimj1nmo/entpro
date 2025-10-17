package kr.or.ddit.page.comm.service;

import java.util.Date;

import kr.or.ddit.vo.ArtistVO;

public interface ArtiProfileService {
    ArtistVO getArtistProfile(String artistNo);
    ArtistVO getArtistBirth(String memId);
    ArtistVO getArtistBirth1(String memId2);
}
