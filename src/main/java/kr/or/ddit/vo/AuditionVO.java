package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AuditionVO {
	private int audNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd") //변환
	private Date audDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd") //변환
	private Date audAuddate;
	private String audDtls;
	private String audLc;
	private String audNm;
	private int audType;
	private int audCheck;

	private long fileGroupNo;
	   private int rnum;

	   //MEMBER : FILE_GROUP = 1 : 1
	   private FileGroupVO fileGroupVO;

	   //이미지 파일들
	   private MultipartFile[] uploadFiles;

}
