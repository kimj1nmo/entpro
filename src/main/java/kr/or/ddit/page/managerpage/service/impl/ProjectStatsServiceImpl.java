package kr.or.ddit.page.managerpage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.page.managerpage.mapper.ProjectStatsMapper;
import kr.or.ddit.page.managerpage.service.ProjectStatsService;
import kr.or.ddit.vo.ProjectVO;

@Service
public class ProjectStatsServiceImpl implements ProjectStatsService {

	@Autowired
	ProjectStatsMapper projectStatsMapper;
	
	// 차트용 리스트 불러오기
	@Override
	public List<ProjectVO> getProjectList() {
		return this.projectStatsMapper.getProjectList();
	}

	// 년도별 프로젝트 시행 횟수 구하기
	@Override
	public List<ProjectVO> statsChartCnt(ProjectVO projectVO) {
		return this.projectStatsMapper.statsChartCnt(projectVO);
	}

	// 전체그룹 년도별 프로젝트 횟수
	@Override
	public List<ProjectVO> groupsCharts(ProjectVO projectVO) {
		return this.projectStatsMapper.groupsCharts(projectVO);
	}

}
