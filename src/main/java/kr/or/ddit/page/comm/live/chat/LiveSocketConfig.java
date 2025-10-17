package kr.or.ddit.page.comm.live.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSocket
public class LiveSocketConfig implements WebSocketConfigurer  {

	@Autowired
	private LiveSocketIntercepter liveSocketIntercepter;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {

		log.debug("체킁");
		registry
		.addHandler(webSocketHandler(), "/chat/*")
		.setAllowedOriginPatterns("*")
		.addInterceptors(liveSocketIntercepter);

	}


	@Bean
	protected WebSocketHandler webSocketHandler() {

		log.debug("체로롱");
		return new LiveWebSocketHandler();

	}

}