package com.bus.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bus.model.dto.member.Member;
import com.bus.model.service.member.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/member/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId=request.getParameter("memId");
		String memPw=request.getParameter("memPw");
		String saveId=request.getParameter("saveId");
		if(saveId!=null) {
			//아이디 저장해
			//Cookie를 이용해서 처리한다.
			Cookie c=new Cookie("saveId",memId);
			c.setMaxAge(60*60*24*100);
			c.setPath("/");
			response.addCookie(c);
		}else {
			Cookie c=new Cookie("saveId","");
			c.setMaxAge(0);
			c.setPath("/");
			response.addCookie(c);
		}
		
		Member m=new MemberService().memberIdCheck(memId);
		if(m!=null&&m.getMemPw().equals(memPw)) {
			//아이디가 일치하는 회원이 있음 -> 로그인 성공
			HttpSession session=request.getSession();
			session.setAttribute("loginMember", m);
			//메인화면으로 리다이렉트 시킴
			response.sendRedirect(request.getContextPath());
		} else {
			//로그인 실패
			request.setAttribute("msg","아이디와 패스워드가 일치하지 않습니다.");
			request.setAttribute("loc","/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
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
