package kr.or.ddit.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;
import kr.or.ddit.service.MailService;

@Service
public class MailServiceImpl implements MailService {
	@Autowired
	JavaMailSender emailSender; // MailConfig에서 등록해둔 Bean을 autowired하여 사용하기

	private String ePw; // 사용자가 메일로 받을 인증번호

	// 메일 내용 작성
	@Override
	public MimeMessage creatSignupMessage(String to, String page) throws MessagingException, UnsupportedEncodingException {
		System.out.println("creatMessage-> 메일받을 사용자 :" + to);
		System.out.println("creatMessage -> 인증번호 :" + ePw);

		MimeMessage message = emailSender.createMimeMessage();

		message.addRecipients(RecipientType.TO, to); // 메일 받을 사용자
		message.setSubject("[Entertainment]이메일 인증"); // 이메일 제목

		String msgg = "";

		msgg += "<div align='center'><h1>Entertainment ";
		msgg += page;
						msgg += "</h1><br><p>아래 인증코드를 ";
						msgg += page;
						msgg += "  페이지에 입력해주세요</p><br> </div><div align='center' style=' border:1px double black'>";
						msgg += "<div style='font-size:200%'>";
						msgg += "<strong>"+ePw+"</strong> </div> <br/></div>";

		message.setText(msgg, "utf-8", "html");
		message.setFrom(new InternetAddress("???", "Entertainment"));
		System.out.println("creatMessage->  함수에서 생성된 msgg 메시지 : " + msgg);

		System.out.println("creatMessage->  함수에서 생성된 리턴 메시지 : " + message);

		return message;
	}

	@Override
	public MimeMessage auditionPassMessage(String to, String audName , String audReqNm, String page) throws MessagingException, UnsupportedEncodingException {
		System.out.println("creatMessage-> 메일받을 사용자 :" + to);
		System.out.println("creatMessage -> 인증번호 :" + ePw);

		MimeMessage message = emailSender.createMimeMessage();

		message.addRecipients(RecipientType.TO, to); // 메일 받을 사용자
		String str="[Entertainment] "+audName+" 결과안내";
		message.setSubject(str); // 이메일 제목

		String msgg = "";

		msgg += "<div align='center'><h1>Entertainment</h1><br>";
		msgg += "안녕하세요, " + audReqNm + "님.<br>";
		msgg += "[Entertainment]의 " + audName + "에 지원해 주셔서 진심으로 감사드립니다.<br><br>";
		msgg += audReqNm + "님께서 이번 오디션에서 1차 합격하셨습니다,<br>"
				+ "귀하의 재능과 열정이 심사위원들에게 깊은 인상을 남겼으며,다음 활동이 매우 기대됩니다.<br>"
				+ "다음 단계와 관련된 세부사항은 아래 내용을 참고해 주세요:<br><br>";
		msgg += page;
		msgg += "<br><br>추가로 궁금하신 사항이 있으시면 언제든지 문의게시판에 문의 주시기 바랍니다.<br>";
		msgg += "다시 한번 진심으로 축하드리며, 곧 뵙기를 기대하겠습니다.<br><br>";
		msgg += "감사합니다.<br>[Entertainment] 드림 ";
		msgg += "<br/></div>";

		message.setText(msgg, "utf-8", "html");
		message.setFrom(new InternetAddress("???", "Entertainment"));
		System.out.println("creatMessage->  함수에서 생성된 msgg 메시지 : " + msgg);

		System.out.println("creatMessage->  함수에서 생성된 리턴 메시지 : " + message);

		return message;
	}
	@Override
	public MimeMessage auditionFailMessage(String to, String audName, String audReqNm,String page) throws MessagingException, UnsupportedEncodingException {
		System.out.println("creatMessage-> 메일받을 사용자 :" + to);
		System.out.println("creatMessage -> 인증번호 :" + ePw);

		MimeMessage message = emailSender.createMimeMessage();

		message.addRecipients(RecipientType.TO, to); // 메일 받을 사용자
		String str="[Entertainment] "+audName+" 결과안내";
		message.setSubject(str); // 이메일 제목

		String msgg = "";

		msgg += "<div align='center'><h1>Entertainment</h1><br>";
		msgg += "안녕하세요, " + audReqNm + "님.<br>";
		msgg += "[Entertainment]의 " + audName + "에 지원해 주셔서 진심으로 감사드립니다.<br><br>";
		msgg += "이번에는 안타깝게도 " + audReqNm + "님께서 최종 합격 명단에 포함되지 않았음을 알려드립니다.<br>";
		msgg += "지원자님의 재능과 열정은 매우 인상적이었으며, 치열한 경쟁 속에서 심사에 많은 고민이 있었습니다.<br><br>";
		msgg += page;
		msgg += "<br><br>앞으로도 " + audReqNm + "님의 멋진 도전과 성공을 진심으로 응원하겠습니다.<br>";
		msgg += "다른 기회에 다시 만나 뵐 수 있기를 기대하며, 지속적인 열정을 잃지 않으시길 바랍니다.<br><br>";
		msgg += "지원해 주셔서 다시 한번 감사드리며, 앞으로도 건승을 기원합니다.<br><br>";
		msgg += "감사합니다.<br>[Entertainment] 드림 ";
		msgg += "<br/></div>";


		message.setText(msgg, "utf-8", "html");
		message.setFrom(new InternetAddress("???", "Entertainment"));
		System.out.println("creatMessage->  함수에서 생성된 msgg 메시지 : " + msgg);

		System.out.println("creatMessage->  함수에서 생성된 리턴 메시지 : " + message);

		return message;
	}
	// 랜덤 인증코드 생성
	@Override
	public String createKey() {
		Random random = new Random();
		StringBuffer keyBuf = new StringBuffer();
		/*
		 * int leftLimit = 48; // numeral '0' int rightLimit = 122; // letter 'z' int
		 * targetStringLength = 10; String key = random.ints(leftLimit, rightLimit +
		 * 1).filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
		 * .limit(targetStringLength) .collect(StringBuilder::new,
		 * StringBuilder::appendCodePoint, StringBuilder::append).toString();
		 * System.out.println("생성된 랜덤 인증코드" + key);
		 */
		for (int i = 0; i < 8; i++) { // 총 8자리 인증 번호 생성
			int idx = random.nextInt(3); // 0~2 사이의 값을 랜덤하게 받아와 idx에 집어넣습니다
			// 0,1,2 값을 switchcase를 통해 꼬아버립니다.
			// 숫자와 ASCII 코드를 이용합니다.
			switch (idx) {
			case 0:
				// 0일 때, a~z 까지 랜덤 생성 후 key에 추가
				keyBuf.append((char) (random.nextInt(26) + 97));
				break;
			case 1:
				// 1일 때, A~Z 까지 랜덤 생성 후 key에 추가
				keyBuf.append((char) (random.nextInt(26) + 65));
				break;
			case 2:
				// 2일 때, 0~9 까지 랜덤 생성 후 key에 추가
				keyBuf.append(random.nextInt(9));
				break;
			}
		}
		String key = keyBuf.toString();
		return key;
	}

