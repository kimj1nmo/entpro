package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CommLikeVO {
	
	// 좋아요 테이블
		private int commLikeNo; // 좋아요 일련번호
		private int commNo;		// 게시글 번호
		private String memId;	// 좋아요 누른 회원 아이디
		private int commLikeYn; // 좋아요 여부 1 좋아요 0 취소

}
