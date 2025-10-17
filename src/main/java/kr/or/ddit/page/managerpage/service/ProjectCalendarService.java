package kr.or.ddit.page.managerpage.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.ProjectCalendarVO;

public interface ProjectCalendarService {

	// 특정 캘린더 리스트
	public List<ProjectCalendarVO> empCalendar(int proNo);
	// 캘린더 전체일정
	public List<ProjectCalendarVO> getEmpCalendar(Map<String, Object> map);

}
