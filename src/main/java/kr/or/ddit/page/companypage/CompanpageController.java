package kr.or.ddit.page.companypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.page.companypage.empmanage.EmpManageService;
import kr.or.ddit.page.companypage.manageartist.ManageArtistController;
import kr.or.ddit.page.notice.service.QuestionService;
import kr.or.ddit.vo.QuestionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/companypage")
public class CompanpageController {


	@Autowired
	QuestionService questionService;

	@GetMapping("/main")
	public String main() {
		log.info("main 메인페이지");

		return "companypage/main";
	}
	@GetMapping("/sampleStatistics")
	public String sampleStatistics() {
		log.info("sampleStatistics 메인페이지");

		return "companypage/sampleStatistics";
	}


	@GetMapping("/auditionList")
	public String auditionList() {
		log.info("auditionList 메인페이지");

		return "companypage/auditionList";
	}


	@GetMapping("/companyArchives")
	public String companyArchives() {
		log.info("companyArchives 메인페이지");

		return "companypage/companyArchives";
	}

	@GetMapping("/createAudition")
	public String createAudition() {
		log.info("createAudition 메인페이지");

		return "companypage/createAudition";
	}
	@GetMapping("/FAQ")
	public String FAQ(Model model) {
		// 모델 주입
		List<QuestionVO> questionVOList = this.questionService.questionAllList();
		log.info("고객센터 리스트 가져오기(questionVOList) : " + questionVOList);

		model.addAttribute("questionVOList", questionVOList);

		return "companypage/FAQ";
	}


	@GetMapping("/goodsManagePage") // 페이지 전환만 처리
    public String goodsManagePage() {
        log.info("goodsManagePage 메인페이지");
        return "companypage/goodsManage";
    }
	@GetMapping("/manageAlbum")
	public String manageAlbum() {
		log.info("manageAlbum 메인페이지");

		return "companypage/manageAlbum";
	}

	@GetMapping("/manageArtist")
	public String manageArtist() {
		log.info("manageArtist 메인페이지");

		return "companypage/manageArtist";
	}


	@GetMapping("/manageGroup")
	public String manageGroup() {
		log.info("manageGroup 메인페이지");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // Authentication 객체에서 사용자 이름 가져오기
        String username = authentication.getName();

		log.info("현재 로그인한 사용자: " + username);
		return "companypage/manageGroup";
	}


//	@GetMapping("/manageMember")
//	public String manageMember() {
//		log.info("manageMember 메인페이지");
//
//		return "companypage/manageMember";
//	}
//	@GetMapping("/orderManage")
//	public String orderManage() {
//	    log.info("[주문 관리] orderManage 페이지 요청");
//	    return "companypage/orderManage"; // ✅ 올바른 경로
//	}




//	@GetMapping("/reportReply")
//	public String reportReply() {
//		log.info("reportReply 메인페이지");
////
//		return "companypage/reportReply";
//	}

	@GetMapping("/stockManage")
	public String stockManage() {
		log.info("stockManage 메인페이지");

		return "companypage/stockManage";
	}


//	@GetMapping("/SurveyCreate")
//	public String SurveyCreate() {
//		log.info("SurveyCreate 메인페이지");
//
//		return "companypage/SurveyCreate";
//	}
//
//		@GetMapping("/SurveyList")
//		public String SurveyList() {
//			log.info("SurveyList 메인페이지");
//
//			return "companypage/SurveyList";
//	}

		@GetMapping("/manageVod")
		public String manageVod() {
			log.info("manageVod 메인페이지");

			return "companypage/manageVod";
		}

		/*
		@GetMapping("/manageComm")
		public String manageComm() {
			log.info("manageComm 메인페이지");

			return "companypage/manageComm";
		}
		*/
		@GetMapping("/goodsData")
		public String goodsData() {
			log.info("goodsData 메인페이지");

			return "companypage/data/goodsData";
		}
		@GetMapping("/artistData")
		public String artistData() {
			log.info("artistData 메인페이지");

			return "companypage/data/artistData";
		}
		@GetMapping("/siteData")
		public String siteData() {
			log.info("siteData 메인페이지");

			return "companypage/data/siteData";
		}
		@GetMapping("/goodsInput")
		public String goodsInput() {
			log.info("goodsInput 메인페이지");

			return "companypage/goodsInput";
		}
}
