package kr.or.ddit.page.appr;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication; // Spring Security Authentication import
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.security.CustomUser;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.ApprDocVO;
import kr.or.ddit.vo.ApprLineVO;
import kr.or.ddit.vo.ApprManVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/managepage")
public class ApprController {


	@Autowired
	ApprService apprService;

	@GetMapping("/pbox/write")
	public String apprwrite( Model model) {

		  // SecurityContextHolder에서 현재 인증된 사용자 정보 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // 인증된 사용자가 CustomUser 객체라면
        if (authentication.getPrincipal() instanceof CustomUser) {
            CustomUser customUser = (CustomUser) authentication.getPrincipal();  // CustomUser로 캐스팅
            MemberVO memberVO = customUser.getMember();  // CustomUser에서 MemberVO 객체 가져오기

            // memberVO 활용하기
            System.out.println("Logged in User ID: " + memberVO.getMemId());
            System.out.println("Logged in User Name: " + memberVO.getMemName());
            String memId = memberVO.getMemId();
            ApprManVO memberDetail = apprService.getUserInfo(memId);
            model.addAttribute("memberDetail", memberDetail);
        }


		return "managepage/pbox/write";
	}


	@ResponseBody
	@PostMapping("/pbox/write/savedoc")
	public int saveApprDocumnet(@RequestBody ApprDocVO apprDocVO) {
	    log.debug("문서 정보: {}", apprDocVO);
	    log.debug("결재선 정보: {}", apprDocVO.getApprLineVO());

	    // 문서 저장 및 atrzDocNo 반환
	    int atrzDocNo = apprService.saveAll(apprDocVO);

	    log.debug("결재자 리스트: {}", apprDocVO.getApprManList());
		return atrzDocNo;
	}


    @GetMapping("/getTreeData")
    @ResponseBody
    public List<Map<String, Object>> getTreeData() {
        return apprService.getTreeData();
    }



	@GetMapping("/appr/all")
	public String apprall(@RequestParam(value="keyword",required=false,defaultValue="") String keyword,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
			Model model) {

			log.info("list->keyword : " + keyword);
			log.info("list->currentPage : " + currentPage);
			//하.하.쏘맵
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("keyword",keyword);
			map.put("currentPage",currentPage);
			//map{keyword="",currentPage="4"}
			log.info("list->map : " + map);

			//전체 행의 수
			int total = this.apprService.getTotal();
			log.info("list->total : " + total);

			List<ApprDocVO> apprDocVOList = this.apprService.list(map);
			log.info("list->apprVOList : " + apprDocVOList);

			//select 결과 목록을 데이터로 넣어줌. jsp로 리턴될것임
			model.addAttribute("apprDocVOList", apprDocVOList);
			model.addAttribute("articlePage",
					new ArticlePage<ApprDocVO>(total, currentPage, 10, apprDocVOList, keyword));
			//forwarding : jsp
		return "managepage/appr/all";
	}

	@GetMapping("/appr/cert_detail")
	public String apprcert(@RequestParam int atrzDocNo,
			Model model) {

		//1. boNo 매개변수의 값을 확인
		log.info("detail->boNo : " + atrzDocNo);

		ApprDocVO apprDocVO = this.apprService.detail(atrzDocNo);
		log.info("detail->boardVO : " + apprDocVO);

		//2.model의 속성명은 boardVO, 값은 boardVO
		model.addAttribute("apprDocVO", apprDocVO);

		//3. forwarding : jsp 리턴

		return "managepage/appr/cert_detail?atrzDocNo" + atrzDocNo;

	}

	@GetMapping("/appr/cert_detail/{atrzDocNo}")
	public String apprcertPath( @PathVariable(value="atrzDocNo") int atrzDocNo,
			Model model) {

			//1. boNo 매개변수의 값을 확인
			log.info("detail->boNo : " + atrzDocNo);

			ApprDocVO apprDocVO = this.apprService.detail(atrzDocNo);
			log.info("detail->boardVO : " + apprDocVO);

			//2.model의 속성명은 boardVO, 값은 boardVO
			model.addAttribute("apprDocVO", apprDocVO);

			//3. forwarding : jsp 리턴

		return "managepage/appr/cert_detail";
	}



