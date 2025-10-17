package kr.or.ddit.controller;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.UserService;
import kr.or.ddit.vo.AuthVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.UsersVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserApiController {

	@Autowired
	UserService userService;

	/*
      요청URI : /user
      요청파라미터 : request{email=test@test.com,password=asdf}
      요청방식 : post
       <!--
          요청URI : /user
          요청파라미터 : request{memId=z010,memName=개똥이10,memPw=java,uploadFiles=파일객체}
          요청방식 : post
           -->
	 */
	@PostMapping("/user")
	public String signup(MemberVO memberVO) {
		/*
		UsersVO(id=2, email=test@test.com
			, password=$2a$10$26Nre187gKSRlh.dhFV0N.ZpSDbXjL5VyrrgOWS1m1/J5DgoLdKlC, createdAt=null, updatedAt=null)
		 */
		log.info("signup->memberVO(전) : " + memberVO);

		//회원 가입 메서드 호출
		int result = this.userService.save(memberVO);
		log.info("signup->memberVO(후) : " + memberVO);
		//회원 가입이 완료된 이후에 로그인 페이지로 이동
		return "redirect:/login";
	}
	@ResponseBody
	@PostMapping("/changePwAjax")
	public MemberVO changePw(@RequestBody MemberVO memberVO) {

		log.info("changePw->memberVO(전) : " + memberVO);

		//회원 가입 메서드 호출
		int result = this.userService.changePw(memberVO);
		log.info("changePw->memberVO(후) : " + memberVO);
		//회원 가입이 완료된 이후에 로그인 페이지로 이동
		return memberVO;
	}
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		new SecurityContextLogoutHandler().logout(request, response,
				SecurityContextHolder.getContext().getAuthentication()
		);

		return "redirect:/login";
	}
	//로그인 정보 받아오기
    @ResponseBody
    @GetMapping("/api/userInfo")
    public MemberVO getUserInfo() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        MemberVO memberVO = new MemberVO();
        // 권한을 AuthVO 리스트로 변환
        List<AuthVO> authList = authentication.getAuthorities().stream()
            .map(authority -> {
                AuthVO authVO = new AuthVO();
                authVO.setAuthName(authority.getAuthority());  // 권한 이름을 authName에 설정
                authVO.setMemId(authentication.getName());     // 로그인한 사용자 아이디를 memId에 설정
                return authVO;
            })
            .collect(Collectors.toList());
        // 변환된 권한 리스트 설정
        memberVO.setAuthList(authList);
        //아이디 보내기
        memberVO.setMemId(authentication.getName());
        log.info("로그인 정보",memberVO.getAuthList());
        return memberVO; // 로그인한 사용자 아이디 보내기
    }
    //전자화폐 수량을 체크하기
    @ResponseBody
    @GetMapping("/api/crrncySumAjax")
    public int crrncySumAjax() {
    	 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
         MemberVO memberVO = new MemberVO();
         memberVO.setMemId(authentication.getName());

    	int sum=userService.crrncySumAjax(memberVO);
    	return sum;
    }
    //비밀번호 체크
    @ResponseBody
	@PostMapping("/api/memPwChk")
	public boolean memPwChk(@RequestBody Map<String, Object> map) {
    	log.info("memPwChk->memberVO(전) : " + map);
    	Object memIdObj =  map.get("memId");
    	String memId = memIdObj.toString();
    	String memPw = (String) map.get("memPw");
    	log.info("memPwChk->memIdObj : " +memIdObj);
    	log.info("memPwChk->memId : " +memId);
    	log.info("memPwChk->memPw : " +memPw);

		MemberVO memberVOChk=userService.getMember(map);
		log.info("memPwChk->memberVOChk : "+ memberVOChk);
		String memPwChk = memberVOChk.getMemPw();

		//비밀번호 비교
        boolean isPasswordValid = userService.checkPassword(memPw, memPwChk);
		return isPasswordValid;//0또는 1
	}
}







