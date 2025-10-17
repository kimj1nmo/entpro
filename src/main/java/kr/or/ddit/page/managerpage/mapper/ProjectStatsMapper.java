package kr.or.ddit.page.managerpage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ProjectVO;

@Mapper
public interface ProjectStatsMapper {
	// 차트용 리스트 불러오기
	public List<ProjectVO> getProjectList();
	// 년도별 프로젝트 시행 횟수 구하기
	public List<ProjectVO> statsChartCnt(ProjectVO projectVO);
	// 전체그룹 년도별 프로젝트 횟수
	public List<ProjectVO> groupsCharts(ProjectVO projectVO);

}
