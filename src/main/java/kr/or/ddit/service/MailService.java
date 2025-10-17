package kr.or.ddit.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

public interface MailService  {

    // 메일 내용 작성
    MimeMessage creatSignupMessage(String senderMail, String page) throws MessagingException, UnsupportedEncodingException;

    // 랜덤 인증코드 생성
    String createKey();

    // 메일 발송
    String sendSignupMessage(String to) throws Exception;

	String sendFindIdMessage(String to) throws Exception;

	String sendFindPwMessage(String to) throws Exception;

	//오디션 전용 메일
	MimeMessage auditionPassMessage(String to, String audName, String audReqNm, String page)
			throws MessagingException, UnsupportedEncodingException;


	MimeMessage auditionFailMessage(String to, String audName, String audReqNm, String page)
			throws MessagingException, UnsupportedEncodingException;


	int sendPassMessage(Map<String, Object> map);

	int sendFailMessage(Map<String, Object> map);

}
