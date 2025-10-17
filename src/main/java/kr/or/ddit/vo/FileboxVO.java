package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileboxVO {
	private int proFileNo;
	private int proParentFileNo;
	private String proFileName;
	private int proFileType;
	private String proFilePath;
	
	private MultipartFile[] uploadFiles;
	
	// 프로젝트 번호
	private int proNo;
	// 간트차트 번호
	private int ganttChartsNo;
	// 파일저장경로
	private String fileSaveLocate;
	// 파일 형식
	private String fileExt;
	// 파일 원본 이름
	private String fileOriginalName;
	
	
}
