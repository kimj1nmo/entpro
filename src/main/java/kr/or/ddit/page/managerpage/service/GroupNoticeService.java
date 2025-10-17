package kr.or.ddit.page.managerpage.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.GroupNoticeVO;

public interface GroupNoticeService {

	// 그룹별 공지사항 리스트
	public List<GroupNoticeVO> getList(Map<String, Object> map);
	// 그룹별 공지사항 리스트 총 갯수
	public int getTotal(Map<String, Object> map);
	// 모든 공지사항 리스트
	public List<GroupNoticeVO> getAllList();
	// 그룹공지사항 생성
	public int createGroupNotice(GroupNoticeVO groupNoticeVO);
	// 그룹공지사항 삭제
	public int deleteGroupNotice(GroupNoticeVO groupNoticeVO);

}
