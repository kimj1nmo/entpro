package kr.or.ddit.page.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.vo.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> list(Map<String, Object> map);

	public int getTotal(Map<String, Object> map);
	public int createPostAjax(NoticeVO noticeVO);
	public int deletePostAjax(NoticeVO noticeVO);
	public int updatePostAjax(NoticeVO noticeVO);
}
