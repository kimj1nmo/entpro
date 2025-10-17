package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class LiveChatVO {


	private int liveChatNo;
	private int liveNo;
	private String liveChatCn;
	private Date liveChatTime;


	//발송자 정보
	private int liveChatForwardNo;
	private String memId;
	private String commRegNick;
}
