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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.managerpage.service.GanttService;
import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.ProjectEmpVO;
import kr.or.ddit.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/managepage/manage")
@Controller
public class GanttController {
	
	@Autowired
	GanttService ganttService;
	
	/**
	 * 간트차트 상세전부
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/ganttDetail")
	public List<Map<String,Object>> ganttDetail(@RequestBody Map<String, Object> map) {
		log.info("ganttDetail->ganttVO(전) : " + map);
		
		List<ProjectVO> projectVOList = ganttService.ganttDetail(map);
		log.info("ganttDetail->projectVOList : " + projectVOList);
		
		/*
		//상세
		ProjectVO projectVOList = this.ganttService.ganttDetail(map);
		log.info("ganttDetail->projectVOList(후) : " + projectVOList);
		
		
		List<GanttVO> ganttVOList = projectVOList.getGanttVOList();
		log.info("ganttDetail->ganttVOList : " + ganttVOList);
		
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		
		for(GanttVO ganttVO : ganttVOList) {
			mapList.add(voToMap(ganttVO));
		}
		log.info("ganttDetail->mapList : " + mapList);
		*/
		return processGanttDetail(projectVOList);
	}
	
		public List<Map<String, Object>> processGanttDetail(List<ProjectVO> projectVOList) {
		    List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		    log.info("processGanttDetail -> projectVOList : " + projectVOList);
		    int cnt = 0;
		    for (ProjectVO project : projectVOList) {
		        // PROJECT 단독 데이터 가공
		    	if (cnt == 0) {// 상위 차트 1번만 넣기
			        Map<String, Object> projectMap = new HashMap<>();
			        projectMap.put("id", project.getProjectNo());
			        projectMap.put("text", project.getProTtl());
//			        projectMap.put("type", "project");
			        projectMap.put("type", project.getProColor());
			        projectMap.put("open", "1");
			        projectMap.put("duration", project.getMinusDuration());
			        projectMap.put("progress", 0);
			        projectMap.put("start_date", project.getProRegDate());
			        projectMap.put("user", project.getProManager());
			        resultList.add(projectMap);
			        cnt++;
			        log.info("project.getProManager() : " + project.getProManager());
			        log.info("processGanttDetail -> projcet : " + project);
		    	}
		        // 간트차트 데이터 추가
		        if (project.getGanttVOList() != null) {
		            for (GanttVO gantt : project.getGanttVOList()) {
		                resultList.add(voToMap(gantt, project));
		                log.info("gantt : " + gantt);
		            }
		        }
		    }
		    return resultList;
		}
	
	/**
	 * 간트차트 데이터 맵으로 넣기 위한 메소드
	 * @param ganttVO
	 * @return
	 */
	public Map<String,Object> voToMap(GanttVO ganttVO, ProjectVO projectVO){
		Map<String,Object> map = new HashMap<String,Object>();
		log.info("voToMap -> ganttVO : " + ganttVO);
		map.put("id", ganttVO.getGanttChartsNo());
		map.put("text", ganttVO.getProJobNm());
		map.put("type", ganttVO.getProColor());
		map.put("order", "10");
		map.put("progress", ganttVO.getProProgrsRt());
		map.put("open", "1");
		map.put("user", ganttVO.getMemName());
		map.put("start_date", ganttVO.getProStartDate());
		map.put("duration", ganttVO.getProDuration());
		map.put("end_date", ganttVO.getProEndDate());
		map.put("parent", ganttVO.getProjectNo());
		log.info("voToMap->map : " + map);
		return map;
	}
	
	

	
	/**
	 * 간트차트 이동 및 모델 주입
	 * @param ganttVO
	 * @param model
	 * @return
	 */
	@GetMapping("/gantt/{proNo}")
	public String list(@PathVariable(value = "proNo") int proNo
			, ProjectVO projectVO, Model model) {
		log.info("approve->projectVO : " + projectVO);
		
		List<ProjectVO> projectVOList = this.ganttService.list(proNo);
		log.info("approve->projectVOList(전) : " + projectVOList);
		
		
		
		model.addAttribute("projectVOList", projectVOList);
		log.info("approve->projectVOList(후) : " + projectVOList);
		
		return "managepage/manage/gantt";
	}
	
	/**
	 * 간트차트 등록
	 * @param ganttVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/createGantt")
	public int createGantt(@RequestBody GanttVO ganttVO) {
		log.info("createGantt -> ganttVO: " + ganttVO);
		
		int result = this.ganttService.createGantt(ganttVO);
		log.info("createGantt -> result: " + result);
		
		return result;
	}
	
	/**
	 * 간트차트 삭제
	 * @param ganttVO
	 * @return
	 */
	@ResponseBody
	@PutMapping("/deleteGantt")
	public int deleteGantt(@RequestBody GanttVO ganttVO) {
		log.info("deleteGantt -> ganttVO: " + ganttVO);
		
		int result = this.ganttService.deleteGantt(ganttVO);
		log.info("deleteGantt -> result: " + result);
		
		return result;
	}
	
	/**
	 * 간트차트 수정
	 * @param ganttVO
	 * @return
	 */
	@ResponseBody
	@PutMapping("/putGantt")
	public int putGantt(@RequestBody GanttVO ganttVO) {
		log.info("putGantt -> ganttVO: " + ganttVO);
		
		int result = this.ganttService.putGantt(ganttVO);
		log.info("putGantt -> result: " + result);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/getManager")
	public List<ProjectEmpVO> getManager(@RequestBody ProjectEmpVO projectEmpVO) {
		log.info("projectEmpVO : " + projectEmpVO);
		
		List<ProjectEmpVO> ProjectEmpVOList = this.ganttService.getManager(projectEmpVO);
		
		return ProjectEmpVOList;
	}
	
	/**
	 * 특정 캘린더 띄우기
	 * @param proNo
	 * @param model
	 * @return
	 */
	/*
	@GetMapping("/empCalendar/{proNo}")
	public String empCalendar(@PathVariable(value = "proNo") int proNo
			, Model model) {
		
		List<GanttVO> calendarList = this.ganttService.empCalendar(proNo);
		log.info("특정 캘린더 리스트(calendarList) : " + calendarList);
		
		model.addAttribute("calendarList", calendarList);
		
		return "managepage/manage/empCalendar";
	}
	
	/**
	 * 전체 캘린더 보기
	 * @return
	 */
	/*
	@ResponseBody
	@GetMapping("/getEmpCalendar")
	public List<Map<String,Object>> getEmpCalendar() {
		
		// 캘린더 전체일정
		List<GanttVO> empCalendarList = this.ganttService.getEmpCalendar();
		log.info("캘린더 전체일정(empCalendarList) : " + empCalendarList);
		
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		
		for(GanttVO calendarVO : empCalendarList) {
			calList.add(voToMap(calendarVO));
		}
		log.info("ganttDetail->mapList : " + mapList);
		*/
		/*
		ProjectVO projectVOList = this.ganttService.ganttDetail(map);
		log.info("ganttDetail->projectVOList(후) : " + projectVOList);
		
		
		List<GanttVO> ganttVOList = projectVOList.getGanttVOList();
		log.info("ganttDetail->ganttVOList : " + ganttVOList);
		
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		
		for(GanttVO ganttVO : ganttVOList) {
			mapList.add(voToMap(ganttVO));
		}
		log.info("ganttDetail->mapList : " + mapList);
		*/
	/*	
		return mapList;
	}
	*/
	/*
	public Map<String,Object> calToMap(GanttVO ganttVO, ProjectVO projectVO){
		Map<String,Object> map = new HashMap<String,Object>();
		log.info("voToMap -> ganttVO : " + ganttVO);
		map.put("id", ganttVO.getGanttChartsNo());
		map.put("text", ganttVO.getProJobNm());
		map.put("type", ganttVO.getProColor());
		map.put("order", "10");
		map.put("progress", ganttVO.getProProgrsRt());
		map.put("open", "1");
		map.put("user", ganttVO.getMemName());
		map.put("start_date", ganttVO.getProStartDate());
		map.put("duration", ganttVO.getProDuration());
		map.put("end_date", ganttVO.getProEndDate());
		map.put("parent", ganttVO.getProjectNo());
		log.info("voToMap->map : " + map);
		return map;
	}
	*/
	
}



















