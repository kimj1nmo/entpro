package kr.or.ddit.page.shop.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.page.shop.mapper.CartMapper;
import kr.or.ddit.page.shop.service.CartService;
import kr.or.ddit.vo.CartVO;

@Service
@Transactional
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper cartMapper;

    @Override
    public int insertCart(CartVO cartVO) {
        return cartMapper.insertCart(cartVO);
    }

    @Override
    public CartVO selectRecentCartById(String memId) {
        return cartMapper.selectRecentCartById(memId);
    }

    @Override
    public int updateCartState(Map<String, Object> params) {
        return cartMapper.updateCartState(params);
    }

    @Override
    public int deleteCart(int cartNo) {
        return cartMapper.deleteCart(cartNo);
    }
    
    @Override
    public List<CartVO> getCartWithDetails(String memId) {
        return cartMapper.selectCartWithDetails(memId);
    }

}
