package kr.or.ddit.page.managerpage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.managerpage.service.ProjectService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.ProjectEmpVO;
import kr.or.ddit.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/managepage/manage")
@Controller
public class ProjectController {

	@Autowired
	ProjectService projectService;

	/**
	 * 메인, 리스트 같이 있는 곳
	 * @param projectVO
	 * @param model
	 * @return
	 */
	@GetMapping("/list")
	public String list(ProjectVO projectVO, Model model) {
		log.info("list->projectVO(전) : " + projectVO);

		// 프로젝트 리스트 불러오기
		projectVO = this.projectService.list(projectVO.getProNo());
		log.info("list->projectVO(후) : " + projectVO);

		List<ProjectVO> projectVOList = this.projectService.detailInfo(projectVO);

		model.addAttribute("projectVO", projectVO);
		model.addAttribute("projectVOList", projectVOList);
		log.info("list->projectVO : " + projectVO);
		log.info("list->projectVOList : " + projectVOList);

		return "managepage/manage/list";
	}

	@ResponseBody
	@GetMapping(value = "/getEmp", produces="application/json;charset=utf-8")
	public List<ProjectEmpVO> getEmp(ProjectEmpVO projectEmpVO) {
		log.info("직원 리스트 파라미터(projectEmpVO) : " + projectEmpVO);

		List<ProjectEmpVO> projectEmpVOList = this.projectService.getEmp(projectEmpVO);
		log.info("직원 리스트 가져오기(projectEmpVOList) : " + projectEmpVOList);

		return projectEmpVOList;
	}

	/**
	 * 모델 주입용
	 * @param projectVO
	 * @param model
	 * @return
	 */
	@GetMapping("/approve")
	public String approve(ProjectVO projectVO, Model model, ProjectEmpVO projectEmpVO, GroupsVO groupsVO) {
		log.info("approve->projectVO(전) : " + projectVO);

		projectVO = this.projectService.list(projectVO.getProNo());
		log.info("approve->projectVO체킁 : " + projectVO);

		List<ProjectVO> projectVOList = this.projectService.detailInfo(projectVO);

		List<ProjectEmpVO> projectEmpVOList = this.projectService.getEmp(projectEmpVO);
		log.info("직원 리스트 가져오기(projectEmpVOList) : " + projectEmpVOList);

		// 그룹 이름 가져오기
		List<GroupsVO> groupsVOList = this.projectService.getGroups(groupsVO);
		log.info("그룹 이름 가져오기(groupsVOList) : " + groupsVOList);

		model.addAttribute("projectVO", projectVO);
		model.addAttribute("projectVOList", projectVOList);
		model.addAttribute("projectEmpVOList", projectEmpVOList);
		model.addAttribute("groupsVOList", groupsVOList);
		log.info("approve->projectVO(후) : " + projectVO);
		log.info("approve->projectVOList : " + projectVOList);

		return "managepage/manage/approve";
	}

	/*
	요청URI : /managepage/manage/detailInfo
	요청파라미터 : {"proNo": 102} *JSONString이 아님=>RequestBody가 필요없음
	요청방식 : post
	 */
	//More Info 클릭 시
//	@ResponseBody
//	@PostMapping("/detail")
//	public ProjectVO detail(ProjectVO projectVO) {
//		log.info("detailInfo->projectVO(전) : " + projectVO);
//
//		//상세
//		projectVO = this.projectService.list(projectVO.getProNo());
//		log.info("detailInfo->projectVO(후) : " + projectVO);
//
//		return projectVO;
//	}



	/**
	 * 비동기 프로젝트 리스트
	 * @param map
	 * @return articlePage
	 */
	@ResponseBody
	@PostMapping("/listAjax")
	public ArticlePage<ProjectVO> listAjax(@RequestBody Map<String, Object> map) {
		log.info("listAjax -> map : " + map);

		   List<ProjectVO> projectVOList = this.projectService.listAjax(map);
		   log.info("listAjax -> projectVOList : " + projectVOList);

		   //total, currentPage, size, content, keyword
		   int total = this.projectService.getTotal(map);//map
		   log.info("listAjax -> total : " + total);

		   // map{currentPage=1&keyword=}
		   // 1. currentPage
		   int currentPage = 1; // 1페이지

		   // map.get("키") -> object 리턴
		   if(map.get("currentPage") != null) {
			   // map.get("currentPage") -> null
			   //							null.toString() -> 오류 발생
			   currentPage = Integer.parseInt(map.get("currentPage").toString());
		   }

//		    2. keyword
		   String keyword = ""; // 검색이 없는 것이 기본

		   if(map.get("keyword") != null) {
			   // map.get("currentPage") -> null
			   // 							null.toString() -> 오류 발생
			   keyword = map.get("keyword").toString();
		   }

		   //페이지 객체 생성
		   ArticlePage<ProjectVO> articlePage =
				   new ArticlePage<ProjectVO>(total, currentPage, 10, projectVOList
						   , keyword, "ajax");
		   log.info("listAjax -> articlePage : " + articlePage);

		   // 데이터 리턴 -> ResponseBody(Object->String)
		   return articlePage;
	}

//	@GetMapping("/approve")
//	public String create() {
//
//		return "managepage/manage/approve";
//	}

