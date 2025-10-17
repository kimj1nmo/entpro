package kr.or.ddit.page.companypage.manageshop;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.GoodsVO;

@Mapper
public interface ManageGoodsMapper {
    
    int getMaxGdsNo(); // 가장 높은 GDS_NO 조회
    
    GoodsVO getGoodsById(int gdsNo); // 특정 상품 조회

    List<GoodsVO> getAllGoods(); // 전체 상품 조회

    void insertGoods(GoodsVO goodsVO); // 상품 등록
    
    void deleteGoods(int gdsNo); // 상품 삭제
    
    void updateGoods(GoodsVO goodsVO); // ✅ 상품 업데이트 추가
}
