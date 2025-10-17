package kr.or.ddit.vo;

import lombok.Data;

@Data
public class PaymentCodeVO {
	
    private int paycoNo;    // 결제 수단 번호
    private String paycoNm; // 결제 수단 이름
}