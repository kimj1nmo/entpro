package kr.or.ddit.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.UsersVO;

@Mapper
public interface UsersMapper {

	//email로 사용자 정보를 가져옴
	public UsersVO findByEmail(String email);

	//회원가입
	public int save(MemberVO memberVO);

	//권한등록
	public int saveAuths(MemberVO memberVO);

	//기본 로그인을 위한 유저(TB_MEMBERS) 및 권한(TB_AUTHS) 테이블이 이미 있는제 체크
	public int beforeChk();

	//아이디 찾기
	public MemberVO findId(MemberVO memberVO);

	//아이디 중복 확인
	public int idChk(String memId);

	//비밀번호 찾기
	public MemberVO findPw(MemberVO memberVO);

	//비밀번호 변경
	public int changePw(MemberVO memberVO);

	//화폐 액수 가져오기
	public Integer  crrncySumAjax(MemberVO memberVO);
	//비교할 정보 가져오기
	public MemberVO getMember(Map<String, Object> map);


}
