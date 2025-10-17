package kr.or.ddit.page.shop.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CartVO;

public interface CartService {

    /**
     * 장바구니(CART) 등록
     * @param cartVO 장바구니 정보
     * @return 삽입된 행의 수
     */
    int insertCart(CartVO cartVO);

    /**
     * 특정 회원의 최근 장바구니 조회
     * @param memId 회원 ID
     * @return 최근 장바구니 정보
     */
    CartVO selectRecentCartById(String memId);

    /**
     * 장바구니 상태 업데이트
     * @param params 업데이트 정보 (cartNo, cartState)
     * @return 업데이트된 행의 수
     */
    int updateCartState(Map<String, Object> params);

    /**
     * 장바구니 삭제
     * @param cartNo 장바구니 번호
     * @return 삭제된 행의 수
     */
    int deleteCart(int cartNo);
    
    List<CartVO> getCartWithDetails(String memId);

	

	

}
