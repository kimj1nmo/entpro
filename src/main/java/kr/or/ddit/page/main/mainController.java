package kr.or.ddit.page.main;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.page.shop.service.GoodsService;
import kr.or.ddit.page.survey.SurveyService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.AuditionReqstVO;
import kr.or.ddit.vo.AuditionVO;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.SurveyVO;
import lombok.extern.slf4j.Slf4j;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
@Slf4j
@Controller
public class mainController {

	@Autowired
	MainService mainService;

	@Autowired
	SurveyService surveyService;

	@Autowired
	GoodsService goodsService;

	@GetMapping("/")
	public String main(HttpServletRequest request,Model model) {
		log.info("메인페이지");
//임시로 넘길 그룹 파일 필요
		List<GroupsVO> groupsVOList =mainService.getGroupsAll();
		log.info("groupsVOList="+groupsVOList);


		model.addAttribute("groupsVOList", groupsVOList);
		 // 카테고리 리스트 가져오기
	    List<GoodsVO> categoryList = mainService.getCategoryList();
	    log.info("categoryList=" + categoryList);
	    model.addAttribute("categoryList", categoryList);
		// 최신 굿즈 6개 가져오기
	    List<GoodsVO> goodsList = mainService.getAllGoods();
	    log.info("goodsList=" + goodsList);
	    model.addAttribute("goodsList", goodsList);

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

	        // Authentication 객체에서 사용자 이름 가져오기
	        String username = authentication.getName();

			log.info("현재 로그인한 사용자: " + username);
			List<GroupsVO> groupsCommVOs = mainService.getCommList(username);

			 // 로그인한 사용자인 경우에만 모델에 추가
 		    if (!"anonymousUser".equals(username)) {
 		        log.info("현재 로그인한 사용자: " + username);
 		        model.addAttribute("loginUser", username); // JSP에서 사용할 수 있도록 추가
		        model.addAttribute("groupsCommVOs", groupsCommVOs); // JSP에서 사용할 수 있도록 추가
 		    }
		return "main/main";
	}
	@GetMapping("/goods/detail")
	public String getGoodsDetail(@RequestParam("gdsNo") int gdsNo, Model model) {
		GoodsVO goodsVO = goodsService.getGoodsById(gdsNo);
	    log.info("getGoodsDetail->goodsVO : " + goodsVO);

	    if (goodsVO == null) {
	        return "redirect:/goods/list"; // 해당 굿즈가 없으면 리스트로 리다이렉트
	    }

	    model.addAttribute("goodsVO", goodsVO);
	    return "shop/detail"; // 굿즈 상세 페이지 (goodsDetail.jsp)
	}
	@GetMapping("/main2")

	public String main2() {
		log.info("메인페이지2");

		return "main/main2";
	}

	// 그룹페이지로서 후에 그룹 번호에 따라 페이지 구성 예정
	@GetMapping("/group")

	public String group() {
		log.info("그룹 페이지");

		return "main/group";
	}

	// 그룹페이지로서 후에 그룹 번호에 따라 페이지 구성 예정
	@GetMapping("/auditionList")

	public String auditionList() {
		log.info("오디션 리스트 페이지");

		return "main/auditionList";
	}

	@GetMapping("/auditionCreate")

	public String auditionCreate() {
		log.info("오디션 생성 페이지");

		return "main/auditionCreate";
	}

	// 검색
	@GetMapping("/search")
	public String search(@RequestParam(value = "searchName") String searchName, Model model) {
		log.info("search");

		if (searchName != null && searchName != "") {
			List<ArtistVO> artistVOList = mainService.searchArtist(searchName);
			log.info("artistVOList" + artistVOList);
			model.addAttribute("artistVOList", artistVOList);

			List<GroupsVO> groupsVOList = mainService.searchGroups(searchName);
			log.info("groupsVOList" + groupsVOList);
			model.addAttribute("groupsVOList", groupsVOList);

			List<GoodsVO> goodsVOList = mainService.searchGoods(searchName);
			log.info("goodsVOList" + goodsVOList);
			model.addAttribute("goodsVOList", goodsVOList);
		}
		model.addAttribute("searchName", searchName);

		return "main/search";
	}

	// 회사 자료실
	@GetMapping("/companyArchives")

	public String companyArchives() {
		log.info("companyArchives");

		return "main/companyArchives";
	}

	// 회사 소
	@GetMapping("/companyDetail")

	public String companyDetail() {
		log.info("companyDetail");

		return "main/companyDetail";
	}

	// 공지사항
	@GetMapping("/Announcement")

