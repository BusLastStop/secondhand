package com.bus.controller.member;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 * Servlet implementation class EmailVerificationServlet
 */
@WebServlet("/email/verification.do")
public class MemberEmailVerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEmailVerificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("memEmail");
        
        // 인증번호 생성
        String verificationCode = UUID.randomUUID().toString().substring(0, 6); // 6자리 인증번호 생성
        
        // 네이버 메일 설정 (SMTP 서버)
        String host = "smtp.naver.com";
        String user = "your-email@naver.com"; // 네이버 이메일
        String password = "your-email-password"; // 네이버 이메일 비밀번호
        
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.ssl.enable", "true");

        // 이메일 세션 생성
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            // 이메일 메시지 구성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("이메일 인증번호");
            message.setText("인증번호는 " + verificationCode + " 입니다.");

            // 이메일 전송
            Transport.send(message);
            
            // 인증번호를 세션에 저장
            request.getSession().setAttribute("verificationCode", verificationCode);
            System.out.println(verificationCode);

            // 성공적으로 전송되었음을 응답
            response.getWriter().write("인증번호가 이메일로 전송되었습니다.");
        } catch (MessagingException e) {
            e.printStackTrace();
            response.getWriter().write("이메일 전송에 실패했습니다.");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