	@GetMapping("/appr/con_detail")
	public String apprcon(@RequestParam int atrzDocNo,
			Model model) {

		//1. boNo 매개변수의 값을 확인
		log.info("detail->boNo : " + atrzDocNo);

		ApprDocVO apprDocVO = this.apprService.detail(atrzDocNo);
		log.info("detail->boardVO : " + apprDocVO);

		//2.model의 속성명은 boardVO, 값은 boardVO
		model.addAttribute("apprDocVO", apprDocVO);

		//3. forwarding : jsp 리턴

		return "managepage/appr/con_detail?atrzDocNo" + atrzDocNo;

	}


	@GetMapping("/appr/con_detail/{atrzDocNo}")
	public String apprconPath( @PathVariable(value="atrzDocNo") int atrzDocNo,
			Model model) {

			//1. boNo 매개변수의 값을 확인
			log.info("detail->boNo : " + atrzDocNo);

			ApprDocVO apprDocVO = this.apprService.detail(atrzDocNo);
			log.info("detail->boardVO : " + apprDocVO);

			//2.model의 속성명은 boardVO, 값은 boardVO
			model.addAttribute("apprDocVO", apprDocVO);

			//3. forwarding : jsp 리턴

		return "managepage/appr/con_detail";
	}



	@GetMapping("/appr/addr_detail")
	public String appraddr(@RequestParam int atrzDocNo,
			Model model) {

		//1. boNo 매개변수의 값을 확인
		log.info("detail->boNo : " + atrzDocNo);

		ApprDocVO apprDocVO = this.apprService.detail(atrzDocNo);
		log.info("detail->boardVO : " + apprDocVO);

		//2.model의 속성명은 boardVO, 값은 boardVO
		model.addAttribute("apprDocVO", apprDocVO);

		//3. forwarding : jsp 리턴

		return "managepage/appr/addr_detail?atrzDocNo" + atrzDocNo;
	}
	@GetMapping("/appr/addr_detail/{atrzDocNo}")
	public String appraddrPath( @PathVariable(value="atrzDocNo") int atrzDocNo,
			Model model) {

			//1. boNo 매개변수의 값을 확인
			log.info("detail->boNo : " + atrzDocNo);

			ApprDocVO apprDocVO = this.apprService.detail(atrzDocNo);
			log.info("detail->boardVO : " + apprDocVO);

			//2.model의 속성명은 boardVO, 값은 boardVO
			model.addAttribute("apprDocVO", apprDocVO);

			//3. forwarding : jsp 리턴

		return "managepage/appr/addr_detail";
	}



	@GetMapping("/appr/pt_addr_detail")
	public String addrDetail() {
		return "managepage/appr/pt_addr_detail";
	}
	@GetMapping("/appr/wait")
	public String apprwait() {
		return "managepage/appr/wait";
	}

	@GetMapping("/appr/check")
	public String apprcheck() {
		return "managepage/appr/check";
	}

	@GetMapping("/appr/will")
	public String apprwill() {
		return "managepage/appr/will";
	}

	@GetMapping("/appr/process")
	public String apprprocess() {
		return "managepage/appr/process";
	}

	@GetMapping("/pbox/all")
	public String pboxall() {



		return "managepage/pbox/all";
	}

	@GetMapping("/pbox/draft")
	public String pboxdraft() {
		return "managepage/pbox/draft";
	}

	@GetMapping("/pbox/approve")
	public String pboxapprove() {
		return "managepage/pbox/approve";
	}

	@GetMapping("/pbox/receive")
	public String pboxreceive() {
		return "managepage/pbox/receive";
	}

	@GetMapping("/pbox/viewer")
	public String pboxviewer() {
		return "managepage/pbox/viewer";
	}

	@GetMapping("/pbox/stop")
	public String pboxstop() {
		return "managepage/pbox/stop";
	}
	@GetMapping("/pbox/stampset")
	public String stampset() {
		return "managepage/pbox/stampset";
	}

}
