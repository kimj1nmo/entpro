package kr.or.ddit.page.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;
import kr.or.ddit.page.shop.service.GoodsService;
import kr.or.ddit.page.shop.service.ReviewService;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ReviewVO;
import lombok.extern.slf4j.Slf4j;

import java.security.Principal;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopDetailController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private UploadController uploadController; // ✅ 파일 업로드 컨트롤러 추가

    /**
     * ✅ 상품 상세 페이지 (리뷰 정보 포함)
     */
    @GetMapping("/detail")
    public String handleDetail(
            @RequestParam("gdsNo") int gdsNo,
            Model model,
            Principal principal) { // ✅ 로그인한 사용자 정보 가져오기

        // ✅ 로그인한 사용자 ID 가져오기
        String loggedInUserId = (principal != null) ? principal.getName() : null;
        log.info("✅ 현재 로그인한 사용자 ID: {}", loggedInUserId);

        // ✅ 상품 정보 조회
        GoodsVO goodsVO = goodsService.getGoodsById(gdsNo);
        if (goodsVO == null) {
            log.error("❌ 상품 정보를 찾을 수 없습니다. 상품 번호: {}", gdsNo);
            model.addAttribute("error", "상품 정보를 찾을 수 없습니다.");
            return "shop/error";
        }

        log.info("📌 조회된 상품 데이터: {}", goodsVO);

        // ✅ 리뷰 정보 조회 (이미지 포함)
        List<ReviewVO> reviewList = reviewService.getReviewsByGdsNo(gdsNo);
        log.info("📌 조회된 리뷰 개수: {}", reviewList.size());

        // ✅ 뷰로 데이터 전달
        model.addAttribute("gdsNo", gdsNo);
        model.addAttribute("goodsVO", goodsVO);
        model.addAttribute("reviewList", reviewList); // 리뷰 목록 추가
        model.addAttribute("loggedInUserId", loggedInUserId); // ✅ 로그인한 사용자 ID 추가

        return "shop/detail";
    }


    /**
     * ✅ 리뷰 등록 기능 (파일 업로드 포함)
     */
    @PostMapping("/review/add")
    @ResponseBody
    public String addReview(
            @RequestParam("gdsNo") int gdsNo,
            @RequestParam("reContent") String reContent,
            @RequestParam(value = "reviewImages", required = false) MultipartFile[] uploadFiles,
            Principal principal) { // ✅ `@AuthenticationPrincipal` 대신 `Principal` 사용

        if (principal == null) {
            log.error("❌ 로그인한 사용자만 리뷰를 작성할 수 있습니다. (Principal == null)");
            return "error: 로그인 필요";
        }

        String memId = principal.getName(); // ✅ 현재 로그인된 사용자 ID 가져오기
        log.info("✅ 로그인된 사용자 ID: {}", memId);

        // ✅ 리뷰 정보 생성
        ReviewVO reviewVO = new ReviewVO();
        reviewVO.setMemId(memId);
        reviewVO.setGdsNo(gdsNo);
        reviewVO.setReContent(reContent);

        // ✅ 파일 업로드 처리
        try {
            if (uploadFiles != null && uploadFiles.length > 0 && !uploadFiles[0].isEmpty()) {
                Long fileGroupNo = uploadController.multiImageUpload(uploadFiles);
                reviewVO.setFileGroupNo(fileGroupNo);
                log.info("📌 리뷰 파일 업로드 완료 -> fileGroupNo: {}", fileGroupNo);
            } else {
                log.info("📌 업로드된 파일 없음");
            }
        } catch (Exception e) {
            log.error("❌ 파일 업로드 중 오류 발생", e);
            return "error: 파일 업로드 실패";
        }

        // ✅ 리뷰 저장
        try {
            reviewService.addReview(reviewVO);
            log.info("✅ 리뷰 DB 저장 완료: {}", reviewVO);
        } catch (Exception e) {
            log.error("❌ 리뷰 저장 중 오류 발생", e);
            return "error: DB 오류";
        }

        return "success";
    }



    /**
     * ✅ 특정 상품의 리뷰 목록 조회 (GET)
     */
    @GetMapping("/review/{gdsNo}")
    @ResponseBody
    public List<ReviewVO> getReviews(@PathVariable int gdsNo) {
        return reviewService.getReviewsByGdsNo(gdsNo);
    }

    /**
     * ✅ 리뷰 삭제 (RE_STATUS = 0 업데이트)
     */
    @PostMapping("/review/delete")
    @ResponseBody
    public String deleteReview(@RequestParam("reNo") int reNo) { // ✅ 로그인 정보 없이도 삭제 가능

        try {
            reviewService.deleteReview(reNo);
            log.info("✅ 리뷰 삭제 완료 (RE_STATUS=0 설정) -> reNo: {}", reNo);
            return "success";
        } catch (Exception e) {
            log.error("❌ 리뷰 삭제 중 오류 발생", e);
            return "error: DB 오류";
        }
    }
    /**
     * ✅ 리뷰 수정 (파일 포함)
     */
    @PostMapping("/review/update")
    @ResponseBody
    public String updateReview(
            @RequestParam("reNo") int reNo,
            @RequestParam("reContent") String reContent,
            @RequestParam(value = "reviewImages", required = false) MultipartFile[] uploadFiles) {

        log.info("✅ 리뷰 수정 요청 - 리뷰번호: {}", reNo);

        // ✅ 리뷰 정보 업데이트
        ReviewVO reviewVO = new ReviewVO();
        reviewVO.setReNo(reNo);
        reviewVO.setReContent(reContent);

        // ✅ 파일 업로드 처리
        try {
            if (uploadFiles != null && uploadFiles.length > 0 && !uploadFiles[0].isEmpty()) {
                Long fileGroupNo = uploadController.multiImageUpload(uploadFiles);
                reviewVO.setFileGroupNo(fileGroupNo);
                log.info("📌 새 파일 업로드 완료 -> fileGroupNo: {}", fileGroupNo);
            }
        } catch (Exception e) {
            log.error("❌ 파일 업로드 중 오류 발생", e);
            return "error: 파일 업로드 실패";
        }

        // ✅ 리뷰 업데이트
        try {
            reviewService.updateReview(reviewVO);
            log.info("✅ 리뷰 수정 완료: {}", reviewVO);
            return "success";
        } catch (Exception e) {
            log.error("❌ 리뷰 수정 중 오류 발생", e);
            return "error: DB 오류";
        }
    }

    
}
