package kr.or.ddit.page.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class mypageServiceImpl  implements mypageService{

	@Autowired
	mypageMapper mypageMapper;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public List<GroupsVO> getCommList(Map<String, Object> map) {
		return mypageMapper.getCommList(map);
	}
	// 가입 총 커뮤니티 갯수 가져오기
	@Override
	public int getCommTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mypageMapper.getCommTotal(map);
	}
	// 가입 총 커뮤니티 갯수 가져오기
	@Override
	public int getMemshipTotal(Map<String, Object> map) {
		return mypageMapper.getMemshipTotal(map);

	}
	// 가입 총 맴버쉽 갯수 가져오기

	@Override
	public List<GroupsVO> getMemShipList(Map<String, Object> map) {
		return mypageMapper.getMemShipList(map);

	}
	@Override
	public List<GroupsVO> addressList(Map<String, Object> map) {
		return mypageMapper.addressList(map);
	}
	//주소 넣기

	@Override
	public int addAddressAjax(AddressVO addressVO) {
		return mypageMapper.addAddressAjax(addressVO);

	}
	//주소 디테일 가져오기
	@Override
	public AddressVO addressDetail(Map<String, Object> map) {
		return mypageMapper.addressDetail(map);
	}
	@Override
	public int UpdateAddressAjax(AddressVO addressVO) {
		return mypageMapper.UpdateAddressAjax(addressVO);
	}
	@Override
	public int addressDelAjax(Map<String, Object> map) {
		return mypageMapper.addressDelAjax(map);
	}
	//정보 가져오기
	@Override
	public MemberVO myProfileAjax(Map<String, Object> map) {
		return mypageMapper.myProfileAjax(map);

	}
	//개인정보 바꾸기

	@Override
	public int memProfileUpdat(Map<String, Object> map) {
    	String memPw = (String) map.get("memPw");
    	if (memPw!=null) {
    		//암호화(encrypt) 처리
    		memPw = this.bCryptPasswordEncoder.encode(memPw);
    		log.info("memProfileUpdat->memPw : " + memPw);
    		log.info("memProfileUpdat->map : " + map);
    	}

		//패스워드를 저장 시 시큐리티를 설정하며 패스워드 인코딩용으로 등록한 빈을
		//	사용해서 암호화한 후에 저장하자
		map.put("memPw",memPw);
		return mypageMapper.memProfileUpdat(map);
	}
	@Override
	public int deleteMemberAjax(Map<String, Object> map) {
		return mypageMapper.deleteMemberAjax(map);
	}
	//주소번호 가져오기
	@Override
	public MemberVO getMemberAddNO(Map<String, Object> map) {
		return mypageMapper.getMemberAddNO(map);
	}


	//전자화폐 충전
	@Override
	public int chargeCrrncy(HashMap<String, Object> map) {
		return mypageMapper.chargeCrrncy(map);

	}

}
