package kr.or.ddit.page.notice.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.page.notice.mapper.NoticeMapper;
import kr.or.ddit.page.notice.service.NoticeService;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	UploadController uploadController;
	
	@Autowired
	NoticeMapper mapper;	
	
	@Override
	public List<NoticeVO> list(Map<String, Object> map) {
		return this.mapper.list(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.mapper.getTotal(map);
	}
	
	@Override	
	public int createPostAjax(NoticeVO noticeVO) {
		// 2. 다중 파일 업로드 처리(파일 + db)

		MultipartFile[] uploadFiles = noticeVO.getUploadFiles();
		
		// 1-2. 파일이 있는 경우만 실행
		if(uploadFiles!=null && uploadFiles[0].getOriginalFilename().length()>0) {
		
		long fileGroupNo = this.uploadController.multiImageUpload(uploadFiles);
		log.info("createPost -> fileGroupNo" + fileGroupNo);
		
		
		//1. notice 테이블에 insert
		noticeVO.setFileGroupNo(fileGroupNo);
		log.info("createPost -> memberVO : " + noticeVO);
		
		}
		
		
//		int result = this.mapper.createPostAjax(noticeVO);
//		log.info("createPost->result : " + result);
		
//		return result;


		
		return this.mapper.createPostAjax(noticeVO);
	}
	@Override
	public int deletePostAjax(NoticeVO noticeVO) {
		return this.mapper.deletePostAjax(noticeVO);
	}
	@Override
	public int updatePostAjax(NoticeVO noticeVO) {
		return this.mapper.updatePostAjax(noticeVO);
	}


}
