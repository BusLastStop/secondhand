package com.bus.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bus.model.dto.member.Member;
import com.bus.model.service.member.MemberService;

/**
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet("/member/enrollEnd.do")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		String memName = request.getParameter("memName");
		String memGender = request.getParameter("memGender");
		String memPhone = request.getParameter("memPhone");
		String memEmail = request.getParameter("memEmail");
		String memBirthDate = request.getParameter("memBirthDate");
		String memAddress = request.getParameter("memAddress");
		String memLatitude = request.getParameter("memLatitude");
		String memLongitude = request.getParameter("memLongitude");
		String memCode = request.getParameter("memCode");
		int count = 0;
		if(!memCode.isEmpty()) {
			if(!memCode.equals("")) {
				count++;
				memCode+=count;
			}
		}
		Member m = Member.builder().memCode(memCode).memId(memId).memPw(memPw).memName(memName).memGender(memGender).memPhone(memPhone).memEmail(memEmail)
				.memBirthDate(memBirthDate).memAddress(memAddress).memLatitude(memLatitude).memLongitude(memLongitude).build();
		String msg,loc="/";
		try {
			int result = new MemberService().insertMember(m);
			msg="회원가입성공!";
			loc="/";
		}catch(RuntimeException e) {
			msg="회원가입실패! 다시 시도하세요!";
			loc="/member/enrollmember.do";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
