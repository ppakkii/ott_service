package com.ott.service;

import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.ott.Util.MailUtil;


@Service
public class MailSendService {

	@Autowired
	private JavaMailSenderImpl mailSender;

	// 인증메일

	public String sendAuthMail(String u_name , String email) throws Exception {

		String authKey = getAuthKey();
		
		MailUtil sendMail = new MailUtil(mailSender);

		sendMail.setSubject("회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().
						append("<h1>Venire Vide Frui</h1>")
					   .append("<br>")
					   .append(u_name)
					   .append("님 안녕하세요 Venire Vide Frui 에 가입해주셔서 감사합니다.")
					   .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
					   .append("<a href='http://localhost:9090/mail_confirm?email=") // mail_confirm :[ need a .. request Controller] trans data [email,auth_key]
					   .append(email)
					   .append("&auth_key=")
					   .append(authKey)
					   .append("' target='_blenk'>인증 확인</a>").toString());
		sendMail.setFrom("ksm03071@gmail.com", "Venire Vide Frui");
		sendMail.setTo(email);
		sendMail.send();

		return authKey;
	}

	// 난수값 만들기
	private String getAuthKey() {

		Random random = new Random();
		String rand = "";
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i <= 8; i++) {
			rand = String.valueOf(random.nextInt(7));
			sb.append(rand);
		}

		return sb.toString();
	}

}
