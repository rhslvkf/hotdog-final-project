package org.hotdog.projectVer1;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.hotdog.projectVer1.model.MemberService;
import org.hotdog.projectVer1.model.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestJUnit {
	@Resource
	private MemberService memberService;
	@Test
	public void findMemberById(){
		MemberVO mvo = memberService.findMemberById("java");
		System.out.println(mvo);
		//Assert.assertNotNull(cvo);
	}
	
}