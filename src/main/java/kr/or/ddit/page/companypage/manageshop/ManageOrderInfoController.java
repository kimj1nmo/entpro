package kr.or.ddit.page.companypage.manageshop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.OrderInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/companypage")
public class ManageOrderInfoController {

    @Autowired
    private ManageOrderInfoService manageOrderInfoService;

    /**
     * 주문 목록을 조회하여 JSP에 전달
     */
    @GetMapping("/orderManage")
    public String getOrderList(Model model) {
        log.info("🟢 [주문 관리] getOrderList 실행됨!");

        try {
            List<OrderInfoVO> orderList = manageOrderInfoService.getAllOrders();

            if (orderList == null || orderList.isEmpty()) {
                log.warn("🟠 [주문 관리] 주문 목록이 비어 있음.");
                model.addAttribute("message", "현재 표시할 주문이 없습니다.");
            } else {
                log.info("🟢 [주문 관리] 조회된 주문 수: {}", orderList.size());
                model.addAttribute("orders", orderList);
            }
        } catch (Exception e) {
            log.error("🔴 [주문 관리] 주문 목록 조회 중 오류 발생", e);
            model.addAttribute("message", "데이터를 불러오는 중 오류가 발생했습니다.");
        }

        log.info("🟢 [주문 관리] orderManage.jsp로 이동");
        return "companypage/orderManage";
    }

    /**
     * 주문 상태 변경 (ORDER_CHANGE_NO 업데이트)
     */
    @PostMapping("/updateOrderStatus")
    public ResponseEntity<Map<String, String>> updateOrderStatus(@RequestBody Map<String, Object> payload) {
        try {
            // ✅ JSON에서 값 추출 후 검증
            if (!payload.containsKey("orderNo") || !payload.containsKey("orderChangeNo")) {
                return ResponseEntity.badRequest().body(Map.of("message", "❌ 요청 데이터가 올바르지 않습니다."));
            }

            int orderNo = (Integer) payload.get("orderNo");
            int orderChangeNo = (Integer) payload.get("orderChangeNo");

            if (orderNo <= 0 || orderChangeNo <= 0) {
                return ResponseEntity.badRequest().body(Map.of("message", "❌ 유효하지 않은 주문번호입니다."));
            }

            int updateCount = manageOrderInfoService.updateOrderChangeNo(orderNo, orderChangeNo);
            if (updateCount > 0) {
                return ResponseEntity.ok(Map.of("message", "✅ 주문 상태가 변경되었습니다."));
            } else {
                return ResponseEntity.badRequest().body(Map.of("message", "❌ 주문 상태 변경에 실패했습니다."));
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("message", "❌ 서버 오류 발생: " + e.getMessage()));
        }
    }
}
