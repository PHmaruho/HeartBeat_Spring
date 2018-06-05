package com.zero.heartbeat.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailServiceImpl implements MailService {

	@Override
	public boolean send(String subject, String string, String string2, String email, Object object) {
		private JavaMailSender javaMailSender;
		public void setJavaMailSender(JavaMailSender javaMailSender) {
			this.javaMailSender = javaMailSender;
		}
		 
		 // javax.mail.internet.MimeMessage
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(string, true);
            helper.setFrom(string2);
            helper.setTo(email);
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
	}

}
