package kr.or.ddit.page.companypage.managealbum;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.AlbumVO;
import kr.or.ddit.vo.ArtistVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManageAlbumServiceImpl implements ManageAlbumService {

	@Autowired
	ManageAlbumMapper manageAlbumMapper;

	//얼범 총 갯수 가져오기
	@Override
	public int getTotal(Map<String, Object> map) {
		return manageAlbumMapper.getTotal(map);
	}

	//앨범 리스트 가져오기
	@Override
	public List<AlbumVO> list(Map<String, Object> map) {
		return manageAlbumMapper.listSort(map);
	}


}
