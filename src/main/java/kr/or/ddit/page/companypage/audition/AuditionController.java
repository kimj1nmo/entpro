package kr.or.ddit.page.companypage.audition;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.companypage.managecomm.ManageCommController;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.AlbumVO;
import kr.or.ddit.vo.AuditionReqstVO;
import kr.or.ddit.vo.AuditionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/AuditionAjax")
public class AuditionController {

	@Autowired
	AuditionService auditionService;

	//오디션 리스트 꺼내기
	@ResponseBody
	@RequestMapping(value="/auditonListSortAjax",method=RequestMethod.POST)
	public ArticlePage<AuditionVO> auditonListSortAjax(@RequestBody Map<String,Object> map) {
		//map{"currentPage":"1","keyword"="도서"}
		log.info("auditonListSortAjax->map : " + map);

		//전체 행의 수 *******
		int total = this.auditionService.getTotalAud(map);
		log.info("auditonListSortAjax->total : " + total);

		//map{currentPage=1,keyword=}
		List<AuditionVO> auditionVOList = this.auditionService.listAud(map);
		log.info("auditonListSortAjax->auditionVOList : " + auditionVOList);

		//map.get("currentPage") : Object 타입
		int currentPage = Integer.parseInt(map.get("currentPage").toString());//Object->"1"->1
		String keyword = "";
		//검색어가 없을 수 있으므로 처리
		if(map.get("keyword")!=null) {
			keyword = map.get("keyword").toString();//"도서"
		}
		int num=1;
		//페이지네이션
		ArticlePage<AuditionVO> articlePage
			= new ArticlePage<AuditionVO>(total, currentPage,
					10, auditionVOList, keyword, "ajax");

		return articlePage;
	}

// 끝난 오디션 리스트 가져오기
	@ResponseBody
    @GetMapping("/auditonListFinishAjax")
    public List<AuditionVO> getAuditionListFinish(@RequestParam(name = "type", required = false) String type) {
		log.info("v",type);
	    log.info("type: {}", type);

            // dataType에 따라 오디션 목록을 조회하는 로직을 서비스 클래스에서 처리합니다.
            List<AuditionVO> auditionList = auditionService.getAuditionListFinish(type);

            // 성공적으로 조회된 오디션 목록을 JSON 형태로 반환
            return auditionList;


    }

	//오디션 신청 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/auditonReqListSortAjax",method=RequestMethod.POST)
	public ArticlePage<AuditionReqstVO> auditonReqListSortAjax(@RequestBody Map<String,Object> map) {
		//map{"currentPage":"1","keyword"="도서"}
		log.info("auditonListSortAjax->map : " + map);

		//전체 행의 수 *******
		int total = this.auditionService.getTotal(map);
		log.info("auditonListSortAjax->total : " + total);

		//map{currentPage=1,keyword=}
		List<AuditionReqstVO> artistVOList = this.auditionService.list(map);
		log.info("auditonListSortAjax->artistVOList : " + artistVOList);

		//map.get("currentPage") : Object 타입
		int currentPage = Integer.parseInt(map.get("currentPage").toString());//Object->"1"->1
		String keyword = "";
		//검색어가 없을 수 있으므로 처리
		if(map.get("keyword")!=null) {
			keyword = map.get("keyword").toString();//"도서"
		}

		//페이지네이션
		ArticlePage<AuditionReqstVO> articlePage
			= new ArticlePage<AuditionReqstVO>(total, currentPage,
					10, artistVOList, keyword, "ajax",1);

		return articlePage;
	}

	//오디션 상세 가져오기
	@ResponseBody
	@RequestMapping(value="/audDetailAjax",method=RequestMethod.POST)
	public AuditionVO audDetailAjax(@RequestBody Map<String,Object> map) {
		log.info("audDetailAjax->map : " + map);



		//map{currentPage=1,keyword=}
		AuditionVO auditionVO = this.auditionService.audDetail(map);
		log.info("auditonListSortAjax->auditionVO : " + auditionVO);

		return auditionVO;
	}

	//오디션 생성하기
	@ResponseBody
	@RequestMapping(value="/createAuditionAjax",method=RequestMethod.POST)
	public int createAuditionAjax(AuditionVO auditionVO ) {
		log.info("createAuditionAjax->map : " + auditionVO);



		int result = this.auditionService.createAudition(auditionVO);
		log.info("createAuditionAjax->result : " + result);

		return result;
	}

	//오디션 내용 변경하기
	@ResponseBody
	@RequestMapping(value="/updateAuditionAjax",method=RequestMethod.POST)
	public int updateAuditionAjax(AuditionVO auditionVO ) {
		log.info("updateAuditionAjax->map : " + auditionVO);



		int result = this.auditionService.updateAudition(auditionVO);
		log.info("updateAuditionAjax->result : " + result);

		return result;
	}
	//오디션 종료하기
	@ResponseBody
	@RequestMapping(value="/audEndAjax",method=RequestMethod.POST)
	public int audEndAjax( @RequestBody Map<String,Object> map ) {
		log.info("audEndAjax->map : " + map);



		int result = this.auditionService.endAudition(map);
		log.info("audEndAjax->result : " + result);

		return result;
	}


	//오디션 신청 상세
	@ResponseBody
	@RequestMapping(value="/audReqstDetailAjax",method=RequestMethod.POST)
	public AuditionReqstVO audReqstDetailAjax(@RequestBody Map<String,Object> map) {
		log.info("audReqstDetailAjax->map : " + map);

		//map{currentPage=1,keyword=}
		AuditionReqstVO auditionReqstVO = this.auditionService.audReqstDetail(map);
		log.info("auditonListSortAjax->auditionVO : " + auditionReqstVO);

		return auditionReqstVO;
	}

	//오디션 신청 샅태 변경
	@ResponseBody
	@RequestMapping(value="/audReqstStateUpt",method=RequestMethod.POST)
	public int audReqstStateUpt(@RequestBody Map<String,Object> map) {
		log.info("audReqstDetailAjax->map : " + map);

		//map{currentPage=1,keyword=}
		int result = this.auditionService.audReqstStateUpt(map);
		log.info("auditonListSortAjax->auditionVO : " + result);

		return result;
	}
	@ResponseBody

	//응답 안한 오디션 신청 리스트
	@RequestMapping(value="/checkNoRespTotalAjax",method=RequestMethod.GET)
	public int checkNoRespTotalAjax() {

		//map{currentPage=1,keyword=}
		int result = this.auditionService.checkNoRespTotal();
		log.info("checkNoRespTotalAjax->result : " + result);

		return result;
	}


}
