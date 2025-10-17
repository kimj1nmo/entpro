package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AuditionReqstVO {
	private int audReqstNo;
	private int audNo;
	private String audReqstNm;
	private String audReqstPw;
	private String audReqstTel;
	private int audReqstGen;
	private int ihidnum;
	private String audReqstAdd;
	private Date audReqstDt;
	private long fileGroupNo;
	private String audReqstDtls;
	private int audReqstPath;
	private int audReqstState;
	private String audReqstEmail;

	   //MEMBER : FILE_GROUP = 1 : 1
	   private FileGroupVO fileGroupVO;

	   //이미지 파일들

	   private MultipartFile[] uploadFiles;


	   private String audNm;
	   private int audType;
	   private String audLc;
}
