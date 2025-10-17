package kr.or.ddit.page.managerpage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.managerpage.service.ProjectCalendarService;
import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.ProjectCalendarVO;
import kr.or.ddit.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/managepage/manage")
@Controller
public class ProjectCalendarController {

	@Autowired
	ProjectCalendarService projectCalendarService;
	
	/**
	 * 특정 캘린더 띄우기
	 * @param proNo
	 * @param model
	 * @return
	 */
	@GetMapping("/empCalendar/{proNo}")
	public String empCalendar(@PathVariable(value = "proNo") int proNo
			, Model model) {
		
		// 특정 캘린더 리스트
		List<ProjectCalendarVO> calendarList = this.projectCalendarService.empCalendar(proNo);
		log.info("특정 캘린더 리스트(calendarList) : " + calendarList);
		
		model.addAttribute("calendarList", calendarList);
		
		return "managepage/manage/empCalendar";
	}
	
	/**
	 * 전체 캘린더 보기
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getEmpCalendar")
	public List<Map<String,Object>> getEmpCalendar(@RequestBody Map<String, Object> map) {
		
		// 캘린더 전체일정
		List<ProjectCalendarVO> empCalendarList = this.projectCalendarService.getEmpCalendar(map);
		log.info("캘린더 전체일정(empCalendarList) : " + empCalendarList);
		
		List<Map<String,Object>> calList = new ArrayList<Map<String,Object>>();
		
		for(ProjectCalendarVO projectCalendarVO : empCalendarList) {
			calList.add(calToMap(projectCalendarVO));
		}
		log.info("ganttDetail->calList : " + calList);
		return calList;
	}

	/**
	 * 맵에 형식에 맞춰 데이터 넣기
	 * @param projectCalendarVO
	 * @param projectVO
	 * @return
	 */
	public Map<String,Object> calToMap(ProjectCalendarVO projectCalendarVO){
		Map<String,Object> map = new HashMap<String,Object>();
		log.info("맵에 담기(projectCalendarVO) : " + projectCalendarVO);
		map.put("id", String.valueOf(projectCalendarVO.getProNo()));
		map.put("title", projectCalendarVO.getProTtl());
		map.put("start", projectCalendarVO.getProRegDate());
		map.put("end", projectCalendarVO.getProDeadline());
		map.put("allDay", "1");
		map.put("backgroundColor", projectCalendarVO.getProBcrnColor());
		map.put("textColor", projectCalendarVO.getProTextColor());
		log.info("voToMap->map : " + map);
		return map;
	}
	
}
