package kr.or.ddit.page.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.page.shop.service.GoodsService;
import kr.or.ddit.page.shop.service.GoodsCtgryService;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.GdsCtgryVO;
import kr.or.ddit.vo.EventVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ShopMainController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private GoodsCtgryService gdsCtgryService;

    // ✅ 메인 페이지
    @GetMapping("/shop/main")
    public String shopMain(Model model) {
        List<GoodsVO> allGoods = goodsService.getAllGoods();
        List<GdsCtgryVO> categories = gdsCtgryService.getAllCategories();
        List<EventVO> eventList = goodsService.getAllNotices();

        model.addAttribute("goodsList", allGoods);
        model.addAttribute("categoryList", categories);
        model.addAttribute("eventList", eventList);

        return "shop/main";
    }

    // ✅ 이벤트 목록 페이지
    @GetMapping("/event/list") // 수정된 URL
    public String eventList(Model model) {
        List<EventVO> eventList = goodsService.getAllNotices();
        model.addAttribute("eventList", eventList);
        return "event/list";  // event/list.jsp로 이동
    }

    // ✅ 이벤트 상세 페이지
    @GetMapping("/event/detail")
    public String eventDetail(@RequestParam("evtBoardNo") int evtBoardNo, Model model) {
        EventVO event = goodsService.getNoticeById(evtBoardNo);

        if (event != null) {
            log.info("✅ 이벤트 상세 조회: {}", event.getEvtBoardTtl());
        } else {
            log.warn("❌ 이벤트가 존재하지 않습니다. evtBoardNo = {}", evtBoardNo);
        }
        
        model.addAttribute("event", event);
        return "event/detail";  // event/detail.jsp로 이동
    }
}
