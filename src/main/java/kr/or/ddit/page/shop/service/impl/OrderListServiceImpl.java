package kr.or.ddit.page.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.page.shop.mapper.OrderListMapper;
import kr.or.ddit.page.shop.service.OrderListService;
import kr.or.ddit.vo.OrderListVO;

@Service
@Transactional
public class OrderListServiceImpl implements OrderListService {

    @Autowired
    private OrderListMapper orderListMapper;

    @Override
    public int insertOrderList(OrderListVO orderListVO) {
        return orderListMapper.insertOrderList(orderListVO);
    }

//    @Override
//    public List<OrderListVO> getOrderListByOrderNo(int orderNo) {
//        return orderListMapper.getOrderListByOrderNo(orderNo);
//    }
//
//    @Override
//    public List<OrderListVO> getAllOrderLists() {
//        return orderListMapper.getAllOrderLists();
//    }
//
//    @Override
//    public int deleteOrderList(int orderNo) {
//        return orderListMapper.deleteOrderList(orderNo);
//    }
}
