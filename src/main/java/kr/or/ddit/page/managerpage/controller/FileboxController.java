package kr.or.ddit.page.managerpage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.managerpage.service.FileboxService;
import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.ProjectFileVO;
import kr.or.ddit.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/managepage/manage")
@Controller
public class FileboxController {
	
	@Autowired
	FileboxService fileboxService;
	
	/**
	 * 파일함 이미지 하위차트와 매핑
	 * @param model
	 * @param ganttVO
	 * @return
	 */
	@GetMapping("/filebox/{proNo}")
	public String filebox(@PathVariable int proNo
			, GanttVO ganttVO, Model model, ProjectFileVO projectFileVO
			, Map<String, Object> map) {
		log.info("filebox -> proNo: " + proNo);
		
		// 파일 불러오기(상위 프로젝트별 파일 불러오기)
		ProjectVO projectVO = this.fileboxService.filebox(proNo);
		log.info("filebox -> projectVO : " + projectVO);
		
		// 파일 불러오기(경로)
		List<ProjectFileVO> projectFileVOList = this.fileboxService.filePath(projectFileVO);
		log.info("filebox -> projectFileVOList : " + projectFileVOList);
		
		// 파일별 갯수 가져오기
		List<GanttVO> ganttVOList = this.fileboxService.fileCount(ganttVO);
		log.info("파일별 갯수 가져오기(ganttVOList) : " + ganttVOList);
		
		model.addAttribute("ganttVOList", ganttVOList);
		model.addAttribute("projectFileVOList", projectFileVOList);
		model.addAttribute("projectVO", projectVO);
		
		return "managepage/manage/filebox";
	}
	
	//모달창에 이미지 미리 보이기
	///managepage/manage/filebox/getGanttChartsImages
//	@ResponseBody
//	@PostMapping("/filebox/getGanttChartsImages")
//	public GanttVO getGanttChartsImages(int ganttChartsNo) {
//		
//		log.info("getGanttChartsImages->ganttChartsNo : " + ganttChartsNo);
//		
//		GanttVO ganttVO = null;
//		
//		return ganttVO;
//	}
	
	/**
	 * 파일업로드 업데이트 처리 및 최신 파일 번호 업데이트
	 * @param ganttVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/updateFileAjax")
	public int updateFileAjax(GanttVO ganttVO) {
		/*
		GanttVO(ganttChartsNo=9, proNo=0, proJobNm=부모가 103, proStartDate=null, proEndDate=null
		, proProgrsRt=null, proFileNo=0, proColor=null, proDuration=0, proYn=0, proManager=null
		, projectNo=null, uploadFiles=[org.springframework.web.multipart.support.Stan..], fileGroupVO=null)
		 */
		log.info("updateFileAjax -> ganttVO : " + ganttVO);
		
		//1. update -> insert로 보정
		int result = this.fileboxService.updateFileAjax(ganttVO);
		log.info("updateFileAjax->result : " + result);
		
		return result;
	}
	
//	@ResponseBody
//	@PostMapping("/fileboxInfo")
//	public int fileboxInfo(@RequestBody GanttVO ganttVO) {
//		log.info("fileboxInfo -> ganttVO: " + ganttVO);
//		
//		int result = this.fileboxService.fileboxInfo(ganttVO);
//		log.info("fileboxInfo -> result: " + result);
//		
//		return result;
//	}
	
	
	

}
