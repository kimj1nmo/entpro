package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProjectFileVO {
	private int ganttChartsNo;
	private long proFileNo;
	private String proFileName;
	private int proFileType;
	private String proFilePath;
	private Date proRegDate;
	
	// 프로젝트 번호
	private int proNo;
	//파일그룹 : 파일상세 = 1 : N
	private List<ProjectFileDetailVO> projectFileDetailVOList;
	
}
