package kr.or.ddit.page.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.page.shop.mapper.PaymentCodeMapper;
import kr.or.ddit.page.shop.service.PaymentCodeService;
import kr.or.ddit.vo.PaymentCodeVO;

@Service
public class PaymentCodeServiceImpl implements PaymentCodeService {

    @Autowired
    private PaymentCodeMapper paymentCodeMapper;

    @Override
    public int insertPaymentCode(PaymentCodeVO paymentCodeVO) {
        return paymentCodeMapper.insertPaymentCode(paymentCodeVO);
    }

//    @Override
//    public List<PaymentCodeVO> getPaymentCodeList() {
//        return paymentCodeMapper.getPaymentCodeList();
//    }
//
//    @Override
//    public PaymentCodeVO getPaymentCodeById(int paycoNo) {
//        return paymentCodeMapper.getPaymentCodeById(paycoNo);
//    }
//
//    @Override
//    public int deletePaymentCode(int paycoNo) {
//        return paymentCodeMapper.deletePaymentCode(paycoNo);
//    }
}
