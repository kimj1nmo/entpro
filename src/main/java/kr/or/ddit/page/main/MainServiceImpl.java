package kr.or.ddit.page.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.AuditionReqstVO;
import kr.or.ddit.vo.AuditionVO;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.GroupsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainMapper mainMapper;
	// UploadController DI/IoC
		@Autowired
		UploadController uploadController;
	//검색된 아티스트
	@Override
	public List<ArtistVO> searchArtist(String searchName) {
		return mainMapper.searchArtist(searchName);
	}
	//검색된 그룹

	@Override
	public List<GroupsVO> searchGroups(String searchName) {
		return mainMapper.searchGroups(searchName);

	}

	//검색된 굿즈
	@Override
	public List<GoodsVO> searchGoods(String searchName) {
		return mainMapper.searchGoods(searchName);

	}

	@Override
	public List<GroupsVO> getGroupsAll() {
		return mainMapper.getGroupsAll();
	}
	@Override
	public List<GoodsVO> getAllGoods() {
		return mainMapper.getAllGoods();
	}

	// 굿즈 카테고리 리스트 가져오기
	@Override
	public List<GoodsVO> getCategoryList() {
		return mainMapper.getCategoryList();
	}
//  특정 굿즈 상세 정보 조회 (추가)
    @Override
    public GoodsVO getGoodsByNo(int gdsNo) {
        return mainMapper.getGoodsByNo(gdsNo);
    }

	@Override
	public int getReqstTotal(Map<String, Object> map) {
        return mainMapper.getReqstTotal(map);

	}

	@Override
	public List<AuditionReqstVO> getReqstListAjax(Map<String, Object> map) {
        return mainMapper.getReqstListAjax(map);

	}

	@Override
	public List<AuditionVO> getAudList() {
        return mainMapper.getAudList();
	}

	@Override
	public int audReqstInsert(AuditionReqstVO auditionReqstVO) {
		MultipartFile[] uploadFiles = auditionReqstVO.getUploadFiles();
		if(uploadFiles !=null && uploadFiles[0].getOriginalFilename().length()>0) {


			long fileGroupNo = this.uploadController.multiImageUpload(uploadFiles);
			log.info("updateArtist->fileGroupNo: " + fileGroupNo);

			auditionReqstVO.setFileGroupNo(fileGroupNo);
			log.info("updateArtist->auditionReqstVO: " + auditionReqstVO);
		}
        return mainMapper.audReqstInsert(auditionReqstVO);

	}

	@Override
	public List<GroupsVO> getCommList(String username) {
        return mainMapper.getCommList(username);

	}
	//선택한 정보 가져오기
	@Override
	public AuditionReqstVO getReqstDetail(AuditionReqstVO auditionReqstVO) {
        return mainMapper.getReqstDetail(auditionReqstVO);

	}

	//선택한 오디션 지우기
	@Override
	public int audReqstDetailDel(AuditionReqstVO auditionReqstVO) {
        return mainMapper.audReqstDetailDel(auditionReqstVO);
	}
}
