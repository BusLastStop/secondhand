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
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet(name="memberUpdate", urlPatterns="/member/update.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memCode = request.getParameter("memCode");
		String memId = request.getParameter("memId");
		Member member = new MemberService().memberIdCheck(memId);
		
		String memPw = request.getParameter("memPw");
		String memName = request.getParameter("memName");
		String memPhone = request.getParameter("memPhone");
		String memEmail = request.getParameter("memEmail");
		String address = request.getParameter("memAddress");
		String memLatitude = request.getParameter("memLatitude");
		String memLongitude = request.getParameter("memLongitude");
		String memAddress = member.getMemAddress();
		String[] myAddress = address.split(", ");
		if (!member.getMemAddress().equals(address)) {
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
		}
		
		Member m = Member.builder().memCode(memCode).memPw(memPw).memName(memName).memPhone(memPhone).memEmail(memEmail).memAddress(memAddress)
				.memLatitude(memLatitude).memLongitude(memLongitude).build();
	
		String msg,loc="/";
		try {
			int result = new MemberService().updateMember(m);
			msg="정보수정성공!";
			loc="/";
		}catch(RuntimeException e) {
			e.printStackTrace();
			msg="정보수정실패! 다시 시도하세요!";
			loc="/member/info.do";
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
