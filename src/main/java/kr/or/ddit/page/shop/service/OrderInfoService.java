package kr.or.ddit.page.shop.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.OrderInfoVO;

public interface OrderInfoService {

	// 주문 정보 삽입
    public int insertOrderInfo(OrderInfoVO orderInfoVO);
    
    // ✅ 특정 회원(MEM_ID)의 주문 내역 조회
    List<OrderInfoVO> selectOrdersByMemId(@Param("memId") String memId);

    // ✅ 특정 회원(MEM_ID)의 주문 내역 조회 (ORDER_CHANGE_NO 필터 추가)
    //List<OrderInfoVO> selectOrdersByMemIdAndStatus(@Param("memId") String memId, @Param("orderChangeNo") int orderChangeNo);

    // 회원별 가장 높은 ORDER_NO 조회
    public int getMaxOrderNoByMember(String memId);
    
    // ✅ 주문 상태 변경 (ORDER_CHANGE_NO 값 동적으로 설정 가능)
    public int updateOrderChangeStatus(@Param("orderNo") int orderNo, @Param("orderChangeNo") int orderChangeNo);

}
