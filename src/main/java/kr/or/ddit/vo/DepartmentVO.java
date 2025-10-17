package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class DepartmentVO {
	
	// DEPARTMENT 테이블 기본 컬럼
	private int departNo;
	private String departName;
	private int departParent;
	// 직원이름
	private String memName;
	// 직원아이디
	private String memId;
	// 프로젝트 직원 참여날짜
	private String regDate;
	// 참여 프로젝트명
	private String proJobNm;
	// 회원 리스트
	private List<MemberVO> memberVOList;
	// 행번호
	private int rnum;
	// 현재 프로젝트 번호
	private int proNo;
	
}
