package kr.or.ddit.page.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.MemberVO;

@Mapper
public interface mypageMapper {


	// 가입 총 커뮤니티 갯수 가져오기
		int getCommTotal(Map<String, Object> map);
		// 가입 총 맴버쉽 갯수 가져오기
		int getMemshipTotal(Map<String, Object> map);
		//가입한 커뮤니티 리스트 가져오기
		List<GroupsVO> getCommList(Map<String, Object> map);
		//가입한 맴버쉽 리스트 가져오기
		List<GroupsVO> getMemShipList(Map<String, Object> map);

		List<GroupsVO> addressList(Map<String, Object> map);

		//주소 넣기
		int addAddressAjax(AddressVO addressVO);
		//주소 디테일 가져오기
		AddressVO addressDetail(Map<String, Object> map);
		//기존 주소 데이터 업로드
		int UpdateAddressAjax(AddressVO addressVO);
		//기존 주소 삭제
		int addressDelAjax(Map<String, Object> map);
		//정보 가져오기
		MemberVO myProfileAjax(Map<String, Object> map);
		//정보 업데이트하기
		int memProfileUpdat(Map<String, Object> map);
		//맴버 지우기
		int deleteMemberAjax(Map<String, Object> map);
		//주소번호 가져오기
		MemberVO getMemberAddNO(Map<String, Object> map);


		//전자화폐 충전
		int chargeCrrncy(HashMap<String, Object> map);
}
