package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;
import lombok.Data;

// 1. 주문
@Data
public class OrderInfoVO {

    private int orderNo;
    private Date orderDate;
    private int orderTotalAmount;
    private String postalCode; // 우편번호
    private String orderAddress; // 주소
    private String orderDetailAddress; // 상세 주소
    private String orderAdd;
    private String memId;
    private String orderName;
    private String userPhone;
    private int orderChangeNo;
    private String[] gdsNos;
    private String[] quantities;

    // ✅ 추가된 필드 (쿼리에서 받아오는 데이터와 매칭)
    private String gdsNo;  // 상품 번호
    private int orderListQy; // 주문 수량
    private String gdsName; // ✅ 상품명 추가
    private int gdsPrice;   // ✅ 상품 가격 추가
    private String memTel;     // 회원 전화번호
    private String memName;    // 회원 이름


    // 주문 : 상품 주문 목록 = 1 : N
    private List<OrderListVO> orderListVOList;

    // 주문 : 상품 결제 = 1 : 1
    private GoodsPaymentVO goodsPaymentVO;

}
