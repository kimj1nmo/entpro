package kr.or.ddit.page.managerpage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.page.managerpage.mapper.GroupNoticeMapper;
import kr.or.ddit.page.managerpage.service.GroupNoticeService;
import kr.or.ddit.vo.GroupNoticeVO;

@Service
public class GroupNoticeServiceImpl implements GroupNoticeService{

	@Autowired
	GroupNoticeMapper groupNoticeMapper;
	
	// 그룹별 공지사항 리스트
	@Override
	public List<GroupNoticeVO> getList(Map<String, Object> map) {
		return this.groupNoticeMapper.getList(map);
	}

	// 그룹별 공지사항 리스트 총 갯수
	@Override
	public int getTotal(Map<String, Object> map) {
		return this.groupNoticeMapper.getTotal(map);
	}

	// 모든 공지사항 리스트
	@Override
	public List<GroupNoticeVO> getAllList() {
		return this.groupNoticeMapper.getAllList();
	}
	
	// 그룹공지사항 생성
	@Override
	public int createGroupNotice(GroupNoticeVO groupNoticeVO) {
		return this.groupNoticeMapper.createGroupNotice(groupNoticeVO);
	}

	// 그룹공지사항 삭제
	@Override
	public int deleteGroupNotice(GroupNoticeVO groupNoticeVO) {
		return this.groupNoticeMapper.deleteGroupNotice(groupNoticeVO);
	}

}
