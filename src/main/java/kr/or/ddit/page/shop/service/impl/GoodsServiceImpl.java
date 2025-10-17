package kr.or.ddit.page.shop.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.page.shop.mapper.GoodsMapper;
import kr.or.ddit.page.shop.service.GoodsService;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.EventVO;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public int getMaxGdsNo() {
        return goodsMapper.getMaxGdsNo();
    }

    @Override
    public GoodsVO getGoodsById(int gdsNo) {
        return goodsMapper.getGoodsById(gdsNo);
    }

    @Override
    public List<GoodsVO> getAllGoods() {
        return goodsMapper.getAllGoods();
    }

    @Override
    public List<GoodsVO> getGroupGoods(int groupNo) {
        return goodsMapper.getGroupGoods(groupNo);
    }

    // ✅ 이벤트 관련 메서드 수정
    @Override
    public List<EventVO> getAllNotices() {
        return goodsMapper.getAllNotices();
    }

    @Override
    public EventVO getNoticeById(int evtBoardNo) {
        return goodsMapper.getNoticeById(evtBoardNo);
    }
    //굿즈이름 가져오기
	@Override
	public String getGoodsName(int gdsNo) {
        return goodsMapper.getGoodsName(gdsNo);

	}
}
