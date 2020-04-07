package com.green.util;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

import com.green.member.domain.Email;
   
    public class EmailSender  {
         
        @Autowired
        protected JavaMailSender  mailSender;
        //자동 주입
        public void SendEmail(Email email) throws Exception {
        //이메일 객체 전달받음
            MimeMessage msg = mailSender.createMimeMessage();
            //MimeMessage 객체 생성 (세션형태?)
            try {
                msg.setSubject(email.getSubject()); //제목 세팅
                msg.setText(email.getContent()); //내용 세팅
                msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
               //수신자 주소등 세팅
            }catch(MessagingException e) {
                System.out.println("MessagingException");
                e.printStackTrace();
                //예외처리
            }
            try {
                mailSender.send(msg); //메일 전송
            }catch(MailException e) {
                System.out.println("MailException발생");
                e.printStackTrace();
            }
        }
}