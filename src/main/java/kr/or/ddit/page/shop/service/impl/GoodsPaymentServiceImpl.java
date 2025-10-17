package kr.or.ddit.page.shop.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.page.shop.mapper.GoodsPaymentMapper;
import kr.or.ddit.page.shop.service.GoodsPaymentService;
import kr.or.ddit.vo.GoodsPaymentVO;

@Service
public class GoodsPaymentServiceImpl implements GoodsPaymentService {

    @Autowired
    private GoodsPaymentMapper goodsPaymentMapper;

    @Override
    public int insertGoodsPayment(GoodsPaymentVO goodsPaymentVO) {
        return goodsPaymentMapper.insertGoodsPayment(goodsPaymentVO);
    }

//    @Override
//    public GoodsPaymentVO getGoodsPaymentByOrderNo(int orderNo) {
//        return goodsPaymentMapper.getGoodsPaymentByOrderNo(orderNo);
//    }
//
//    @Override
//    public List<GoodsPaymentVO> getAllGoodsPayments() {
//        return goodsPaymentMapper.getAllGoodsPayments();
//    }
//
//    @Override
//    public int deleteGoodsPayment(int orderNo) {
//        return goodsPaymentMapper.deleteGoodsPayment(orderNo);
//    }
}
