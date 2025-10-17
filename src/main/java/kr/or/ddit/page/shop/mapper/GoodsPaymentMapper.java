package kr.or.ddit.page.shop.mapper;

import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.vo.GoodsPaymentVO;

@Mapper
public interface GoodsPaymentMapper {

    // 결제 정보 등록
    public int insertGoodsPayment(GoodsPaymentVO goodsPaymentVO);


}
