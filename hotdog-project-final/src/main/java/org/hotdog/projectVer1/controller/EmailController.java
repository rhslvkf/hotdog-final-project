package org.hotdog.projectVer1.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;

@Controller
public class EmailController implements Runnable{
	@Override
	public void run(){
		
		String name = Thread.currentThread().getName();
		String[] memberInfo = name.split(" ");
		
		// 메일 관련 정보
        String host = "smtp.gmail.com";
        String username = "kosta.hotdog@gmail.com";
        String pass = "kosta1234";
         
        String subject = "";
        String body = "";
        
        // 메일 내용
        String recipient = memberInfo[0];
        
        if(memberInfo.length == 2){
        	subject = "핫도그 커뮤니티 회원 패스워드 안내 메일";
        	body = "<h4>회원님의 패스워드는 <font color='red'>[ "+ memberInfo[1] +" ]</font> 입니다.</h4>";
        }else if(memberInfo.length == 1){
        	subject = "핫도그 커뮤니티 이메일 인증 안내 메일";
        	body = "<h3><a href = 'http://192.168.0.107:8889/projectVer1/certification.do?memberId="+recipient+"'>이메일 인증 링크</a></h3>";
        }
         
        //properties 설정
        Properties props = new Properties();
        props.put("mail.smtps.auth", "true");
        // 메일 세션
        Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session);
        
        try{
        // 메일 관련
        msg.setSubject(subject);
        msg.setContent(body,"text/html;charset=utf-8");
        msg.setFrom(new InternetAddress(username));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
 
        // 발송 처리
        Transport transport = session.getTransport("smtps");
        transport.connect(host, username, pass);
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close(); 
        }catch(Exception e){
        	e.printStackTrace();
        }
	}
}
