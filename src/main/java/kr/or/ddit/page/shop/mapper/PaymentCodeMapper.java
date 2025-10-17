package kr.or.ddit.page.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.vo.PaymentCodeVO;

@Mapper
public interface PaymentCodeMapper {

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
