package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVO {
	private int ntceBoardNo;
	private String ntceBoardTtl;
	private String ntceBoardCn;
	private String memId;
	private String regDate;
	
	
	private MultipartFile[] uploadFiles;
	private int rnum; 
	private long fileGroupNo;
	private FileGroupVO fileGroupVO;
}
