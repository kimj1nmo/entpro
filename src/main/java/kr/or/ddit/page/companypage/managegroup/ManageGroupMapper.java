package kr.or.ddit.page.companypage.managegroup;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;

@Mapper
public interface ManageGroupMapper {
	//그룹 전체 가져오기
	public int getTotal(Map<String, Object> map);

	public List<GroupsVO> listSort(Map<String, Object> map);
	//그룹 생성
	public int createGroup(GroupsVO groupsVO);
	//그룹 상세
	public GroupsVO groupDetail(int groupNo);
	//그룹에서 아티스트 삭제
	public int groupArtistDel(Map<String, Integer> map);

	//아티스트 검색
	public  List<ArtistVO> artistSearch(ArtistVO artistVO);

	//맴버가 있는지 파악
	public int checkArtistExists(Map<String, Object> map);

    // 그룹데이터에 아티스트 추가 하기
	public int artistInsertGroup(Map<String, Object> map);

	//그룹 업데이트
	public int updateGroup(GroupsVO groupsVO);
}
