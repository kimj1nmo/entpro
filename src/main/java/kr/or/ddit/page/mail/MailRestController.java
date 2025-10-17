package kr.or.ddit.page.mail;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.page.companypage.audition.AuditionService;
import kr.or.ddit.service.MailService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/api/mail")
public class MailRestController {

    @Autowired

    MailService mailService;


    @PostMapping(value = "/signup")
    public String mailConfirm(@RequestBody String email) throws Exception{
        System.out.println("받을 메일 " + email);

        String code = mailService.sendSignupMessage(email);
        System.out.println("사용자에게 발송한 인증코드 ==> " + code);

        return code;
    }
    @PostMapping(value = "/findId")
    public String findId(@RequestBody String email) throws Exception{
        System.out.println("받을 메일 " + email);

        String code = mailService.sendFindIdMessage(email);
        System.out.println("사용자에게 발송한 인증코드 ==> " + code);

        return code;
    }
    @ResponseBody
    @PostMapping(value = "/sendPassMessage")
    public int sendPassMessage(@RequestBody Map<String, Object> map) throws Exception{
        System.out.println("받을 메일 " + map);

        int result = mailService.sendPassMessage(map);
        return result;
    }


    @ResponseBody
    @PostMapping(value = "/sendFailMessage")
    public int sendFailMessage(@RequestBody Map<String, Object> map) throws Exception{
        System.out.println("받을 메일 " + map);

        int result = mailService.sendFailMessage(map);

        return result;
    }
}