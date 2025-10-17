package kr.or.ddit.page.managerpage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.page.managerpage.mapper.ProjectMapper;
import kr.or.ddit.page.managerpage.service.ProjectService;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.ProjectEmpVO;
import kr.or.ddit.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProjectServiceImpl implements ProjectService {


	//DI(Dependency Injection) : 의존성 주입
	//IoC(Inversion of Control) : 제어의 역전
	@Autowired
	ProjectMapper projectMapper;

	// 비동기 리스트
	@Override
	public List<ProjectVO> listAjax(Map<String, Object> map) {
		return this.projectMapper.listAjax(map);
	}

	// 총 페이지 수
	@Override
	public int getTotal(Map<String, Object> map) {
		return this.projectMapper.getTotal(map);
	}

	// 비동기 등록
	@Override
	public int createPostAjax(ProjectVO projectVO) {
		return this.projectMapper.createPostAjax(projectVO);
	}


	// 메인화면 겸 리스트
	@Override
	public ProjectVO list(int proNo) {
		return this.projectMapper.list(proNo);
	}

	// 상세화면
	@Override
	public List<ProjectVO> detailInfo(ProjectVO projectVO) {
		return this.projectMapper.detailInfo(projectVO);
	}

	// 비동기 수정
	@Override
	public int updatePostAjax(ProjectVO projectVO) {
		return this.projectMapper.updatePostAjax(projectVO);
	}

	// 비동기 삭제
	@Override
	public int deletePostAjax(ProjectVO projectVO) {
		return this.projectMapper.deletePostAjax(projectVO);
	}

	// 동기 상세
	@Override
	public ProjectVO detail(int proNo) {
		return this.projectMapper.detail(proNo);
	}

	// 파일함 불러오기
	@Override
	public List<GanttVO> getFile(GanttVO ganttVO) {
		return this.projectMapper.getFile(ganttVO);
	}

	// 담당자 불러오기(프로젝트 디테일부분)
	@Override
	public List<ProjectVO> getManager(int proNo) {
		return this.projectMapper.getManager(proNo);
	}

	// 직원 불러오기(프로젝트 리스트부분)
	@Override
	public List<ProjectEmpVO> getEmp(ProjectEmpVO projectEmpVO) {
		return this.projectMapper.getEmp(projectEmpVO);
	}

	// 특정 차트 직원 리스트
	@Override
	public List<DepartmentVO> projectEmpList(int proNo) {
		return this.projectMapper.projectEmpList(proNo);
	}

	// 전체 직원 리스트
	@Override
	public List<DepartmentVO> getEmpList(Map<String, Object> map) {
		return this.projectMapper.getEmpList(map);
	}

	// 총 직원 수
	@Override
	public int getEmpTotal(Map<String, Object> map) {
		return this.projectMapper.getEmpTotal(map);
	}

	// 직원 추가
	@Override
	public int createEmp(ProjectEmpVO projectEmpVO) {
		return this.projectMapper.createEmp(projectEmpVO);
	}

	// 직원 삭제
	@Override
	public int deleteEmp(ProjectEmpVO projectEmpVO) {
		return this.projectMapper.deleteEmp(projectEmpVO);
	}

	// 그룹 이름 가져오기
	@Override
	public List<GroupsVO> getGroups(GroupsVO groupsVO) {
		return this.projectMapper.getGroups(groupsVO);
	}

	// 참여중 직원 리스트
	@Override
	public List<ProjectVO> allEmpList() {
		return this.projectMapper.allEmpList();
	}

	// "진행경과" 퍼센트 가져오기
//	@Override
//	public List<GanttVO> getPercentage(int proNo) {
//		return this.projectMapper.getPercentage(proNo);
//	}

	// 기간 동적으로 나타내기
//	@Override
//	public ProjectVO percent(int proNo) {
//		return this.projectMapper.percent(proNo);
//	}



}
