package kr.or.ddit.page.comm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.ArtistVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ArtistServiceImpl implements ArtistService {
	
	@Autowired
	ArtistMapper artistMapper;

	@Autowired
	UploadController uploadController;

	@Override
	public List<ArtistVO> getArtistsByGroupNo(int groupNo) {
		return this.artistMapper.getArtistsByGroupNo(groupNo);
	}

}
