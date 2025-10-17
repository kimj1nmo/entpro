package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {

	//댓글
		private int    cmmtNo;			//댓글 번호 
		private int    cmmtParentNo;	//부모 댓글 번호
		private int    commNo;			//게시글 번호
		private String memId;			//댓글 작성자 아이디
		private Date   cmmtDate;		//작서일
		private String cmmtCn;			//댓글 내용
		private int    cmmtYn;			// 삭제 여부
		
//		private String  memName; // 댓글 	작성 회원명
		private String  commRegNick; // 댓글 	작성 회원 닉네임
		private String  fileSaveLocate; // 댓글 작성 회원 대표 사진
		private int 	lvl; //계층형 레벨
		
		private String  groupName; // 댓글 작성 회원 대표 사진
		private String  commCn; // 댓글 작성 회원 대표 사진
		
	    private int isMembership;    // 멤버십 여부 (1: 멤버십, 0: 일반 회원)

		
}
