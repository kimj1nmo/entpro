package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AlbumVO {
	private int artistNo;
	private int albumNo;
	private int groupNo;
	private String albumTtl;
	private Date albumDate;
	private String albumType;
	private String albumAgency;
	private int fileGroupNo;
	private Date albumRegDate;
	private String albumInputter;

	private String groupName;
	private String artistName;

	List<String> artistNameList;

	List<SoundInfoVO> SoundInfoList;
	   //MEMBER : FILE_GROUP = 1 : 1
	   private FileGroupVO fileGroupVO;

	   //이미지 파일들
	   private MultipartFile[] uploadFiles;

}
