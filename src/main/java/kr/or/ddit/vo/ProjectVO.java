package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class ProjectVO {

	// DB상 컬럼
	private int proNo;
	private String proTtl;
	private String proManager;
	private String proRegDate;	// 이걸 TO_CHAR 사용시 DATE 타입 사용 금지
	private String proDeadline;	// 이걸 TO_CHAR 사용시 DATE 타입 사용 금지
	private String proComment;
	private int rnum;	// 행번호
	private String cut;	// 리스트에 나올 SUBSTR한 문자열
	private String minusDuration;	// 빼기로 구현한 기간
	private String projectNo;	// 자신 번호(부모니깐)
	private String proDeadlineStr;	// 마감일 yyyymmdd 형식으로 만들기
	private String proRegDateStr;	// 마감일 yyyymmdd 형식으로 만들기

	private int percentage; // 동적 백분율 구하기
	private int gpercentage; // 동적 백분율 구하기
	private String proJobNm; // "진행경과" 탭 이름 불러오기
	private String proStartDate; // 간트차트 시작일
	private String proEndDate; // 간트차트 종료일
	private String proYn; // 간트차트 종료일

	private String memName; // 직원이름
	private String memId; // 직원이름
	private String proColor;

	// 직원 부서번호
	private String departNo;

	// 직원 부서이름
	private String departName;

	// 차트 프로젝트별 시행횟수
	private int proTtlCnt;
	// 통계용 선택년도
	private int year;
	// 통계용 작년년도
	private int lastYear;
	// 그룹 이름
	private String groupName;
	// 그룹 번호
	private int groupNo;
	// 그룹 년도별 참여 횟수
	private int groupNoCntSum;






	//PROJECT : PROJECT_GANTTCHARTS = 1 : N
	private List<GanttVO> ganttVOList;
}
