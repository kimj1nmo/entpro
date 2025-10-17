package kr.or.ddit.page.companypage.manageshop;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.OrderInfoVO;

@Mapper
public interface ManageOrderInfoMapper {

    /**
     * 특정 주문 번호에 해당하는 주문 정보와 주문 리스트 조회
     * @param orderNo 조회할 주문 번호
     * @return 주문 정보와 세부 리스트를 포함한 OrderInfoVO 객체
     */
    OrderInfoVO selectOrderWithDetails(int orderNo);

    /**
     * 전체 주문 목록을 조회하는 쿼리
     * @return 모든 주문 정보를 포함한 리스트
     */
    List<OrderInfoVO> selectAllOrders();
    
    /**
     * 주문 상태 변경 (ORDER_CHANGE_NO 값 동적으로 업데이트)
     */
    int updateOrderChangeNo(@Param("orderNo") int orderNo, @Param("orderChangeNo") int orderChangeNo);
}
