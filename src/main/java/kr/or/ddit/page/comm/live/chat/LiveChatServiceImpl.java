package kr.or.ddit.page.comm.live.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.LiveChatVO;

@Service
public class LiveChatServiceImpl implements LiveChatService {

	@Autowired
	LiveChatMapper liveChatMapper;

	//방송중 채팅 내용 저장
	@Override
	public int chatSave(LiveChatVO liveChatVO) {
		//첫번째로 채팅 내용을 담은 테이블에 저장
		int result= liveChatMapper.chatSave(liveChatVO);
		//두번쨰로 발송자 내용을 저장
		return liveChatMapper.chatSaveForward(liveChatVO);
	}

}
