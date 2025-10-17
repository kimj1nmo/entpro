package kr.or.ddit.vo;

import lombok.Data;

@Data
public class GroupNoticeVO {
	
	// 페이징 번호
	private int rnum;
	// 그룹별공지사항 테이블 컬럼
	private int groupNo;
	private String groupNoticeNm;
	private String groupNoticeCn;
	private String regDate;
	private int groupNoticeNo;
	// 그룹 이름
	private String groupName;
	
}
