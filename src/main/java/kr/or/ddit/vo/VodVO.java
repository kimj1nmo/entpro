	package kr.or.ddit.vo;

	import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

	@Data
	public class VodVO {
		private int liveNo;
		private int vodType;
		private int groupNo;
		private int vodNo;
		private String vodName;
		private String memId;
		private int vodPlaytime;
		private int vodView;
		private String vodPath;
		private int vodStatus;

		private int commRegNo;
		private Date commRegJoin;
		private String commRegNick;
		private long fileGroupNo;
		   private MultipartFile[] uploadFiles;

	    //MEMBER : FILE_GROUP = 1 : 1
		   private FileGroupVO fileGroupVO;
	}
