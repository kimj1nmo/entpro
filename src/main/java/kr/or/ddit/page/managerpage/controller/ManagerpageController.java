package kr.or.ddit.page.managerpage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/managepage")
public class ManagerpageController {

	@GetMapping("/main")
	public String main() {
		log.info("메인 페이지");

		return "managepage/main";
	}
	
	@GetMapping("/manage/detail_test")
	public String detail_test() {
		log.info("테스트 페이지");
		
		return "managepage/manage/detail_test";
	}
	@GetMapping("/manage/calendar")
	public String calendar() {
		log.info("캘린더 페이지");
		
		return "managepage/manage/calendar";
	}
	
	@GetMapping("/projectStats")
	public String projectStats() {
		return "managepage/projectStats";
	}
	

}
