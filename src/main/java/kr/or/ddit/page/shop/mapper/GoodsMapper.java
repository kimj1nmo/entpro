package kr.or.ddit.page.shop.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.EventVO;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.NoticeVO;

@Mapper
public interface GoodsMapper {

    int getMaxGdsNo(); // 가장 높은 GDS_NO 조회

    GoodsVO getGoodsById(int gdsNo); // 특정 상품 조회

    List<GoodsVO> getAllGoods(); // 전체 상품 조회

    List<GoodsVO> getGroupGoods(@Param("groupNo") int groupNo); // ✅ 특정 그룹의 상품 조회

 // ✅ 모든 이벤트 조회
    List<EventVO> getAllNotices();

    // ✅ 특정 이벤트 조회
    EventVO getNoticeById(@Param("evtBoardNo") int evtBoardNo);

	String getGoodsName(int gdsNo);

}
