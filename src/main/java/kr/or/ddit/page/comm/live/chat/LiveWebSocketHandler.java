package kr.or.ddit.page.comm.live.chat;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.vo.LiveChatVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LiveWebSocketHandler extends TextWebSocketHandler {

	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();

	@Autowired
	LiveChatService chatService;

	@Override // 처음 접속되었을 때
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("## 누군가 접속");
		list.add(session);
	}

	@Override // 요게 제일 중요, 요기에 모든 처리 로직이 들어감,
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String uMsg = message.getPayload();
		log.info("uMsg {}", uMsg);

		// 웹소켓 session에 http session값이 잘 담겨 있는지 확인!
		Map<String, Object> yjMap = session.getAttributes();
		for (String yjKey : yjMap.keySet()) {
			log.info("체크광 {} {}", yjKey, yjMap.get(yjKey));
		}

		// 잭스 라이브러리 직접 사용하여 변환
		ObjectMapper objMapper = new ObjectMapper();

		// json 문자열를 자바 객체로 변환
		LiveChatVO liveChatVO = objMapper.readValue(uMsg, LiveChatVO.class);

		log.info("클라이언트가 보낸 메세지 {}", uMsg);
		log.info("변환 성공? {}", liveChatVO);
		int result=chatService.chatSave(liveChatVO);
		//채팅정보를 db에저장
		log.info("저장 성공? {}", liveChatVO);


		Date liveChatTime = liveChatVO.getLiveChatTime();
		SimpleDateFormat sdf = new SimpleDateFormat("HH시 mm분");
		String formatliveChatTime = sdf.format(liveChatTime);

		System.out.println(formatliveChatTime);

//		liveChatVO.setLiveChatCn("memId("+liveChatVO.getMemId()+"):" + liveChatVO.getLiveChatCn());
		liveChatVO.setLiveChatCn("<div>" +liveChatVO.getCommRegNick()+"("+formatliveChatTime+"):<br>"+liveChatVO.getLiveChatCn() + "</div>");
//"<div>" +chatVO.memId+"("+formatliveChatTime+"):<br>"+ chatVO.liveChatCn + "</div>"

		Date date = new Date();



		liveChatVO.setLiveChatTime(date);
		log.info("변환 성공? {}", liveChatVO);

		// 자바객체를 json 문자열로 바꿔줌
		String jsonMsg = objMapper.writeValueAsString(liveChatVO);
		TextMessage txtMsg = new TextMessage(jsonMsg);

		// 접속한 모든 사람에게 전달,(broadcast)
		for (WebSocketSession wSession : list) {
//			if(session!=webSocketSession) {	//보낸 사람 섹션이면
			if (wSession.isOpen()) {

			} // 필요할 수 있음
			log.info("wSession {}", wSession.getUri().toString());
			log.info("wSession 5{}", wSession.getUri().toString().split("/")[4]);
			String strIp = wSession.getUri().toString().split("/")[4];
			if((liveChatVO.getLiveNo()+"").equals(strIp)) {
				wSession.sendMessage(txtMsg);
			}
//			}
		}
	}

	@Override // 접속이 해체 되었을 떄 자동 실행
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("## 누군가 떠남");
		list.remove(session);
	}

}