package kr.or.ddit.page.shop.service;

import java.util.List;
import kr.or.ddit.vo.CartDetailVO;

public interface CartDetailService {

    // 장바구니 상세 추가
    int insertCartDetail(CartDetailVO cartDetailVO);

    // 회원 ID로 장바구니 상세 조회
    List<CartDetailVO> selectCartDetailsByMemberId(String memId);

    // 장바구니 번호로 상세 조회
    List<CartDetailVO> getCartDetailByCartNo(int cartNo);

    // 상품 번호로 상세 조회
    List<CartDetailVO> getCartDetailByGdsNo(int gdsNo);

    // 장바구니 번호와 상품 번호로 상세 조회 (중복 확인)
    CartDetailVO selectCartDetailByCartNoAndGdsNo(int cartNo, int gdsNo);

    // 장바구니 상세 수량 업데이트
    int updateCartDetailQy(CartDetailVO cartDetailVO);

    // 장바구니 상세 삭제
    int deleteCartDetail(int cartNo, int gdsNo);
}
