package kr.or.ddit.page.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.page.shop.mapper.CartDetailMapper;
import kr.or.ddit.page.shop.service.CartDetailService;
import kr.or.ddit.vo.CartDetailVO;

@Service
@Transactional
public class CartDetailServiceImpl implements CartDetailService {

    @Autowired
    private CartDetailMapper cartDetailMapper;

    @Override
    public int insertCartDetail(CartDetailVO cartDetailVO) {
        return cartDetailMapper.insertCartDetail(cartDetailVO);
    }

    @Override
    public List<CartDetailVO> selectCartDetailsByMemberId(String memId) {
        return cartDetailMapper.selectCartDetailsByMemberId(memId);
    }

    @Override
    public List<CartDetailVO> getCartDetailByCartNo(int cartNo) {
        return cartDetailMapper.selectCartDetailByCartNo(cartNo);
    }

    @Override
    public List<CartDetailVO> getCartDetailByGdsNo(int gdsNo) {
        return cartDetailMapper.selectCartDetailByGdsNo(gdsNo);
    }

    @Override
    public CartDetailVO selectCartDetailByCartNoAndGdsNo(int cartNo, int gdsNo) {
        return cartDetailMapper.selectCartDetailByCartNoAndGdsNo(cartNo, gdsNo); // 새 메서드 구현
    }

    @Override
    public int updateCartDetailQy(CartDetailVO cartDetailVO) {
        return cartDetailMapper.updateCartDetailQy(cartDetailVO);
    }

    @Override
    public int deleteCartDetail(int cartNo, int gdsNo) {
        return cartDetailMapper.deleteCartDetail(cartNo, gdsNo);
    }
}
