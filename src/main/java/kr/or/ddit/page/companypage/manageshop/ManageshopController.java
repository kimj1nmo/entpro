package kr.or.ddit.page.companypage.manageshop;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.GdsCtgryVO;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.GroupsVO; // ✅ 그룹 VO 추가
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/companypage") // 기본 경로 설정
public class ManageshopController {

    @Autowired
    private ManageGoodsService manageGoodsService;

    @Autowired
    private GdsCtgryService gdsCtgryService; // ✅ 카테고리 서비스 추가

    @Autowired
    private GroupsService groupsService; // ✅ 그룹 서비스 추가

    @Autowired
    private UploadController uploadController; // 파일 업로드 컨트롤러 추가

    // ✅ 상품 관리 페이지 (상품 & 카테고리 & 그룹 리스트 조회)
    @GetMapping("/goodsManage")
    public String shopMain(Model model) {
        List<GdsCtgryVO> categoryList = gdsCtgryService.getAllCategories();
        List<GoodsVO> allGoods = manageGoodsService.getAllGoods();
        List<GroupsVO> groupList = groupsService.getAllGroups(); // ✅ 그룹 목록 추가
        
        log.info("📌 상품 조회 개수: {}", allGoods.size());
        log.info("📌 카테고리 개수: {}", categoryList.size());
        log.info("📌 그룹 개수: {}", groupList.size());

        model.addAttribute("goodsList", allGoods);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("groupList", groupList); // ✅ JSP에서 그룹 선택 가능하도록 추가

        return "companypage/goodsManage";
    }

    // ✅ 상품 등록 페이지 이동 (카테고리 & 그룹 목록 추가)
    @GetMapping("/goodsRegister")
    public String showGoodsRegisterPage(Model model) {
        List<GdsCtgryVO> categoryList = gdsCtgryService.getAllCategories();
        List<GroupsVO> groupList = groupsService.getAllGroups(); // ✅ 그룹 리스트 가져오기

        log.info("📌 조회된 카테고리 개수: {}", categoryList.size());
        log.info("📌 조회된 그룹 개수: {}", groupList.size());

        model.addAttribute("categoryList", categoryList);
        model.addAttribute("groupList", groupList); // ✅ JSP에서 그룹 선택 가능하도록 추가

        return "companypage/goodsRegister";
    }

    // ✅ 상품 등록 처리 (카테고리, 그룹, 파일 처리)
    @PostMapping("/goodsRegister")
    public String registerGoods(@ModelAttribute GoodsVO goodsVO, 
                                @RequestParam("uploadFiles") MultipartFile[] uploadFiles,
                                @RequestParam("ctgryNo") Integer ctgryNo,
                                @RequestParam("groupNo") Integer groupNo, 
                                Principal principal, Model model) {
        try {
            log.info("📌 상품 등록 요청: {}", goodsVO);

            // 🔴 principal이 null인지 먼저 확인
            if (principal == null) {
                log.error("❌ 사용자 인증 정보 없음. 로그인 필요!");
                model.addAttribute("errorMessage", "로그인이 필요합니다.");
                return "redirect:/login"; // 로그인 페이지로 이동
            }

            String memId = principal.getName();
            goodsVO.setMemId(memId);
            goodsVO.setCtgryNo(ctgryNo);
            goodsVO.setGroupNo(groupNo);

            log.info("📌 등록인 ID: {}", memId);
            log.info("📌 선택한 카테고리: {}", ctgryNo);
            log.info("📌 선택한 그룹: {}", groupNo);

            if (uploadFiles != null && uploadFiles.length > 0 && !uploadFiles[0].isEmpty()) {
                long fileGroupNo = uploadController.multiImageUpload(uploadFiles);
                goodsVO.setFileGroupNo(fileGroupNo);
                log.info("📌 파일 업로드 완료 -> fileGroupNo: {}", fileGroupNo);
            }

            manageGoodsService.registerGoods(goodsVO, uploadFiles);
            log.info("✅ 상품 등록 완료: {}", goodsVO);

            return "redirect:/companypage/goodsManage"; 

        } catch (Exception e) {
            log.error("❌ 상품 등록 중 오류 발생", e);
            model.addAttribute("errorMessage", "상품 등록 중 오류가 발생했습니다.");
            return "companypage/goodsRegister"; 
        }
    }

 // ✅ 상품 삭제 기능 추가
    @PostMapping("/deleteGoods")
    public String deleteGoods(@RequestParam("gdsNo") int gdsNo, Model model) {
        try {
            log.info("🚨 상품 삭제 요청 -> 상품 번호: {}", gdsNo);

            manageGoodsService.deleteGoods(gdsNo);
            log.info("✅ 상품 삭제 완료 -> 상품 번호: {}", gdsNo);

            return "redirect:/companypage/goodsManage";

        } catch (Exception e) {
            log.error("❌ 상품 삭제 중 오류 발생", e);
            model.addAttribute("errorMessage", "상품 삭제 중 오류가 발생했습니다.");
            return "redirect:/companypage/goodsManage";
        }
    }   // ✅ 특정 상품 수정 페이지 이동 (상품, 카테고리, 그룹 정보 포함)
    @GetMapping("/goodsUpdate")
    public String showGoodsUpdatePage(@RequestParam("gdsNo") int gdsNo, Model model) {
        GoodsVO goodsVO = manageGoodsService.getGoodsById(gdsNo);
        List<GdsCtgryVO> categoryList = gdsCtgryService.getAllCategories();
        List<GroupsVO> groupList = groupsService.getAllGroups(); // ✅ 그룹 리스트 가져오기

        if (goodsVO == null) {
            log.error("❌ 상품 정보 없음 -> 상품 번호: {}", gdsNo);
            model.addAttribute("errorMessage", "상품을 찾을 수 없습니다.");
            return "redirect:/companypage/goodsManage";
        }

        log.info("📌 수정할 상품 정보: {}", goodsVO);

        model.addAttribute("goodsVO", goodsVO);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("groupList", groupList);

        return "companypage/goodsUpdate"; // ✅ JSP 페이지 추가
    }

    // ✅ 상품 업데이트 처리 (파일 업로드 포함)
    @PostMapping("/goodsUpdate")
    public String updateGoods(@ModelAttribute GoodsVO goodsVO, 
                              @RequestParam("uploadFiles") MultipartFile[] uploadFiles,
                              @RequestParam("ctgryNo") Integer ctgryNo,
                              @RequestParam("groupNo") Integer groupNo, 
                              Principal principal, Model model) {
        try {
            log.info("📌 상품 업데이트 요청: {}", goodsVO);

            // 현재 로그인한 사용자 ID 가져오기
            String memId = principal.getName();
            goodsVO.setMemId(memId);
            goodsVO.setCtgryNo(ctgryNo);
            goodsVO.setGroupNo(groupNo);

            log.info("📌 업데이트 사용자: {}", memId);
            log.info("📌 업데이트 카테고리: {}", ctgryNo);
            log.info("📌 업데이트 그룹: {}", groupNo);

            // 📌 상품 업데이트 실행
            manageGoodsService.updateGoods(goodsVO, uploadFiles);
            log.info("✅ 상품 업데이트 완료: {}", goodsVO);

            return "redirect:/companypage/goodsManage"; 

        } catch (Exception e) {
            log.error("❌ 상품 업데이트 중 오류 발생", e);
            model.addAttribute("errorMessage", "상품 업데이트 중 오류가 발생했습니다.");
            return "redirect:/companypage/goodsUpdate?gdsNo=" + goodsVO.getGdsNo();
        }
    }


}
