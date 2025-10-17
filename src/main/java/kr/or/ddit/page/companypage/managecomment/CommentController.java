package kr.or.ddit.page.companypage.managecomment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.CommentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/companypage")
public class CommentController {

	@Autowired
	CommentService commentService;

	// 댓글 관리 메인 페이지
		@GetMapping("/manageComment")
		public String list(Model model) {
		    List<CommentVO> comment = commentService.listAll();
		    
		    model.addAttribute("CommentVO", comment); //
		    log.info("commentVO : " + comment);
		    return "companypage/manageComment";
		}

}
