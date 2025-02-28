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
		request.setCharacterEncoding("UTF-8");
		
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		String memName = request.getParameter("memName");
		String memGender = request.getParameter("memGender");
		String memPhone = request.getParameter("memPhone");
		String memEmail = request.getParameter("memEmail");
		String memBirthDate = request.getParameter("memBirthDate");
		String address = request.getParameter("memAddress");
		String memLatitude = request.getParameter("memLatitude");
		String memLongitude = request.getParameter("memLongitude");
		
		String memAddress;
		String[] myAddress = address.split(", ");
		switch (myAddress.length) {
	        case 6:
	            memAddress = myAddress[5] + " " + myAddress[3] + " " + myAddress[2] + " " + myAddress[1];
	            break;
	        case 5:
	        	memAddress = myAddress[4] + " " + myAddress[2] + " " + myAddress[1] + " " + myAddress[0];
	        case 4:
	        	memAddress = myAddress[3] + " " + myAddress[2] + " " + myAddress[1] + " " + myAddress[0];
	            break;
	        case 3:
	        	memAddress = myAddress[2] + " " + myAddress[1] + " " + myAddress[0];
	        	break;
	        case 2:
	        	memAddress = myAddress[1] + " " + myAddress[0];
	        default:
	        	memAddress = address;
	            break;
		}
		
		Member m = Member.builder().memId(memId).memPw(memPw).memName(memName).memGender(memGender).memPhone(memPhone).memEmail(memEmail)
				.memBirthDate(memBirthDate).memAddress(memAddress).memLatitude(memLatitude).memLongitude(memLongitude).build();
	
		String msg,loc="/";
		try {
			int result = new MemberService().insertMember(m);
			msg="회원가입성공!";
			loc="/";
		}catch(RuntimeException e) {
			e.printStackTrace();
			msg="회원가입실패! 다시 시도하세요!";
			loc="/member/enroll.do";
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
