package kr.or.ddit.page.comm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/community")
@Controller
public class ComMainController {

	@GetMapping("/main")
	public String mainPage() {

		return "comm/main0";
	}
}
