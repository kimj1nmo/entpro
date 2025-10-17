package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ArtistVO {
	private int artistNo;
	private String artistName;
	private String groupName;
	private String artistProfile;
    @DateTimeFormat(pattern = "yyyy-MM-dd") //변환
	private Date artistBirth;
	private String artistIntrcn;
	private String memId;
	private String commRegNick;

	//파일 넘버
	private long fileGroupNo;
	//그룹 관련

//	private int groupNo;
//	private String groupName;
//	private Date groupBirth;
	private String fileSaveLocate;// 사진 웹경로

	   //MEMBER : FILE_GROUP = 1 : 1
	   private FileGroupVO fileGroupVO;
	   //MEMBER : group= 1:N
	   private List<GroupsVO> groupVOList;

	   //이미지 파일들
	   private MultipartFile[] uploadFiles;
}
