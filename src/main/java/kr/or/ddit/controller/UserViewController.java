package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.mapper.UsersMapper;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@PreAuthorize("isAnonymous()")
@Controller
@Slf4j
public class UserViewController {

	@Autowired
	UsersMapper usersMapper;

	// /login 요청 URI를 요청하면 login() 메서드로 매핑됨
	// 뷰리졸버에 의해 /WEB-INF/views/ + login + .jsp로 조립되어 forwarding
	@GetMapping("/login")
	public String login() {
		return "account/login";
	}

	// /signup 요청 URI를 요청하면 signup() 메서드로 매핑됨
	// 뷰리졸버에 의해 /WEB-INF/views/ + signup + .jsp로 조립되어 forwarding
	@GetMapping("/signup")
	public String signup() {
		return "account/signup";
	}

	// /findId 요청 URI를 요청하면 findId() 메서드로 매핑됨
	// 뷰리졸버에 의해 /WEB-INF/views/ + findId + .jsp로 조립되어 forwarding
	@GetMapping("/findId")
	public String findId() {
		return "account/findId";
	}

	//아이디 찾기
	@ResponseBody
	@PostMapping("/findIdResultAjax")
	public MemberVO findIdResultAjax(@RequestBody MemberVO memberVO) {
		log.info("ajax 시작");
		memberVO=usersMapper.findId(memberVO);
		log.info("아이디를 찾은 memberVO",memberVO);

		return memberVO;
	}

	//비밀번호 찾기
	@ResponseBody
	@PostMapping("/findPwResultAjax")
	public MemberVO findPwResultAjax(@RequestBody MemberVO memberVO) {
		log.info("ajax 시작");
		memberVO=usersMapper.findPw(memberVO);
		log.info("아이디를 찾은 memberVO",memberVO);

		return memberVO;
	}

	// /findPw 요청 URI를 요청하면 findPw() 메서드로 매핑됨
	// 뷰리졸버에 의해 /WEB-INF/views/ + findPw + .jsp로 조립되어 forwarding
	@GetMapping("/findPw")
	public String findPw() {
		return "account/findPw";
	}

	//아이디 중복 확인
	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(@RequestBody String memId) {

		int result=usersMapper.idChk(memId);
		return result;
	}
	/**
	 * 기본 로그인을 위한 유저(TB_MEMBERS) 및 권한(TB_AUTHS)
	 * 테이블 생성 및 데이터 생성
	 */
	@PostMapping("/createMembersAuths")
	public String createMembersAuths() {
		//테이블이 이미 있는제 체크
		int chk = this.usersMapper.beforeChk();

		if(chk>0) {//이미 있으면
			return "exist";
		}else {
			return "noTables";
		}
	}

}
