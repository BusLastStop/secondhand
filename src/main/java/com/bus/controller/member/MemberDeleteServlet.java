package com.bus.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bus.model.service.member.MemberService;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/member/delete.do")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		
		String msg,loc="/";
		try {
			int result = new MemberService().deleteMember(memId);
			msg="정보탈퇴성공!";
			loc="/";
		}catch(RuntimeException e) {
			e.printStackTrace();
			msg="정보탈퇴실패! 다시 시도하세요!";
			loc="/member/info.do";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		
		HttpSession session=request.getSession(false);
		
		if(session!=null) {
			session.invalidate();//session객체 삭제
		}
		
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
