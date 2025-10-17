package kr.or.ddit.page.companypage.manageartist;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManageArtistServiceImpl implements ManageArtistService {

	@Autowired
	ManageArtistMapper companypageMapper;


	// UploadController DI/IoC
	@Autowired
	UploadController uploadController;

	@Override
	//전체 아티스트 수 가져오기
	public int getTotal(Map<String, Object> map) {
		return companypageMapper.getTotal(map);
	}

	//화면에 나오는 아티스트 목록 리스트
	@Override
	public List<ArtistVO> list(Map<String, Object> map) {
		return companypageMapper.list(map);
	}

	//아티스트 한명 정보 가져오기
	@Override
	public ArtistVO artistDetail(int artistNo) {
		return companypageMapper.artistDetail(artistNo);
	}

	//아티스트 아이디 체크

	@Override
	public ArtistVO memIdChk(ArtistVO artistVO) {
		return companypageMapper.memIdChk(artistVO);

	}

	@	//아티스트 추가
Override
	public int createArtist(ArtistVO artistVO) {

		log.info("createPost->artistVO: " + artistVO);

		//1.다중 파일 업로드 처리(파일 + Db)
		MultipartFile[] uploadFiles = artistVO.getUploadFiles();
		if(uploadFiles !=null && uploadFiles[0].getOriginalFilename().length()>0) {


			long fileGroupNo = this.uploadController.multiImageUpload(uploadFiles);
			log.info("updateArtist->fileGroupNo: " + fileGroupNo);

			artistVO.setFileGroupNo(fileGroupNo);
			log.info("updateArtist->artistVO: " + artistVO);
		}
		int result=companypageMapper.giveAuthsArtist(artistVO);
		return companypageMapper.createArtist(artistVO);
	}

	//아티스트 수정
	@Override
	public int updateArtist(ArtistVO artistVO) {
		log.info("updateArtist->artistVO: " + artistVO);

		//1.다중 파일 업로드 처리(파일 + Db)
		MultipartFile[] uploadFiles = artistVO.getUploadFiles();
		if(uploadFiles !=null && uploadFiles[0].getOriginalFilename().length()>0) {


			long fileGroupNo = this.uploadController.multiImageUpload(uploadFiles);
			log.info("updateArtist->fileGroupNo: " + fileGroupNo);

			artistVO.setFileGroupNo(fileGroupNo);
			log.info("updateArtist->artistVO: " + artistVO);
		}
		return companypageMapper.updateArtist(artistVO);
	}

	//아티스트 삭제
	@Override
	public int deleteArtist(ArtistVO artistVO) {
		return companypageMapper.deleteArtist(artistVO);
	}


	//아티스트 소트
	@Override
	public List<ArtistVO> listSort(Map<String, Object> map) {
		return companypageMapper.listSort(map);

	}
	//아티스트가 소속된 그룹 가져오기
	public List<GroupsVO> artistGroupList(Map<String, Object> map){
		return companypageMapper.artistGroupList(map);

	}
}
