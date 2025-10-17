package kr.or.ddit.page.managerpage.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.ProjectEmpVO;
import kr.or.ddit.vo.ProjectVO;

public interface ProjectService {

	// 비동기 리스트
	public List<ProjectVO> listAjax(Map<String, Object> map);

	// 총 페이지 수
	public int getTotal(Map<String, Object> map);

	// 비동기 등록
	public int createPostAjax(ProjectVO projectVO);

	// 메인화면 겸 리스트
	public ProjectVO list(int proNo);

	// 상세화면
	public List<ProjectVO> detailInfo(ProjectVO projectVO);

	// 비동기 수정
	public int updatePostAjax(ProjectVO projectVO);

	// 비동기 삭제
	public int deletePostAjax(ProjectVO projectVO);

	// 동기 상세
	public ProjectVO detail(int proNo);

	// 파일함 불러오기
	public List<GanttVO> getFile(GanttVO ganttVO);

	// 담당자 불러오기(프로젝트 디테일부분)
	public List<ProjectVO> getManager(int proNo);

	// 직원 불러오기(프로젝트 리스트부분)
	public List<ProjectEmpVO> getEmp(ProjectEmpVO projectEmpVO);

	// 특정 차트 직원 리스트
	public List<DepartmentVO> projectEmpList(int proNo);

	// 전체 직원 리스트
	public List<DepartmentVO> getEmpList(Map<String, Object> map);

	// 총 직원 수
	public int getEmpTotal(Map<String, Object> map);

	// 직원 추가
	public int createEmp(ProjectEmpVO projectEmpVO);

	// 직원 삭제
	public int deleteEmp(ProjectEmpVO projectEmpVO);
	// 그룹 이름 가져오기
	public List<GroupsVO> getGroups(GroupsVO groupsVO);
	// 참여중 직원 리스트
	public List<ProjectVO> allEmpList();

	// "진행경과" 퍼센트 가져오기
//	public List<GanttVO> getPercentage(int proNo);

	// 기간 동적으로 나타내기
//	public ProjectVO percent(int proNo);


}
