package kr.or.ddit.page.companypage.managevod;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.comm.live.LiveService;
import kr.or.ddit.page.companypage.manageartist.ManageArtistController;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.LiveVO;
import kr.or.ddit.vo.VodVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manageVodAjax")
public class ManageVodController {

	@Autowired
	ManageVodService manageVodService;
	@Autowired
	LiveService liveService;

	@ResponseBody
	@RequestMapping(value = "/liveListAjax", method = RequestMethod.POST)
	public ArticlePage<LiveVO> liveListAjax(@RequestBody Map<String, Object> map) {
		//map{"currentPage":"1","keyword"="도서"}
				log.info("liveListAjax->map : " + map);

				//전체 행의 수 *******
				int total = this.manageVodService.getLiveTotal(map);
				log.info("vodListSortAjax->total : " + total);

				//map{currentPage=1,keyword=}
				List<LiveVO> liveVOList = manageVodService.liveList(map) ;
				log.info("vodListSortAjax->vodVOList : " + liveVOList);

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
				ArticlePage<LiveVO> articlePage
					= new ArticlePage<LiveVO>(total, currentPage,
							10	, liveVOList, keyword, mode,sortName);

				return articlePage;
	}
	@ResponseBody
	@RequestMapping(value = "/vodListSortAjax", method = RequestMethod.POST)
	public ArticlePage<VodVO> groupListSortAjax(@RequestBody Map<String, Object> map) {
		//map{"currentPage":"1","keyword"="도서"}
		log.info("vodListSortAjax->map : " + map);

		//전체 행의 수 *******
		int total = this.manageVodService.getTotal(map);
		log.info("vodListSortAjax->total : " + total);

		//map{currentPage=1,keyword=}
		List<VodVO> vodVOList = manageVodService.listSort(map) ;
		log.info("vodListSortAjax->vodVOList : " + vodVOList);

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
		ArticlePage<VodVO> articlePage
		= new ArticlePage<VodVO>(total, currentPage,
				10	, vodVOList, keyword, mode,sortName);

		return articlePage;
	}
	@ResponseBody
	@RequestMapping(value = "/updataStatusAjax", method = RequestMethod.POST)
	public int updataStatusAjax(@RequestBody Map<String, Object> map) {
		log.info("updataStatusAjax->map : " + map);

		int result = this.manageVodService.updataStatus(map);
		log.info("updataStatusAjax->total : " + result);

		return result;

	}
	@ResponseBody
	@RequestMapping(value = "/endLive", method = RequestMethod.POST)
	public int endLive(@RequestBody LiveVO liveVO) {
	    log.info("endLiveAjax-> LiveVO={}", liveVO);

	    int result =liveService.endLiveAjax(liveVO);
	    log.info("endLiveAjax-> LiveVO후={}", liveVO);
		return result;

	}

}
