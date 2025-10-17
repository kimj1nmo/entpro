package kr.or.ddit.page.managerpage.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.ProjectEmpVO;
import kr.or.ddit.vo.ProjectVO;

public interface GanttService {

	// 해당 간트차트 리스트
	public List<ProjectVO> ganttDetail(Map<String, Object> map);

	// 포워딩용
	public List<ProjectVO> list(int proNo);

	// 비동기 생성
	public int createGantt(GanttVO ganttVO);

	// 비동기 삭제
	public int deleteGantt(GanttVO ganttVO);

	// 비동기 수정
	public int putGantt(GanttVO ganttVO);

	// 담당자 리스트
	public List<ProjectEmpVO> getManager(ProjectEmpVO projectEmpVO);

	// 캘린더 전체일정
//	public List<GanttVO> getEmpCalendar();

	// 특정 캘린더
//	public List<GanttVO> empCalendar(int proNo);

	


	


}
