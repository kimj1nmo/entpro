package kr.or.ddit.page.managerpage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.page.managerpage.service.ProjectStatsService;
import kr.or.ddit.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/managepage")
@Slf4j
@RestController
public class ProjectStatsController {
	
	@Autowired
	ProjectStatsService projectStatsService;
	
	/**
	 * 차트용 리스트 불러오기
	 * @return
	 */
	@GetMapping("/getProjectList")
	public List<ProjectVO> getProjectList(){
		
		return this.projectStatsService.getProjectList();
	}
	
	/**
	 * 년도별 프로젝트 시행 횟수 구하기
	 * @param year
	 * @return
	 */
	@PostMapping("/statsChartCnt")
	public List<ProjectVO> statsChartCnt(@RequestBody ProjectVO projectVO){
		log.info("년도 파라미터(projectVO) : ", projectVO);
		return this.projectStatsService.statsChartCnt(projectVO);
	}
	
	
	/**
	 * 전체그룹 년도별 프로젝트 횟수
	 * @param projectVO
	 * @return
	 */
	@PostMapping("/groupsCharts")
	public List<ProjectVO> groupsCharts(@RequestBody ProjectVO projectVO){
		return this.projectStatsService.groupsCharts(projectVO);
	}
	
}





















