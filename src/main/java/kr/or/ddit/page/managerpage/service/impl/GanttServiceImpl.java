package kr.or.ddit.page.managerpage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.page.managerpage.mapper.GanttMapper;
import kr.or.ddit.page.managerpage.service.GanttService;
import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.ProjectEmpVO;
import kr.or.ddit.vo.ProjectVO;

@Service
public class GanttServiceImpl implements GanttService {

	@Autowired
	GanttMapper ganttMapper;
	
//	@Override
//	public GanttVO ganttDetail(GanttVO ganttVO) {
//		return this.ganttMapper.ganttDetail(ganttVO);
//	}

	// 해당 간트차트 리스트
	@Override
	public List<ProjectVO> ganttDetail(Map<String, Object> map) {
		return this.ganttMapper.ganttDetail(map);
	}

	// 포워딩용
	@Override
	public List<ProjectVO> list(int proNo) {
		return this.ganttMapper.list(proNo);
	}

	// 비동기 생성
	@Override
	public int createGantt(GanttVO ganttVO) {
		return this.ganttMapper.createGantt(ganttVO);
	}

	// 비동기 삭제
	@Override
	public int deleteGantt(GanttVO ganttVO) {
		return this.ganttMapper.deleteGantt(ganttVO);
	}

	// 비동기 수정
	@Override
	public int putGantt(GanttVO ganttVO) {
		return this.ganttMapper.putGantt(ganttVO);
	}

	// 담당자 리스트
	@Override
	public List<ProjectEmpVO> getManager(ProjectEmpVO projectEmpVO) {
		return this.ganttMapper.getManager(projectEmpVO);
	}

	// 캘린더 전체일정
//	@Override
//	public List<GanttVO> getEmpCalendar() {
//		return this.ganttMapper.getEmpCalendar();
//	}

	// 특정 캘린더
//	@Override
//	public List<GanttVO> empCalendar(int proNo) {
//		return this.ganttMapper.empCalendar(proNo);
//	}

	
	




}
