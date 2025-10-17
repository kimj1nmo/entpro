package kr.or.ddit.page.managerpage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.page.managerpage.mapper.FileboxMapper;
import kr.or.ddit.page.managerpage.service.FileboxService;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.ProjectFileVO;
import kr.or.ddit.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FIleboxServiceImpl implements FileboxService {

	@Autowired
	UploadController uploadController;
	
	@Autowired
	FileboxMapper fileboxMapper;
	
	// 파일 불러오기(상위 프로젝트별 파일 불러오기)
	@Override
	public ProjectVO filebox(int proNo) {
		return this.fileboxMapper.filebox(proNo);
	}

	// 파일업로드
	@Override
	public int updateFileAjax(GanttVO ganttVO) {
		// 1. 다중 파일업로드 처리(파일 + DB)
		MultipartFile[] uploadFiles = ganttVO.getUploadFiles();
				
		// 1-2. 파일이 있는 경우만 실행
		if(uploadFiles != null && uploadFiles[0].getOriginalFilename().length()>0) {
		
																//파일객체,    간트차트명,          			간트차트번호
		long proFileNo = this.uploadController.multiImageUpload(uploadFiles,ganttVO.getProJobNm(),ganttVO.getGanttChartsNo());
		log.info("createPost->proFileNo : " + proFileNo);
		
		// 2. GanttCharts 테이블에 insert
		ganttVO.setProFileNo(proFileNo);//20250107009
		log.info("createPost->ganttVO : " + ganttVO);
		}
		/*
		GanttVO(ganttChartsNo=9, proNo=0, proJobNm=부모가 103, proStartDate=null, proEndDate=null
		, proProgrsRt=null, proFileNo=20250107009, proColor=null, proDuration=0, proYn=0, proManager=null
		, projectNo=null, uploadFiles=[org.springframework.web.multipart.support.Stan..], fileGroupVO=null)
		 */
		int result = this.fileboxMapper.updateFileAjax(ganttVO);
		log.info("updateFileAjax->result : " + result);
		
		return result;
	}

//	@Override
//	public int fileboxInfo(GanttVO ganttVO) {
//		return this.fileboxMapper.fileboxInfo(ganttVO);
//	}

	// 파일 불러오기(경로)
	@Override
	public List<ProjectFileVO> filePath(ProjectFileVO projectFileVO) {
		return this.fileboxMapper.filePath(projectFileVO);
	}

	// 파일별 갯수 가져오기
	@Override
	public List<GanttVO> fileCount(GanttVO ganttVO) {
		return this.fileboxMapper.fileCount(ganttVO);
	}

//	@Override
//	public int detailFile(int proNo) {
//		return this.fileboxMapper.detailFile(proNo);
//	}

}
