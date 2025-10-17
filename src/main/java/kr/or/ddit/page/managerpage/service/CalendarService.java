package kr.or.ddit.page.managerpage.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.SchdulVO;

public interface CalendarService {

	//그룹 전체 가져오가ㅣ
	public int getTotal(Map<String, Object> map);

	//한페이지당 리스트 가져오기
	public List<GroupsVO> listSort(Map<String, Object> map);

	//그룹 생성
	public int createGroup(GroupsVO groupsVO);

	//그룹상세
	public GroupsVO groupDetail(int groupNo);

	//그룹에서 아티스트 삭제
	public int groupArtistDel(Map<String, Integer> map);

	//아티스트 검색
	public List<ArtistVO> artistSearch(ArtistVO artistVO);
	
	// 캘린더 이벤트 추가
    public int addCalendarEvent(SchdulVO schdulVO);

    // 캘린더 이벤트 수정
    public int updateCalendarEvent(SchdulVO schdulVO);

    // 캘린더 이벤트 삭제
    public int deleteCalendarEvent(int schdulNo);

    // 그룹에 해당하는 캘린더 이벤트 조회
    public List<SchdulVO> getCalendarEvent(int groupNo);
    
 // 일정 번호로 캘린더 이벤트 상세 조회
    public SchdulVO getEventDetails(int schdulNo);
    
    // 그룹 리스트 조회
    List<GroupsVO> getGroupList();

}
