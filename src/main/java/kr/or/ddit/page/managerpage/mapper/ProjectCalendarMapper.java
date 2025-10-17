package kr.or.ddit.page.managerpage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.ProjectCalendarVO;

@Mapper
public interface ProjectCalendarMapper {

	// 특정 캘린더 리스트
	public List<ProjectCalendarVO> empCalendar(int proNo);
	// 캘린더 전체일정
	public List<ProjectCalendarVO> getEmpCalendar(Map<String, Object> map);

}
