package kr.or.ddit.service;

import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.UsersVO;

public interface UserService {

	//회원 가입
	public int save(MemberVO memberVO);

	//
	public int changePw(MemberVO memberVO);

	//화폐 나은 수 가져오기
	public int crrncySumAjax(MemberVO memberVO);

	//비교할 정보 가져오기
	public MemberVO getMember(Map<String, Object> map);

	 public boolean checkPassword(String rawPassword, String encodedPassword);
}
