package kr.or.ddit.page.companypage.stockmanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.OrderInfoVO;
import kr.or.ddit.vo.WrhousngVO;
import kr.or.ddit.vo.orderChartVO;

@Mapper
public interface StockManageMapper {
	//그룹 전체 가져오기
	public int getTotal(Map<String, Object> map);

	//한페이지당 리스트 가져오기
	public List<WrhousngVO> stockListSort(Map<String, Object> map);


	//재고 리스트 가져오기
	public int getJaegoTotal(Map<String, Object> map);

	//한페이지당 재고 리스트 가져오기
	public List<GoodsVO> jaegoListSort(Map<String, Object> map);


	// 총갯수 가져오기
	public int getProductTotal();
	//재고 10개 이하 상품 총 갯수가져오기
	public int getUnderTen();
	//품절 상품 총 갯수 가져오기
	public int getSoldOut();

	//조건에 맞는 상품 총 갯수
	public int getGoodsTotal(Map<String, Object> map);


	//조건에 맞는 상품 총 리승트
	public List<GoodsVO> goodsListSortAjax(Map<String, Object> map);

	//입고 기록 생성
	public int wrhousngInsert(WrhousngVO wrhousngVO);


	//입고 기록 삭제
	public int wrhousngDelete(Map<String, Object> map);



	//차트 년/월로 가장 많이 팔린 목록 가져오기
	public List<orderChartVO> topProductsAjax(HashMap<String, Object> map);


	public List<HashMap<String, Object>> getYearsAjax();

	public List<GoodsVO> safetyStockAjax();

	public List<orderChartVO> lastMonthProductsAjax(HashMap<String, Object> map);


	//해당하는 이름 가져오기
	public GoodsVO getGdsName(Map<String, Object> map);

}
