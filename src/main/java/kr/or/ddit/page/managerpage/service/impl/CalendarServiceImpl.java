package kr.or.ddit.page.managerpage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.page.companypage.manageartist.ManageArtistServiceImpl;
import kr.or.ddit.page.companypage.managegroup.ManageGroupMapper;
import kr.or.ddit.page.managerpage.mapper.CalendarMapper;
import kr.or.ddit.page.managerpage.service.CalendarService;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.SchdulVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CalendarServiceImpl implements CalendarService{


	@Autowired
	ManageGroupMapper managerGroupMapper;
	
	@Autowired
	CalendarMapper calendarMapper;

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
	// 캘린더 이벤트 추가
    @Override
    public int addCalendarEvent(SchdulVO schdulVO) {
        log.info("addCalendarEvent -> schdulVO : " + schdulVO);
        return calendarMapper.addCalendarEvent(schdulVO);
    }

    // 캘린더 이벤트 수정
    @Override
    public int updateCalendarEvent(SchdulVO schdulVO) {
        log.info("updateCalendarEvent -> schdulVO : " + schdulVO);
        return calendarMapper.updateCalendarEvent(schdulVO);
    }

    // 캘린더 이벤트 삭제
    @Override
    public int deleteCalendarEvent(int schdulNo) {
        log.info("deleteCalendarEvent -> schdulNo : " + schdulNo);
        return calendarMapper.deleteCalendarEvent(schdulNo);
    }

    // 그룹에 해당하는 캘린더 이벤트 조회
    @Override
    public List<SchdulVO> getCalendarEvent(int groupNo) {
        log.info("getCalendarEvent -> groupNo : " + groupNo);
        return calendarMapper.getCalendarEvent(groupNo);
    }
    
    // 일정 번호로 캘린더 이벤트 상세 조회
    @Override
    public SchdulVO getEventDetails(int schdulNo) {
        log.info("getEventDetails -> schdulNo: " + schdulNo);
        return calendarMapper.getEventDetails(schdulNo);  // Mapper 호출
    }
    
    @Override
    public List<GroupsVO> getGroupList() {
        return calendarMapper.getGroupList();  // 파라미터 없이 호출
    }
    
    
    
    
}
