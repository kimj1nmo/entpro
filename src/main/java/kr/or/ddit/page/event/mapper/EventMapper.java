package kr.or.ddit.page.event.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.EventVO;

@Mapper
public interface EventMapper {
    List<EventVO> list(Map<String, Object> map);
    public int getTotal(Map<String, Object> map);
    EventVO detail(int evtBoardNo);
	public int insertPost(EventVO eventVO);
	public int updatePost(EventVO eventVO);
	public int deletePost(EventVO eventVO);
}
