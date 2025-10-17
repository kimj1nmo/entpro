package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ProjectCalendarVO {
	// 프로젝트 테이블 부분
	private String proDeadline;
	private int proState;
	private String proRegDate;
	private int proNo;
	private String proTtl;
	// 캘린더 테이블 부분
	private String proBcrnColor;
	private String proTextColor;
}
