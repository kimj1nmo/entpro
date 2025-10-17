package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class LiveVO {
	private int liveNo;
	private int vodNo;
	private int memshipState;
	private String liveName;
	private int liveView;
	private Date liveDate;
	private String memId;
	private long fileGroupNo;

	private int liveStatus;

	private int commRegNo;
	private Date commRegJoin;
	private String commRegNick;

    //MEMBER : FILE_GROUP = 1 : 1
	   private FileGroupVO fileGroupVO;
	   private VodVO vodVO;

	   @JsonIgnore
	   private MultipartFile[] uploadFiles;
}
