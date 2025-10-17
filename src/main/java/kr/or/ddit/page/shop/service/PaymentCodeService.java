package kr.or.ddit.page.shop.service;

import java.util.List;
import kr.or.ddit.vo.PaymentCodeVO;

public interface PaymentCodeService {

    // 결제 수단 등록
    public int insertPaymentCode(PaymentCodeVO paymentCodeVO);

//    // 결제 수단 목록 조회
//    public List<PaymentCodeVO> getPaymentCodeList();
//
//    // 특정 결제 수단 조회
//    public PaymentCodeVO getPaymentCodeById(int paycoNo);
//
//    // 결제 수단 삭제
//    public int deletePaymentCode(int paycoNo);
}
