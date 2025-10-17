package kr.or.ddit.page.shop.service;

import java.util.List;
import kr.or.ddit.vo.GoodsPaymentVO;

public interface GoodsPaymentService {

    // 결제 정보 등록
    public int insertGoodsPayment(GoodsPaymentVO goodsPaymentVO);

//    // 특정 주문 번호로 결제 정보 조회
//    public GoodsPaymentVO getGoodsPaymentByOrderNo(int orderNo);
//
//    // 모든 결제 정보 조회
//    public List<GoodsPaymentVO> getAllGoodsPayments();
//
//    // 결제 정보 삭제
//    public int deleteGoodsPayment(int orderNo);
}
