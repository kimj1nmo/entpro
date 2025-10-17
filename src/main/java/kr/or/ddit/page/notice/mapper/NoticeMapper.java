package kr.or.ddit.page.notice.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
	public List<NoticeVO> list(Map<String, Object> map);
	public int getTotal(Map<String, Object> map);
	public int createPostAjax(NoticeVO noticeVO);
	public int deletePostAjax(NoticeVO noticeVO);
	public int updatePostAjax(NoticeVO noticeVO);
}