	public String Announcement() {

		log.info("Announcement");
		return "main/Announcement";
	}
	@GetMapping("/mypage")
	public String myPage(HttpServletRequest request,Model model,            HttpSession session) {
		log.info("mypage");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // Authentication 객체에서 사용자 이름 가져오기
        String memId = authentication.getName();
        session.setAttribute("memId", memId); // 세션에 memId 저장
		log.info("현재 로그인한 사용자: " + memId);

		return "mypage/main";
	}
	@GetMapping("/sample")
	public String sample() {
		log.info("sample");

		return "sample";
	}
	@GetMapping("/SurveyForm")
	public String getSurveyForm(@RequestParam("srvyNo") int srvyNo, Model model) {
		log.info("SurveyForm 페이지");
		log.info("SurveyForm 페이지 - 설문 번호: {}", srvyNo);

		// 서비스 호출
		SurveyVO surveyDetail = surveyService.getSurveyDetail(srvyNo);
		if (surveyDetail == null) {
			log.error("SurveyDetail이 null입니다. srvyNo: {}", srvyNo);
			throw new IllegalArgumentException("유효하지 않은 설문 번호입니다.");
		}

		// 날짜 포맷 변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String srvyBgngData = sdf.format(surveyDetail.getSrvyBgngData());
		String srvyEndDate = sdf.format(surveyDetail.getSrvyEndDate());

		model.addAttribute("surveyDetail", surveyDetail);
		model.addAttribute("srvyBgngData", srvyBgngData);
		model.addAttribute("srvyEndDate", srvyEndDate);
		// 현재 시간 전달
		model.addAttribute("currentDate", new Date().getTime());
		log.info("surveyDetail 데이터: {}", surveyDetail);

		return "companypage/SurveyForm";

	}
	@GetMapping("/example")
	public String example() {
		log.info("example");

		return "example";
	}
 	@GetMapping("/auditionReqstCreate")
 	public String auditionReqstCreate() {
 		log.info("auditionReqstCreate");
 		return "main/auditionReqstCreate";

 	}

	@ResponseBody
 	@RequestMapping(value = "/getReqstListAjax", method = RequestMethod.POST)
 	public ArticlePage<AuditionReqstVO> getReqstListAjax(@RequestBody Map<String, Object> map) {
 		//map{"currentPage":"1","keyword"="도서"}
 				log.info("groupListSortAjax->map : " + map);

 				//전체 행의 수 *******
 				int total = this.mainService.getReqstTotal(map);
 				log.info("groupListSortAjax->total : " + total);

 				//map{currentPage=1,keyword=}
 				List<AuditionReqstVO> auditionReqstVOList = this.mainService.getReqstListAjax(map);
 				log.info("groupListSortAjax->artistVOList : " + auditionReqstVOList);

 				//map.get("currentPage") : Object 타입
 				int currentPage = Integer.parseInt(map.get("currentPage").toString());//Object->"1"->1
 				String keyword = "";
 				int mode= Integer.parseInt(map.get("mode").toString());//Object->"1"->1
 				String sortName="";
 				//검색어가 없을 수 있으므로 처리
 				if(map.get("keyword")!=null) {
 					keyword = map.get("keyword").toString();//"도서"
 				}

 				if(map.get("sortName")!=null) {
 					sortName = map.get("sortName").toString();//"도서"
 				}
 				//페이지네이션
 				ArticlePage<AuditionReqstVO> articlePage
 					= new ArticlePage<AuditionReqstVO>(total, currentPage,
 							10	, auditionReqstVOList, keyword, mode,sortName);

 				return articlePage;
 	}
 	@ResponseBody
 	@RequestMapping(value = "/getAudList", method = RequestMethod.GET)
 	public List<AuditionVO> getAudList() {
 		List<AuditionVO> auditionVOs=mainService.getAudList();
 		return auditionVOs;

 	}

 	@ResponseBody
 	@PostMapping("/audReqstInsert")
 	public int audReqstInsert( AuditionReqstVO auditionReqstVO ) {
 	    log.info("audReqstInsert->auditionReqstVO : " + auditionReqstVO);
 	    int result=mainService.audReqstInsert(auditionReqstVO);

 	    return result; // 실제 데이터 반환
// 	    return 1; // 실제 데이터 반환
 	}
 	@ResponseBody
 	@PostMapping("/getReqstDetailAjax")
 	public AuditionReqstVO getReqstDetailAjax( @RequestBody AuditionReqstVO auditionReqstVO ) {
 		log.info("getReqstDetailAjax->auditionReqstVO : " + auditionReqstVO);
 		AuditionReqstVO reqstVO=mainService.getReqstDetail(auditionReqstVO);
 		log.info("getReqstDetailAjax->reqstVO : " + reqstVO);

 		return reqstVO; // 실제 데이터 반환
// 	    return 1; // 실제 데이터 반환
 	}
 	@ResponseBody
 	@PostMapping("/audReqstDetailDelAjax")
 	public int audReqstDetailDelAjax( @RequestBody AuditionReqstVO auditionReqstVO ) {
 		log.info("audReqstDetailDelAjax->auditionReqstVO : " + auditionReqstVO);
 		int result=mainService.audReqstDetailDel(auditionReqstVO);
 		log.info("audReqstDetailDelAjax->result : " + result);

 		return result; // 실제 데이터 반환
// 	    return 1; // 실제 데이터 반환
 	}
}
