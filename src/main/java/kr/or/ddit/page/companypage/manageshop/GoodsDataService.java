package kr.or.ddit.page.companypage.manageshop;

import java.util.List;
import kr.or.ddit.vo.GoodsVO;

public interface GoodsDataService {

    /** ✅ 1. 전체 매출 (월별) */
    List<GoodsVO> getTotalSalesByMonth();

    /** ✅ 2. 카테고리별 매출 */
    List<GoodsVO> getSalesByCategory();

    /** ✅ 3. 그룹별 매출 */
    List<GoodsVO> getSalesByGroup();

    /** ✅ 4. 특정 그룹 클릭 → 월별 매출 */
    List<GoodsVO> getGroupSalesByMonth(int groupNo);

    /** ✅ 5. 특정 카테고리 클릭 → 월별 매출 */
    List<GoodsVO> getCategorySalesByMonth(int categoryNo);

    /** ✅ 6. 특정 굿즈 클릭 → 월별 매출 */
    List<GoodsVO> getGoodsSalesByMonth(int gdsNo);

    /** ✅ 7. 전체 카테고리 목록 조회 */
    List<GoodsVO> getAllCategories();

    /** ✅ 8. 전체 그룹 목록 조회 */
    List<GoodsVO> getAllGroups();

    /** ✅ 9. 가장 많이 팔린 상품 TOP 10 조회 */
    List<GoodsVO> getTopSellingGoods();

    /** ✅ 10. 특정 기간 내 가장 많이 팔린 상품 TOP 10 조회 */
    List<GoodsVO> getTopSellingGoodsByDate(String startDate, String endDate);

    /** ✅ 11. 특정 카테고리 내 판매율 높은 상위 5개 상품 조회 */
    List<GoodsVO> getTop5SellingGoodsInCategory(int categoryNo);

    /** ✅ 12. 특정 그룹 내 판매율 높은 상위 5개 상품 조회 */
    List<GoodsVO> getTop5SellingGoodsInGroup(int groupNo);
}
