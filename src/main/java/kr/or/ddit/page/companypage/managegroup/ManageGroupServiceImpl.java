package kr.or.ddit.page.companypage.managegroup;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.page.companypage.manageartist.ManageArtistServiceImpl;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManageGroupServiceImpl implements ManageGroupService{


	@Autowired
	ManageGroupMapper managerGroupMapper;


	// UploadController DI/IoC
	@Autowired
	UploadController uploadController;

	//그룹 전체 가져오기
	@Override
	public int getTotal(Map<String, Object> map) {
		return managerGroupMapper.getTotal(map);
	}

	@Override
	public List<GroupsVO> listSort(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return managerGroupMapper.listSort(map);
	}
	//그룹 생성

	@Override
	public int createGroup(GroupsVO groupsVO) {

		log.info("createGroup->groupsVO: " + groupsVO);

		//1.다중 파일 업로드 처리(파일 + Db)
		MultipartFile[] uploadFiles = groupsVO.getUploadFiles();
		if(uploadFiles !=null && uploadFiles[0].getOriginalFilename().length()>0) {


			long fileGroupNo = this.uploadController.multiImageUpload(uploadFiles);
			log.info("updateArtist->fileGroupNo: " + fileGroupNo);

			groupsVO.setFileGroupNo(fileGroupNo);
			log.info("updateArtist->artistVO: " + groupsVO);
		}
		return managerGroupMapper.createGroup(groupsVO);
	}

	//디테일
	@Override
	public GroupsVO groupDetail(int groupNo) {
		return managerGroupMapper.groupDetail(groupNo);
	}

	@Override
	public int groupArtistDel(Map<String, Integer> map) {
		return managerGroupMapper.groupArtistDel(map);
	}
	//아티스트 검색

	@Override
	public  List<ArtistVO> artistSearch(ArtistVO artistVO) {
		return managerGroupMapper.artistSearch(artistVO);
	}
	//맴버가 있는지 파악

	@Override
	public int checkArtistExists(Map<String, Object> map) {
		return managerGroupMapper.checkArtistExists(map);
	}

    // 그룹데이터에 아티스트 추가 하기

	@Override
	public int artistInsertGroup(Map<String, Object> map) {
		return managerGroupMapper.artistInsertGroup(map);

	}


	@Override
	public int updateGroup(GroupsVO groupsVO) {

		log.info("updateGroup->groupsVO: " + groupsVO);

		//1.다중 파일 업로드 처리(파일 + Db)
		MultipartFile[] uploadFiles = groupsVO.getUploadFiles();
		if(uploadFiles !=null && uploadFiles[0].getOriginalFilename().length()>0) {


			long fileGroupNo = this.uploadController.multiImageUpload(uploadFiles);
			log.info("updateArtist->fileGroupNo: " + fileGroupNo);

			groupsVO.setFileGroupNo(fileGroupNo);
			log.info("updateArtist->artistVO: " + groupsVO);
		}
		return managerGroupMapper.updateGroup(groupsVO);
	}
}
