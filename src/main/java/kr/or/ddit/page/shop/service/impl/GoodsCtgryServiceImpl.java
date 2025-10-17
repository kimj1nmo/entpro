package kr.or.ddit.page.shop.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.page.shop.mapper.GoodsCtgryMapper;
import kr.or.ddit.page.shop.service.GoodsCtgryService;
import kr.or.ddit.vo.GdsCtgryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GoodsCtgryServiceImpl implements GoodsCtgryService {

    @Autowired
    private GoodsCtgryMapper gdsCtgryMapper;

    /**
     * 모든 카테고리를 조회하는 메서드
     * @return 카테고리 리스트 반환
     */
    @Override
    public List<GdsCtgryVO> getAllCategories() {
        log.info("📢 카테고리 조회 요청 실행");
        return gdsCtgryMapper.selectCategories();
    }
}
