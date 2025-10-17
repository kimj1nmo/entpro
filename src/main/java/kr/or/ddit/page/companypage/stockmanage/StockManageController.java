package kr.or.ddit.page.companypage.stockmanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.companypage.manageartist.ManageArtistController;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.OrderInfoVO;
import kr.or.ddit.vo.WrhousngVO;
import kr.or.ddit.vo.orderChartVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stockManageAjax")
public class StockManageController {

	@Autowired
	StockManageService stockManageService;


	//판매 기록이 존재한 년도 체크 하기
	@ResponseBody
	@RequestMapping(value = "/getYearsAjax", method = RequestMethod.GET)
	public List<HashMap<String, Object>> getYearsAjax() {
		List<HashMap<String, Object>>list  =stockManageService.getYearsAjax();
		return list;

	}


	// 입고 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "/stockListSortAjax", method = RequestMethod.POST)
	public ArticlePage<WrhousngVO> stockListSortAjax(@RequestBody Map<String, Object> map) {
		//map{"currentPage":"1","keyword"="도서"}
				log.info("groupListSortAjax->map : " + map);

				//전체 행의 수 *******
				int total = stockManageService.getTotal(map);
				//StockManageController->groupListSortAjax->total : 8
				log.info("StockManageController->groupListSortAjax->total : " + total);

				//map{currentPage=1,keyword=}
				List<WrhousngVO> wrhousngVOList = stockManageService.stockListSort(map);
				log.info("StockManageController->groupListSortAjax->artistVOList : " + wrhousngVOList);

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
				ArticlePage<WrhousngVO> articlePage
					= new ArticlePage<WrhousngVO>(total, currentPage,
							10	, wrhousngVOList, keyword, mode,sortName);

				return articlePage;
	}

	//재고 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "/jaegoListSortAjax", method = RequestMethod.POST)
	public ArticlePage<GoodsVO> jaegoListSortAjax(@RequestBody Map<String, Object> map) {
		//map{"currentPage":"1","keyword"="도서"}
				log.info("jaegoListSortAjax->groupListSortAjax->map : " + map);

				//전체 행의 수 *******
				int total = stockManageService.getJaegoTotal(map);
				log.info("jaegoListSortAjax->groupListSortAjax->getJaegoTotal : " + total);

				//map{currentPage=1,keyword=}
				List<GoodsVO> goodsVOList = stockManageService.jaegoListSort(map);
				log.info("jaegoListSortAjax->groupListSortAjax->artistVOList : " + goodsVOList);

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
				ArticlePage<GoodsVO> articlePage
					= new ArticlePage<GoodsVO>(total, currentPage,
							10	, goodsVOList, keyword, "", 1);
				log.info("groupListSortAjax->articlePage : " + articlePage);

				return articlePage;
	}

	// 전체, 10개이하, 품절 갯수 파악
	@ResponseBody
	@RequestMapping(value = "/getJaegoDbAjax", method = RequestMethod.GET)
	public HashMap<String, Object> getJaegoDbAjax() {
		HashMap<String, Object> map= new HashMap<>();
		int total=stockManageService.getProductTotal();
		int underTen=stockManageService.getUnderTen();
		int soldOut=stockManageService.getSoldOut();
		map.put("total", total);
		map.put("underTen", underTen);
		map.put("soldOut", soldOut);
		return map;

	}


	//물건 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "/goodsListSortAjax", method = RequestMethod.POST)
	public ArticlePage<GoodsVO> goodsListSortAjax(@RequestBody Map<String, Object> map) {
		//map{"currentPage":"1","keyword"="도서"}
				log.info("groupListSortAjax->map : " + map);

				//전체 행의 수 *******
				int total = stockManageService.getGoodsTotal(map);
				log.info("groupListSortAjax->getJaegoTotal : " + total);

				//map{currentPage=1,keyword=}
				List<GoodsVO> goodsVOList = stockManageService.goodsListSortAjax(map);
				log.info("groupListSortAjax->goodsVOList : " + goodsVOList);

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
				ArticlePage<GoodsVO> articlePage
					= new ArticlePage<GoodsVO>(total, currentPage,
							10	, goodsVOList, keyword, mode,sortName);
				log.info("groupListSortAjax->articlePage : " + articlePage);

				return articlePage;
	}


	//새로운 입고 넣기
	@ResponseBody
	@PostMapping("/wrhousngInsertAjax")
	public int wrhousngInsertAjax( WrhousngVO wrhousngVO ) {
	    log.info("wrhousngInsertAjax->wrhousngVO : " + wrhousngVO);
	    int result=stockManageService.wrhousngInsert(wrhousngVO);

	    return result; // 실제 데이터 반환
	}


	//입고 기록 지우기
	@ResponseBody
	@RequestMapping(value = "/wrhousngDelete", method = RequestMethod.POST)
	public int wrhousngDelete(@RequestBody Map<String, Object> map) {
		int result=stockManageService.wrhousngDelete(map);
		return result;
	}

	//차트용 가장 많이 팔린 거 가져오기
	@ResponseBody
	   @RequestMapping(value = "/topProductsAjax", method = RequestMethod.GET)
	    public List<orderChartVO> topProductsAjax(@RequestParam String year, @RequestParam String month) {
		    log.info("작동중->wrhousngVO : "+ year+month);


		    List<orderChartVO> topProducts = stockManageService.topProductsAjax(year, month);

		    log.info("작동중->topProducts : "+ topProducts);

//	        List<orderChartVO> topProducts = fetchTopProductsFromDB(year, month);
	        return topProducts;
	    }

	    //10개ㅣ 이하의 안전재고 체크하기
		@ResponseBody
	    @RequestMapping(value = "/safetyStockAjax", method = RequestMethod.GET)
	    public List<GoodsVO> safetyStockAjax() {
		    log.info("작동중->safetyStockAjax : ");


		    List<GoodsVO> topProducts = stockManageService.safetyStockAjax();
	        return topProducts;
	    }

		//전달 기준 판매량 보기
		@ResponseBody
	    @RequestMapping(value = "/lastMonthProductsAjax", method = RequestMethod.GET)
	    public List<orderChartVO> lastMonthProductsAjax(@RequestParam String year, @RequestParam String month) {
		    log.info("작동중->wrhousngVO : "+ year+month);


		    List<orderChartVO> topProducts = stockManageService.lastMonthProductsAjax(year, month);
	        return topProducts;
	    }

	    //상품번호로 이름 가져오기
		@ResponseBody
		@RequestMapping(value = "/getGdsNameAjax", method = RequestMethod.POST)
		public GoodsVO getGdsNameAjax(@RequestBody Map<String, Object> map) {
			GoodsVO result=stockManageService.getGdsName(map);
		    log.info("result :{} ",result);

			return result;
		}
}
