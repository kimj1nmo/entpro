package kr.or.ddit.vo;

import lombok.Data;

@Data
public class OrderListVO {
    private int orderNo;       // 주문 번호
    private int gdsNo;         // 상품 번호
    private int orderListQy;   // 주문 수량
}
