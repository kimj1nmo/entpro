package kr.or.ddit.page.companypage.stockmanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.page.companypage.manageartist.ManageArtistServiceImpl;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.OrderInfoVO;
import kr.or.ddit.vo.WrhousngVO;
import kr.or.ddit.vo.orderChartVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StockManageServiceImpl implements StockManageService{


	@Autowired
	StockManageMapper managerGroupMapper;


	// UploadController DI/IoC
	@Autowired
	UploadController uploadController;

	//그룹 전체 가져오기
	@Override
	public int getTotal(Map<String, Object> map) {
		return managerGroupMapper.getTotal(map);
	}

	@Override
	public List<WrhousngVO> stockListSort(Map<String, Object> map) {
		return managerGroupMapper.stockListSort(map);

	}
	//재고 리스트 가져오기


	@Override
	public int getJaegoTotal(Map<String, Object> map) {
		return managerGroupMapper.getJaegoTotal(map);

	}
	//한페이지당 재고 리스트 가져오기

	@Override
	public List<GoodsVO> jaegoListSort(Map<String, Object> map) {
		return managerGroupMapper.jaegoListSort(map);

	}
	// 총갯수 가져오기
	@Override
	public int getProductTotal() {
		return managerGroupMapper.getProductTotal();
	}

	//재고 10개 이하 상품 총 갯수가져오기
	@Override
	public int getUnderTen() {
		return managerGroupMapper.getUnderTen();
	}
	//품절 상품 총 갯수 가져오기
	@Override
	public int getSoldOut() {
		return managerGroupMapper.getSoldOut();
	}

	//조건에 맞는 상품 총 갯수
	@Override
	public int getGoodsTotal(Map<String, Object> map) {
		return managerGroupMapper.getGoodsTotal(map);

	}


	//조건에 맞는 상품 총 리스트

	@Override
	public List<GoodsVO> goodsListSortAjax(Map<String, Object> map) {
		return managerGroupMapper.goodsListSortAjax(map);

	}

	@Override
	public int wrhousngInsert(WrhousngVO wrhousngVO) {
		return managerGroupMapper.wrhousngInsert(wrhousngVO);

	}

	@Override
	public int wrhousngDelete(Map<String, Object> map) {
		return managerGroupMapper.wrhousngDelete(map);
	}


	//차트 년/월로 가장 많이 팔린 목록 가져오기
	public List<orderChartVO> topProductsAjax(String year, String month){
		HashMap<String, Object> map=new HashMap<>();
		map.put("year", year);
		map.put("month", month);
		return managerGroupMapper.topProductsAjax(map);

	}

	@Override
	public List<HashMap<String, Object>> getYearsAjax() {
		return managerGroupMapper.getYearsAjax();

	}

	@Override
	public List<GoodsVO> safetyStockAjax() {
		return managerGroupMapper.safetyStockAjax();

	}

	public List<orderChartVO> lastMonthProductsAjax(String year, String month){
		HashMap<String, Object> map=new HashMap<>();
		map.put("year", year);
		map.put("month", month);
		return managerGroupMapper.lastMonthProductsAjax(map);

	}

	//해당하는 이름 가져오기
	@Override
	public GoodsVO getGdsName(Map<String, Object> map) {
		return managerGroupMapper.getGdsName(map);
	}


}
