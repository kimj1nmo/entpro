package kr.or.ddit.page.comm.live.chat;


import java.util.Enumeration;
import java.util.Map;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component  // 그냥 Bean, new
public class LiveSocketIntercepter implements HandshakeInterceptor {

	//httt[Session에 값에 담긴 정보를 이하 입력 필요
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {

		HttpServletRequest req = ((ServletServerHttpRequest)request).getServletRequest();
		HttpSession session  =  req.getSession(false);

		// HttpSession에 머가 들어있다면 담장
		if(session != null) {

			Enumeration<String> attNames = session.getAttributeNames();

			while(attNames.hasMoreElements()) {
				String attName = attNames.nextElement();
				Object attValue = session.getAttribute(attName);
				attributes.put(attName,attValue);
			}
		}
		// 그냥 계속 진행
		return  true;

	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {

	}


}