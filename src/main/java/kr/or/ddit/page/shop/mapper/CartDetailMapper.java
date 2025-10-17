package kr.or.ddit.page.shop.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CartDetailVO;

@Mapper
public interface CartDetailMapper {

    /**
     * 장바구니 상세(CART_DETAIL) 등록
     * @param cartDetailVO 장바구니 상세 정보
     * @return 등록된 행 개수
     */
    int insertCartDetail(CartDetailVO cartDetailVO);

    /**
     * 특정 회원의 장바구니 상세 목록 조회
     * @param memId 회원 ID
     * @return 장바구니 상세 목록
     */
    List<CartDetailVO> selectCartDetailsByMemberId(String memId);

    /**
     * 특정 장바구니 상세 조회
     * @param cartNo 장바구니 번호
     * @return 장바구니 상세 목록
     */
    List<CartDetailVO> selectCartDetailByCartNo(int cartNo);

    /**
     * 특정 상품의 장바구니 상세 조회
     * @param gdsNo 상품 번호
     * @return 장바구니 상세 목록
     */
    List<CartDetailVO> selectCartDetailByGdsNo(int gdsNo);

    /**
     * 특정 장바구니와 상품 번호로 상세 조회
     * @param cartNo 장바구니 번호
     * @param gdsNo 상품 번호
     * @return 장바구니 상세 정보
     */
    CartDetailVO selectCartDetailByCartNoAndGdsNo(@Param("cartNo") int cartNo, @Param("gdsNo") int gdsNo);

    /**
     * 장바구니 상세 수량 업데이트
     * @param cartDetailVO 장바구니 상세 정보
     * @return 업데이트된 행 개수
     */
    int updateCartDetailQy(CartDetailVO cartDetailVO);

    /**
     * 특정 장바구니 상세 삭제
     * @param cartNo 장바구니 번호
     * @param gdsNo 상품 번호
     * @return 삭제된 행 개수
     */
    int deleteCartDetail(@Param("cartNo") int cartNo, @Param("gdsNo") int gdsNo);
}
