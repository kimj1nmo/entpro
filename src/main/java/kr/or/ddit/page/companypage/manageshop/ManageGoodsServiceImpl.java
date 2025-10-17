package kr.or.ddit.page.companypage.manageshop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.GoodsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManageGoodsServiceImpl implements ManageGoodsService {

    @Autowired
    private ManageGoodsMapper manageGoodsMapper;

    @Autowired
    private UploadController uploadController; // 파일 업로드 컨트롤러 추가

    @Override
    public int getMaxGdsNo() {
        return manageGoodsMapper.getMaxGdsNo();
    }

    @Override
    public GoodsVO getGoodsById(int gdsNo) {
        return manageGoodsMapper.getGoodsById(gdsNo);
    }

    @Override
    public List<GoodsVO> getAllGoods() {
        return manageGoodsMapper.getAllGoods();
    }

    // ✅ 상품 등록 (파일 업로드 포함)
    @Override
    public void registerGoods(GoodsVO goodsVO, MultipartFile[] uploadFiles) {
        log.info("registerGoods -> goodsVO: {}", goodsVO);

        // 📌 1. 파일 업로드 처리
        if (uploadFiles != null && uploadFiles.length > 0 && !uploadFiles[0].isEmpty()) {
            long fileGroupNo = uploadController.multiImageUpload(uploadFiles);
            goodsVO.setFileGroupNo(fileGroupNo);
            log.info("파일 업로드 완료 -> fileGroupNo: {}", fileGroupNo);
        }

        // 📌 2. GOODS 테이블에 상품 저장
        manageGoodsMapper.insertGoods(goodsVO);
        log.info("registerGoods -> 상품 등록 완료: {}", goodsVO);
    }
 // ✅ 상품 삭제
    @Override
    public void deleteGoods(int gdsNo) {
        log.info("🔹 상품 삭제 진행 중 -> 상품 번호: {}", gdsNo);
        manageGoodsMapper.deleteGoods(gdsNo);
        log.info("✅ 상품 삭제 완료 -> 상품 번호: {}", gdsNo);
    }
    
    // ✅ 상품 업데이트 (파일 업로드 포함)
    @Transactional
    @Override
    public void updateGoods(GoodsVO goodsVO, MultipartFile[] uploadFiles) throws Exception {
        if (uploadFiles != null && uploadFiles.length > 0 && !uploadFiles[0].isEmpty()) {
            // 새 이미지 업로드 시 fileGroupNo 갱신
            long fileGroupNo = uploadController.multiImageUpload(uploadFiles);
            goodsVO.setFileGroupNo(fileGroupNo);
        }

        // 상품 정보 업데이트
        manageGoodsMapper.updateGoods(goodsVO);
    }
    
}
