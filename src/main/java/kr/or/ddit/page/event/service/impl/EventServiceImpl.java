package kr.or.ddit.page.event.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.page.event.mapper.EventMapper;
import kr.or.ddit.page.event.service.EventService;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.EventVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EventServiceImpl implements EventService {

    @Autowired
    EventMapper eventMapper;
    
	@Autowired
	UploadController uploadController;

    @Override
    public List<EventVO> list(Map<String, Object> map) {
        return eventMapper.list(map);
    }

    @Override
    public int getTotal(Map<String, Object> map) {
        return eventMapper.getTotal(map);
    }

    @Override
    public EventVO detail(int evtBoardNo) {
    	EventVO eventVO =eventMapper.detail(evtBoardNo);
    	log.info("detailmapper"+eventVO);
        return eventVO;
    }


	@Override
	public int insertPost(EventVO eventVO) {
		MultipartFile[] uploadFile = eventVO.getUploadFile();
		
		long fileGroupNo = this.uploadController.multiImageUpload(uploadFile);
		//FILE_GROUP테이블과 FILE_DETAIL 테이블에 insert가 완료
		log.info("insertPost->fileGooupNo : " + fileGroupNo);
		
		//게시글에 파일그룹번호를 setting해줌
		eventVO.setFileGroupNo(fileGroupNo);
		
		/*
		 
		 */
		int result = this.eventMapper.insertPost(eventVO);
		
		return result;
	}

	@Override
	public int updatePost(EventVO eventVO) {
		return this.eventMapper.updatePost(eventVO);
	}

	@Override
	public int deletePost(EventVO eventVO) {
		return this.eventMapper.deletePost(eventVO);
	}
}
