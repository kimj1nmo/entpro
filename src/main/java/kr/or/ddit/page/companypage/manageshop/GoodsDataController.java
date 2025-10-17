package kr.or.ddit.page.companypage.manageshop;

import kr.or.ddit.vo.GoodsVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/goods-data")
@RequiredArgsConstructor
public class GoodsDataController {

    private final GoodsDataService goodsDataService;

    /** ✅ 1. 전체 매출 (월별) */
    @GetMapping("/total-sales")
    public ResponseEntity<List<GoodsVO>> getTotalSalesByMonth() {
        log.info("🔍 전체 매출 (월별) 요청");
        return ResponseEntity.ok(goodsDataService.getTotalSalesByMonth());
    }

    /** ✅ 2. 카테고리별 매출 */
    @GetMapping("/category-sales")
    public ResponseEntity<List<GoodsVO>> getSalesByCategory() {
        log.info("🔍 카테고리별 매출 요청");
        return ResponseEntity.ok(goodsDataService.getSalesByCategory());
    }

    /** ✅ 3. 그룹별 매출 */
    @GetMapping("/group-sales")
    public ResponseEntity<List<GoodsVO>> getSalesByGroup() {
        log.info("🔍 그룹별 매출 요청");
        return ResponseEntity.ok(goodsDataService.getSalesByGroup());
    }

    /** ✅ 4. 특정 그룹 클릭 → 월별 매출 */
    @GetMapping("/group-sales/{groupNo}")
    public ResponseEntity<List<GoodsVO>> getGroupSalesByMonth(@PathVariable int groupNo) {
        log.info("🔍 그룹별 월별 매출 요청 - 그룹번호: {}", groupNo);
        return ResponseEntity.ok(goodsDataService.getGroupSalesByMonth(groupNo));
    }

    /** ✅ 5. 특정 카테고리 클릭 → 월별 매출 */
    @GetMapping("/category-sales/{categoryNo}")
    public ResponseEntity<List<GoodsVO>> getCategorySalesByMonth(@PathVariable int categoryNo) {
        log.info("🔍 카테고리별 월별 매출 요청 - 카테고리번호: {}", categoryNo);
        return ResponseEntity.ok(goodsDataService.getCategorySalesByMonth(categoryNo));
    }

    /** ✅ 6. 특정 굿즈 클릭 → 월별 매출 */
    @GetMapping("/goods-sales/{gdsNo}")
    public ResponseEntity<List<GoodsVO>> getGoodsSalesByMonth(@PathVariable int gdsNo) {
        log.info("🔍 굿즈별 월별 매출 요청 - 상품번호: {}", gdsNo);
        return ResponseEntity.ok(goodsDataService.getGoodsSalesByMonth(gdsNo));
    }

    /** ✅ 7. 전체 카테고리 목록 조회 */
    @GetMapping("/categories")
    public ResponseEntity<List<GoodsVO>> getAllCategories() {
        log.info("🔍 전체 카테고리 목록 요청");
        return ResponseEntity.ok(goodsDataService.getAllCategories());
    }

    /** ✅ 8. 전체 그룹 목록 조회 */
    @GetMapping("/groups")
    public ResponseEntity<List<GoodsVO>> getAllGroups() {
        log.info("🔍 전체 그룹 목록 요청");
        return ResponseEntity.ok(goodsDataService.getAllGroups());
    }

    /** ✅ 9. 제일 많이 팔린 상품 TOP 10 조회 */
    @GetMapping("/top-selling-goods")
    public ResponseEntity<List<GoodsVO>> getTopSellingGoods() {
        log.info("🔥 제일 많이 팔린 상품 조회 요청");
        return ResponseEntity.ok(goodsDataService.getTopSellingGoods());
    }

    /** ✅ 10. 특정 기간 내 제일 많이 팔린 상품 조회 */
    @GetMapping("/top-selling-goods/{startDate}/{endDate}")
    public ResponseEntity<List<GoodsVO>> getTopSellingGoodsByDate(
            @PathVariable String startDate, 
            @PathVariable String endDate) {
        log.info("🔥 특정 기간 ({}) ~ ({}) 내 제일 많이 팔린 상품 조회 요청", startDate, endDate);
        return ResponseEntity.ok(goodsDataService.getTopSellingGoodsByDate(startDate, endDate));
    }

    /** ✅ 11. 특정 카테고리 내 판매율 높은 5개 상품 조회 */
    @GetMapping("/top-5-selling-goods/category/{categoryNo}")
    public ResponseEntity<List<GoodsVO>> getTop5SellingGoodsInCategory(@PathVariable int categoryNo) {
        log.info("🔥 특정 카테고리 ({}) 내 판매율 높은 5개 상품 조회 요청", categoryNo);
        return ResponseEntity.ok(goodsDataService.getTop5SellingGoodsInCategory(categoryNo));
    }

    @GetMapping("/top-5-selling-goods/group/{groupNo}")
    public ResponseEntity<List<GoodsVO>> getTop5SellingGoodsInGroup(@PathVariable int groupNo) {
        log.info("🔥 특정 그룹 ({}) 내 판매율 높은 5개 상품 조회 요청", groupNo);
        return ResponseEntity.ok(goodsDataService.getTop5SellingGoodsInGroup(groupNo));
    }

}