	/**
	 * 비동기 등록
	 * @param projectVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/createPostAjax")
	public int createPostAjax(@RequestBody ProjectVO projectVO) {
		log.info("createPostAjax -> projectVO : " + projectVO);

		int result = this.projectService.createPostAjax(projectVO);
		log.info("createPostAjax -> result : " + result);

		return result;
	}

	/**
	 * 비동기 수정
	 * @param proNo
	 * @param projectVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/updatePostAjax")
	public int updatePostAjax(@RequestBody ProjectVO projectVO) {
		log.info("updatePostAjax -> projectVO : " + projectVO);

		int result = this.projectService.updatePostAjax(projectVO);
		log.info("updatePostAjax -> result : " + result);

		return result;
	}

	@ResponseBody
	@PutMapping("/deletePostAjax")
	public int deletePostAjax(@RequestBody ProjectVO projectVO) {
		log.info("deletePostAjax -> projectVO: " + projectVO);

		int result = this.projectService.deletePostAjax(projectVO);
		log.info("deletePostAjax -> result: " + result);

		return result;
	}

	@GetMapping("/detail/{proNo}")
	public String detail(@PathVariable int proNo,
			Model model, GanttVO ganttVO) {
		log.info("detail->proNo : " + proNo);

		// 상위 차트별 정보 구하기
		ProjectVO projectVO = this.projectService.detail(proNo);
		log.info("detail->projectVO : " + projectVO);

		// 상세화면
		List<ProjectVO> projectVOList = this.projectService.detailInfo(projectVO);
		log.info("detail->projectVOList : " + projectVOList);

		// 파일함 불러오기
		List<GanttVO> ganttVOList = this.projectService.getFile(ganttVO);
		log.info("detail->ganttVOList : " + ganttVOList);

		// 담당자 불러오기
		List<ProjectVO> projectVO2 = this.projectService.getManager(proNo);
		log.info("detail->projectVO2 : " + projectVO2);

		model.addAttribute("ganttVOList", ganttVOList);
		model.addAttribute("projectVO", projectVO);
		model.addAttribute("projectVO2", projectVO2);
		model.addAttribute("projectVOList", projectVOList);
		log.info("detail->model : " + model);

		return "managepage/manage/detail";
	}

	/**
	 * 특정 차트 직원 리스트 가져오기
	 * @param proNo
	 * @param model
	 * @return
	 */
	@GetMapping("/projectEmpList/{proNo}")
	public String projectEmpList(@PathVariable(value = "proNo") int proNo
			, Model model) {
		log.info("주소 경로(proNo) : " + proNo);

		// 특정 차트 직원 리스트
		List<DepartmentVO> departmentVOList = this.projectService.projectEmpList(proNo);
		log.info("특정 차트 리스트(departmentVOList) : " + departmentVOList);

		ProjectVO projectVO = this.projectService.detail(proNo);
		log.info("detail->projectVO : " + projectVO);

		model.addAttribute("projectVO", projectVO);
		model.addAttribute("departmentVOList", departmentVOList);

		return "managepage/manage/projectEmpList";
	}

	/**
	 * 모달창 직원 추가
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getEmpList")
	public ArticlePage<DepartmentVO> getEmpList(@RequestBody Map<String, Object> map) {
		log.info("직원 가져오기 파라미터(map) : " + map);

		// 전체 직원 리스트
		List<DepartmentVO> departmentVOList = this.projectService.getEmpList(map);
		log.info("전체 직원 리스트(departmentVOList) : " + departmentVOList);

		// 참여직원 총인원수 구하기
		int total = this.projectService.getEmpTotal(map);
		log.info("참여직원 총인원수 구하기(total) : " + total);

		// 기본 1페이지
		int currentPage = 1; // 1페이지

		// map.get("키") -> object 리턴
		if(map.get("currentPage") != null) {
		// map.get("currentPage") -> null
		//							null.toString() -> 오류 발생
		currentPage = Integer.parseInt(map.get("currentPage").toString());
		}

				    // 2. keyword
		String keyword = ""; // 검색이 없는 것이 기본

		if(map.get("keyword") != null) {
		// map.get("currentPage") -> null
		// 							null.toString() -> 오류 발생
		keyword = map.get("keyword").toString();
		}

		//페이지 객체 생성
		ArticlePage<DepartmentVO> articlePage =
				   new ArticlePage<DepartmentVO>(total, currentPage, 10, departmentVOList
						   , keyword, "ajax");
		log.info("페이지객체 생성결과(articlePage) : " + articlePage);

		// 데이터 리턴 -> ResponseBody(Object->String)
		return articlePage;
	}

	@ResponseBody
	@PostMapping("/createEmp")
	public int createEmp(@RequestBody List<ProjectEmpVO> empList) {
		log.info("직원 추가 파라미터(projectEmpVO) : " + empList);

		// 직원 추가 성공 여부
		int result = 0;
		for (ProjectEmpVO emp : empList) {
			result += this.projectService.createEmp(emp);
		}

		log.info("직원 추가 성공 여부(result) : " + result);

		return result;
	}

	@ResponseBody
	@DeleteMapping("/deleteEmp")
	public int deleteEmp(@RequestBody List<ProjectEmpVO> deleteList) {
		log.info("직원 삭제파라미터(projectEmpVO) : " + deleteList);

		// 직원 삭제 성공 여부
		int result = 0;
		for (ProjectEmpVO deleteVO : deleteList) {
			result += this.projectService.deleteEmp(deleteVO);
		}
		log.info("직원 삭제 결과(result) : " + result);

		return result;
	}

	/**
	 * 참여중 직원 리스트
	 * @return
	 */
	@ResponseBody
	@GetMapping("/allEmpList")
	public List<ProjectVO> allEmpList(){
		return this.projectService.allEmpList();
	}

}





















