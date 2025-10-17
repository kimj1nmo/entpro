package kr.or.ddit.page.companypage.managevod;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.page.companypage.manageartist.ManageArtistServiceImpl;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.LiveVO;
import kr.or.ddit.vo.VodVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManageVodServiceImpl implements ManageVodService{


	@Autowired
	ManageVodMapper managerGroupMapper;


	// UploadController DI/IoC
	@Autowired
	UploadController uploadController;

	//그룹 전체 가져오기
	@Override
	public int getTotal(Map<String, Object> map) {
		return managerGroupMapper.getTotal(map);
	}

	@Override
	public List<VodVO> listSort(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return managerGroupMapper.listSort(map);
	}

	@Override
	public int updataStatus(Map<String, Object> map) {
		return managerGroupMapper.updataStatus(map);
	}

	//라이브 진행중인 리스트 가져오기
	@Override
	public List<LiveVO> liveList(Map<String, Object> map) {
		return managerGroupMapper.liveList(map);
	}

	@Override
	public int getLiveTotal(Map<String, Object> map) {
		return managerGroupMapper.getLiveTotal(map);

	}
}
