package kr.or.ddit.page.event.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EventVO;

public interface EventService {
    List<EventVO> list(Map<String, Object> map);
    int getTotal(Map<String, Object> map);
    EventVO detail(int evtBoardNo);
	int insertPost(EventVO eventVO);
	int updatePost(EventVO eventVO);
	int deletePost(EventVO eventVO);
}
