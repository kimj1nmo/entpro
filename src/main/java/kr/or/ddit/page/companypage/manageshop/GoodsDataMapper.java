package kr.or.ddit.page.companypage.manageshop;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import kr.or.ddit.vo.GoodsVO;

@Mapper
public interface GoodsDataMapper {
    
    /** ✅ 1. 전체 매출 (월별) */
    List<GoodsVO> getTotalSalesByMonth();

    /** ✅ 2. 카테고리별 매출 */
    List<GoodsVO> getSalesByCategory();

    /** ✅ 3. 그룹별 매출 */
    List<GoodsVO> getSalesByGroup();

    /** ✅ 4. 특정 그룹 클릭 → 월별 매출 */
    List<GoodsVO> getGroupSalesByMonth(@Param("groupNo") int groupNo);

    /** ✅ 5. 특정 카테고리 클릭 → 월별 매출 */
    List<GoodsVO> getCategorySalesByMonth(@Param("categoryNo") int categoryNo);

    /** ✅ 6. 특정 굿즈 클릭 → 월별 매출 */
    List<GoodsVO> getGoodsSalesByMonth(@Param("gdsNo") int gdsNo);

    /** ✅ 7. 전체 카테고리 목록 */
    List<GoodsVO> getAllCategories();

    /** ✅ 8. 전체 그룹 목록 */
    List<GoodsVO> getAllGroups();

    /** ✅ 9. 가장 많이 팔린 상품 TOP 10 */
    List<GoodsVO> getTopSellingGoods();

    /** ✅ 10. 특정 기간 내 가장 많이 팔린 상품 TOP 10 */
    List<GoodsVO> getTopSellingGoodsByDate(@Param("startDate") String startDate, @Param("endDate") String endDate);

    /** ✅ 11. 특정 카테고리 내 판매율 높은 상위 5개 상품 조회 */
    List<GoodsVO> getTop5SellingGoodsInCategory(@Param("categoryNo") int categoryNo);

    /** ✅ 12. 특정 그룹 내 판매율 높은 상위 5개 상품 조회 */
    List<GoodsVO> getTop5SellingGoodsInGroup(@Param("groupNo") int groupNo);
    

  
}
