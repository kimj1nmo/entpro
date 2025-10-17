package kr.or.ddit.page.main;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.AuditionReqstVO;
import kr.or.ddit.vo.AuditionVO;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.GroupsVO;

public interface MainService {

	//검색된 아티스트
	public List<ArtistVO> searchArtist(String searchName);

	//검색된 그룹
	public List<GroupsVO> searchGroups(String searchName);

	//검색된 굿즈
	public List<GoodsVO> searchGoods(String searchName);

	//메인에 검색되는 그룹띄우기
	public List<GroupsVO> getGroupsAll();

	// 모든 굿즈 리스트 조회
	public List<GoodsVO> getAllGoods();

		// 굿즈 카테고리 목록 조회
	public List<GoodsVO> getCategoryList();

	//  특정 굿즈 상세 정보 조회 (추가)
    public GoodsVO getGoodsByNo(int gdsNo);
	//오디션 신청 갯수
	public int getReqstTotal(Map<String, Object> map);

	//오디션 신청 리스트
	public List<AuditionReqstVO> getReqstListAjax(Map<String, Object> map);

	public List<AuditionVO> getAudList();

	public int audReqstInsert(AuditionReqstVO auditionReqstVO);

	public List<GroupsVO> getCommList(String username);

	//선택한 정보 가져오기
	public AuditionReqstVO getReqstDetail(AuditionReqstVO auditionReqstVO);

	//선택한 오디션신청 지우기
	public int audReqstDetailDel(AuditionReqstVO auditionReqstVO);


}
