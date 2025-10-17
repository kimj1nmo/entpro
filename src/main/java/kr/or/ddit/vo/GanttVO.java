package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GanttVO {
	private int ganttChartsNo;
	private int proNo;
	private String proJobNm;
	private String proStartDate;
	private String proEndDate;
	private String proProgrsRt;
	private long proFileNo;
	private String proColor;
	private int proDuration;
	private int proYn;
	
	private String fileCnt;
	
	// 담당자 이름
	private String memName;
	// 부모차트 번호
	private String projectNo;	
	// 부모차트 이름
	private String proTtl;
	// 파일 업로드 관련
	private MultipartFile[] uploadFiles; 
	// 파일 업로드 관련
	private ProjectFileVO projectFileVO; 
	// 동적 백분율 구하기
	private String proFileName; 
	// 동적 백분율 구하기
	private String proRegDate; 
	// 파일 저장 날짜
	private String fileSaveDate; 
	// 파일 원본 이름
	private String fileOriginalName; 
	// 파일 가상 저장 경로
	private String fileSaveLocate; 
	// 파일 확장자
	private String fileExt; 
	// 프로젝트 직원 아이디
	private String memId; 
	
	private List<ProjectEmpVO> projectEmpVOList;
	
}
