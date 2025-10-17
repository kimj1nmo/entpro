package kr.or.ddit.page.shop.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.vo.OrderListVO;


@Mapper
public interface OrderListMapper {

    // 주문 목록 등록
    public int insertOrderList(OrderListVO orderListVO);
//
//    // 특정 주문 번호로 주문 목록 조회
//    public List<OrderListVO> getOrderListByOrderNo(int orderNo);
//
//    // 모든 주문 목록 조회
//    public List<OrderListVO> getAllOrderLists();
//
//    // 주문 삭제
//    public int deleteOrderList(int orderNo);
}
