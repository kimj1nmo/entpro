package kr.or.ddit.page.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.page.shop.mapper.OrderInfoMapper;
import kr.or.ddit.page.shop.service.OrderInfoService;
import kr.or.ddit.vo.OrderInfoVO;

@Service
@Transactional
public class OrderInfoServiceImpl implements OrderInfoService {

	@Autowired
    private OrderInfoMapper orderInfomapper;

    @Override
    public int insertOrderInfo(OrderInfoVO orderInfoVO) {
        return orderInfomapper.insertOrderInfo(orderInfoVO);
    }

    @Override
    public int getMaxOrderNoByMember(String memId) {
        return orderInfomapper.getMaxOrderNoByMember(memId);
    }
    @Override
    public List<OrderInfoVO> selectOrdersByMemId(String memId) {
        return orderInfomapper.selectOrdersByMemId(memId); 
    }
   // @Override
   //public List<OrderInfoVO> selectOrdersByMemIdAndStatus(String memId, int orderChangeNo) {
   //     return orderInfomapper.selectOrdersByMemIdAndStatus(memId, orderChangeNo);
   //}
 // ✅ 주문 상태 변경 (ORDER_CHANGE_NO 값을 동적으로 변경 가능)
    @Override
    public int updateOrderChangeStatus(int orderNo, int orderChangeNo) {
        return orderInfomapper.updateOrderChangeStatus(orderNo, orderChangeNo);
    }
}
