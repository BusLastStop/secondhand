package com.bus.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bus.controller.TemporaryPassword;
import com.bus.model.dto.member.Member;
import com.bus.model.service.admin.MemberResetPasswordService;
import com.bus.model.service.member.MemberService;

/**
 * Servlet implementation class MemberResetEndPassword
 */
@WebServlet("/member/resetEnd/password.do")
public class MemberResetEndPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberResetEndPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memId = request.getParameter("memId");
        String memEmail = request.getParameter("memEmail");
        if (memEmail == null || memEmail.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("이메일을 제공해야 합니다.");
            return;
        }
        
        // 임시 비밀번호 생성
        String temporaryPassword = TemporaryPassword.TemporaryPassword(9);
        
        String memPw = temporaryPassword;
        
        Member m = Member.builder().memId(memId).memPw(memPw).build();
        
        String msg,loc="/";
		try {
			int result = new MemberResetPasswordService().resetPassword(m);
;
			msg="비밀번호 초기화 성공!";
			loc="/";
		}catch(RuntimeException e) {
			e.printStackTrace();
			msg="비밀번호 초기화 실패! 다시 시도하세요!";
			loc="/member/reset/password.do";
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
