package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProjectFileDetailVO {
	private int fileSn;
	private long proFileNo;
	private String fileOriginalName;
	private String fileSaveName;
	private String fileSaveLocate;
	private long fileSize;
	private String fileExt;
	private String fileMime;
	private String fileFancysize;
	private Date fileSaveDate;
	private int fileDwldCnt;
}
