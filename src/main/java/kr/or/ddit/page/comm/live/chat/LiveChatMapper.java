package kr.or.ddit.page.comm.live.chat;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.LiveChatVO;
@Mapper
public interface LiveChatMapper {
	//방송중 채팅 내용 저장
	int chatSave(LiveChatVO liveChatVO);
	//발송자 정보 저장
	int chatSaveForward(LiveChatVO liveChatVO);

}
