package kr.or.ddit.page.shop.service;

import java.util.List;

import kr.or.ddit.vo.EventVO;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.NoticeVO;

public interface GoodsService {

    int getMaxGdsNo(); // 가장 높은 GDS_NO 조회

    GoodsVO getGoodsById(int gdsNo); // 특정 상품 조회

    List<GoodsVO> getAllGoods(); // 전체 상품 조회

    List<GoodsVO> getGroupGoods(int groupNo); // ✅ 그룹별 상품 조회 메서드 추가

    // ✅ 이벤트 게시판 관련 메서드로 수정
    List<EventVO> getAllNotices();          // 전체 이벤트 조회
    EventVO getNoticeById(int evtBoardNo);  // 특정 이벤트 조회

    //굿즈이름 가져오기
	String getGoodsName(int gdsNo);

}
