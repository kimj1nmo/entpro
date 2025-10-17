package kr.or.ddit.page.companypage.manageshop;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import kr.or.ddit.vo.GoodsVO;

public interface ManageGoodsService {
    
    int getMaxGdsNo(); // 가장 높은 GDS_NO 조회
    GoodsVO getGoodsById(int gdsNo); // 특정 상품 조회
    List<GoodsVO> getAllGoods(); // 전체 상품 조회

    // ✅ 상품 등록 (파일 업로드 포함)
    void registerGoods(GoodsVO goodsVO, MultipartFile[] uploadFiles);
    
 // ✅ 상품 삭제 메서드 추가
    void deleteGoods(int gdsNo);
    
 // ✅ 상품 업데이트 추가 (파일 포함)
    void updateGoods(GoodsVO goodsVO, MultipartFile[] uploadFiles) throws Exception;

}
