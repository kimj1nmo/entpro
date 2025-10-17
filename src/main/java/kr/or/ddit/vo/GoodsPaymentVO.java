package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsPaymentVO {
    private int orderNo;        // 주문 번호
    private int paycoNo;        // 결제 수단 번호
    private int gdsPayAmt;      // 결제 금액
    private int gdsPayState; // 결제 상태
    private Date gdsPayDt;    // 결제 날짜
}
