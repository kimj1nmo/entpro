package kr.or.ddit.page.companypage.manageshop;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.util.List;
import kr.or.ddit.vo.GoodsVO;

@Slf4j
@Service
@RequiredArgsConstructor
public class GoodsDataServiceImpl implements GoodsDataService {

    private final GoodsDataMapper goodsDataMapper;

    /** ✅ 1. 전체 매출 (월별) */
    @Override
    public List<GoodsVO> getTotalSalesByMonth() {
        log.info("📊 전체 매출 (월별) 조회 요청");
        return goodsDataMapper.getTotalSalesByMonth();
    }

    /** ✅ 2. 카테고리별 매출 */
    @Override
    public List<GoodsVO> getSalesByCategory() {
        log.info("📊 카테고리별 매출 조회 요청");
        return goodsDataMapper.getSalesByCategory();
    }

    /** ✅ 3. 그룹별 매출 */
    @Override
    public List<GoodsVO> getSalesByGroup() {
        log.info("📊 그룹별 매출 조회 요청");
        return goodsDataMapper.getSalesByGroup();
    }

    /** ✅ 4. 특정 그룹 클릭 → 월별 매출 */
    @Override
    public List<GoodsVO> getGroupSalesByMonth(int groupNo) {
        log.info("📊 그룹별 매출 조회 요청 - 그룹번호: {}", groupNo);
        return goodsDataMapper.getGroupSalesByMonth(groupNo);
    }

    /** ✅ 5. 특정 카테고리 클릭 → 월별 매출 */
    @Override
    public List<GoodsVO> getCategorySalesByMonth(int categoryNo) {
        log.info("📊 카테고리별 매출 조회 요청 - 카테고리번호: {}", categoryNo);
        return goodsDataMapper.getCategorySalesByMonth(categoryNo);
    }

    /** ✅ 6. 특정 굿즈 클릭 → 월별 매출 */
    @Override
    public List<GoodsVO> getGoodsSalesByMonth(int gdsNo) {
        log.info("📊 굿즈별 매출 조회 요청 - 상품번호: {}", gdsNo);
        return goodsDataMapper.getGoodsSalesByMonth(gdsNo);
    }

    /** ✅ 7. 전체 카테고리 목록 조회 */
    @Override
    public List<GoodsVO> getAllCategories() {
        log.info("📊 전체 카테고리 목록 조회 요청");
        return goodsDataMapper.getAllCategories();
    }

    /** ✅ 8. 전체 그룹 목록 조회 */
    @Override
    public List<GoodsVO> getAllGroups() {
        log.info("📊 전체 그룹 목록 조회 요청");
        return goodsDataMapper.getAllGroups();
    }

    /** ✅ 9. 가장 많이 팔린 상품 TOP 10 조회 */
    @Override
    public List<GoodsVO> getTopSellingGoods() {
        log.info("🔥 제일 많이 팔린 상품 조회 요청");
        return goodsDataMapper.getTopSellingGoods();
    }

    /** ✅ 10. 특정 기간 내 가장 많이 팔린 상품 조회 */
    @Override
    public List<GoodsVO> getTopSellingGoodsByDate(String startDate, String endDate) {
        log.info("🔥 특정 기간 ({}) ~ ({}) 내 제일 많이 팔린 상품 조회 요청", startDate, endDate);
        return goodsDataMapper.getTopSellingGoodsByDate(startDate, endDate);
    }

    /** ✅ 11. 특정 카테고리 내 판매율 높은 상위 5개 상품 조회 */
    @Override
    public List<GoodsVO> getTop5SellingGoodsInCategory(int categoryNo) {
        log.info("🔥 특정 카테고리({}) 내 판매율 높은 5개 상품 조회 요청", categoryNo);
        return goodsDataMapper.getTop5SellingGoodsInCategory(categoryNo);
    }

    /** ✅ 12. 특정 그룹 내 판매율 높은 상위 5개 상품 조회 */
    @Override
    public List<GoodsVO> getTop5SellingGoodsInGroup(int groupNo) {
        log.info("🔥 특정 그룹({}) 내 판매율 높은 5개 상품 조회 요청", groupNo);
        return goodsDataMapper.getTop5SellingGoodsInGroup(groupNo);
    }
}
