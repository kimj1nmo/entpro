package kr.or.ddit.page.shop.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.vo.OrderInfoVO;

@Mapper
public interface OrderInfoMapper {

    // 주문 정보 등록
    public int insertOrderInfo(OrderInfoVO orderInfoVO);
    
    int getMaxOrderNoByMember(String memId);

    List<OrderInfoVO> selectOrdersByMemId(@Param("memId") String memId);
   
    // 특정 회원의 특정 상태 주문 내역 조회
   // List<OrderInfoVO> selectOrdersByMemIdAndStatus(@Param("memId") String memId, @Param("orderChangeNo") int orderChangeNo);
    
    
    // ✅ 주문 상태 변경 (동적으로 ORDER_CHANGE_NO 설정 가능)
    @Update("UPDATE ORDER_INFO SET ORDER_CHANGE_NO = #{orderChangeNo} WHERE ORDER_NO = #{orderNo}")
    int updateOrderChangeStatus(@Param("orderNo") int orderNo, @Param("orderChangeNo") int orderChangeNo);

}
