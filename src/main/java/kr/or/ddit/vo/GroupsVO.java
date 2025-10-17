package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GroupsVO {

	private int groupNo;
	private String groupName;

	@DateTimeFormat(pattern = "yyyy-MM-dd") //변환
	private Date groupBirth;
	@DateTimeFormat(pattern = "yyyy-MM-dd") //변환
	private Date groupDspgn;
	private String groupIntrcn;
	private long fileGroupNo;
	private String fileSaveLocate;// 사진 웹경로
	private int communityCount;// 추가(가입회원수)
	private String groupBirthInputter;
	private String groupDspgnInputter;

	   //MEMBER : FILE_GROUP = 1 : 1
	   private FileGroupVO fileGroupVO;

	   //이미지 파일들
	   private MultipartFile[] uploadFiles;

	   //아티스트 목록
	   private List<ArtistVO> artistList;

	   //마이창 정보 확인용 data
	   private int commRegNo;
	   private Date commRegJoin;
	   private String commRegNick;

}
