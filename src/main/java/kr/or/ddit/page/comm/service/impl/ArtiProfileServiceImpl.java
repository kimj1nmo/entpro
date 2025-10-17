package kr.or.ddit.page.comm.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.page.comm.mapper.ArtiProfileMapper;
import kr.or.ddit.page.comm.service.ArtiProfileService;
import kr.or.ddit.vo.ArtistVO;

@Service
public class ArtiProfileServiceImpl implements ArtiProfileService {

    @Autowired
    private ArtiProfileMapper mapper;

    @Override
    public ArtistVO getArtistProfile(String artistNo) {
        return mapper.getArtistProfile(artistNo);
    }

    @Override
    public ArtistVO getArtistBirth(String memId) {
        return mapper.getArtistBirth(memId);
    }

	@Override
	public ArtistVO getArtistBirth1(String memId2) {
		return mapper.getArtistBirth(memId2);
	}
}
