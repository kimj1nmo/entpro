package kr.or.ddit.page.managerpage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.page.managerpage.mapper.ProjectCalendarMapper;
import kr.or.ddit.page.managerpage.service.ProjectCalendarService;
import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.ProjectCalendarVO;

@Service
public class ProjectCalendarServiceImpl implements ProjectCalendarService {

	@Autowired
	ProjectCalendarMapper projectCalendarMapper;

	// 특정 캘린더 리스트
	@Override
	public List<ProjectCalendarVO> empCalendar(int proNo) {
		return this.projectCalendarMapper.empCalendar(proNo);
	}
	
	// 캘린더 전체일정
	@Override
	public List<ProjectCalendarVO> getEmpCalendar(Map<String, Object> map) {
		return this.projectCalendarMapper.getEmpCalendar(map);
	}
	
}
