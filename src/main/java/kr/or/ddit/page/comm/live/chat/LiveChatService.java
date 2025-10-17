package kr.or.ddit.page.comm.live.chat;

import kr.or.ddit.vo.LiveChatVO;

public interface LiveChatService {
	//방송중 채팅 내용 저장
	int chatSave(LiveChatVO liveChatVO);

}