	// 메일 발송
	// sendSignupMessage 의 매개변수 to는 이메일 주소가 되고,
	// MimeMessage 객체 안에 내가 전송할 메일의 내용을 담는다
	// bean으로 등록해둔 javaMail 객체를 사용하여 이메일을 발송한다
	@Override
	public String sendSignupMessage(String to) throws Exception {

		ePw = createKey(); // 랜덤 인증코드 생성
		System.out.println("sendSignupMessage->생성된 랜덤 인증코드: " + ePw);

		MimeMessage message = creatSignupMessage(to,"회원가입"); // "to" 로 메일 발송

		System.out.println("sendSignupMessage-> 생성된 메시지 : " + message);

		try { // 예외처리
			emailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			throw new IllegalArgumentException();
		}

		return ePw; // 메일로 사용자에게 보낸 인증코드를 서버로 반환! 인증코드 일치여부를 확인하기 위함
	}

	@Override
	public String sendFindIdMessage(String to) throws Exception {

		ePw = createKey(); // 랜덤 인증코드 생성
		System.out.println("sendSignupMessage->생성된 랜덤 인증코드: " + ePw);

		MimeMessage message = creatSignupMessage(to,"아이디 찾기"); // "to" 로 메일 발송

		System.out.println("sendSignupMessage-> 생성된 메시지 : " + message);

		try { // 예외처리
			emailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			throw new IllegalArgumentException();
		}

		return ePw; // 메일로 사용자에게 보낸 인증코드를 서버로 반환! 인증코드 일치여부를 확인하기 위함
	}

	@Override
	public String sendFindPwMessage(String to) throws Exception {

		ePw = createKey(); // 랜덤 인증코드 생성
		System.out.println("sendSignupMessage->생성된 랜덤 인증코드: " + ePw);

		MimeMessage message = creatSignupMessage(to,"비밀 번호"); // "to" 로 메일 발송

		System.out.println("sendSignupMessage-> 생성된 메시지 : " + message);

		try { // 예외처리
			emailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			throw new IllegalArgumentException();
		}

		return ePw; // 메일로 사용자에게 보낸 인증코드를 서버로 반환! 인증코드 일치여부를 확인하기 위함
	}
	@Override
	public int sendPassMessage(Map<String, Object> map) {

		System.out.println("sendSignupMessage->map: " + map);
		   String email= (String) map.get("email");
	        String audNm= (String) map.get("audNm");
	        String audReqNm= (String) map.get("audReqNm");
	        String page= (String) map.get("page");
		MimeMessage message = null;

//		System.out.println("sendSignupMessage-> 생성된 메시지 : " + message);
			int i=0;
		try { // 예외처리
			message = auditionPassMessage(email,audNm,audReqNm,page);
			emailSender.send(message);
			i=1;
			} catch (Exception e) {
			e.printStackTrace();
			throw new IllegalArgumentException();
		}

		return i;
	}
	@Override
	public int sendFailMessage(Map<String, Object> map) {

		System.out.println("sendSignupMessage->map: " + map);
		   String email= (String) map.get("email");
	        String audNm= (String) map.get("audNm");
	        String audReqNm= (String) map.get("audReqNm");
	        String page= (String) map.get("page");
		MimeMessage message = null;

			int i=0;
		try { // 예외처리
			message = auditionFailMessage(email,audNm,audReqNm,page);
			emailSender.send(message);
			i=1;
			} catch (Exception e) {
			e.printStackTrace();
			throw new IllegalArgumentException();
		}

		return i;
	}
}
