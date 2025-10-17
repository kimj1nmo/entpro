package kr.or.ddit.page.companypage.empmanage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PositionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/companypage")
public class EmpManageController {

	@Autowired
	EmpManageService empManageService;


	@GetMapping("/companyEmpManage")
	public String companyEmpManage(Model model) {

		// 부서 리스트
		List<DepartmentVO> departmentVOList = this.empManageService.departmentList();

		// 직책 리스트
		List<PositionVO> positionVOList = this.empManageService.positionList();

		model.addAttribute("departmentVOList", departmentVOList);
		model.addAttribute("positionVOList", positionVOList);

		return "companypage/companyEmpManage";
	}

	/**
	 * 직원 리스트
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/empList")
	public ArticlePage<MemberVO> companyEmpManage(@RequestBody Map<String, Object> map) {

		log.info("empListAxios -> map : " + map);

		// 총 직원 수
		List<MemberVO> memberVOList = this.empManageService.list(map);
		log.info("list -> memberVOList :" + memberVOList);

		// 직원 리스트
		int total = this.empManageService.getTotal(map);
		log.info("list -> total : " + total);


		int currentPage = 1; // 1페이지

		if(map.get("currentPage") != null) {
	 	   // map.get("currentPage") -> null
	 	   //							null.toString() -> 오류 발생
	 	   currentPage = Integer.parseInt(map.get("currentPage").toString());
	    }

		String keyword = "";

		if(map.get("keyword")!= null) {
			keyword = map.get("keyword").toString();
		}

		ArticlePage<MemberVO> articlePage =
				new ArticlePage<MemberVO>(total, currentPage, 10, memberVOList, keyword, "ajax");

		return articlePage;
	}

	/**
	 * 직원 등록
	 * @param memberVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/signInEmp")
	public int signInEmp(@RequestBody MemberVO memberVO) {

		// 암호화된 비밀번호와 함께 멤버등록
		int result = this.empManageService.changePasswd(memberVO);

		return result;
	}

	/**
	 * 아이디 중복 체크
	 * @param memberVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/idDupChk")
	public int idDupChk(@RequestBody MemberVO memberVO) {

		// 아이디 중복 체크
		int result = this.empManageService.idDupChk(memberVO);

		return result;
	}

	/**
	 * 삭제(비활성화) 처리
	 * @param memberVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteMem")
	public int deleteMem(@RequestBody MemberVO memberVO) {
		return this.empManageService.deleteMem(memberVO);
	}

}


















