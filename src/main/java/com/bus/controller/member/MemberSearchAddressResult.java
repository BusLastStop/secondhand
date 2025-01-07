package com.bus.controller.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bus.controller.NominatimGeocoding;

/**
 * Servlet implementation class MemberSearchAddressResult
 */
@WebServlet("/member/searchAddressResult.do")
public class MemberSearchAddressResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchAddressResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = request.getParameter("address"); // 사용자가 입력한 주소
        List<Map<String, String>> results = new ArrayList<>();

        if (address != null && !address.trim().isEmpty()) {
            try {
                // Nominatim API를 호출해 결과를 가져옵니다.
                results = NominatimGeocoding.searchAddress(address);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 결과를 JSP로 전달
        request.setAttribute("results", results);
        request.setAttribute("address", address);
        request.getRequestDispatcher("/WEB-INF/views/member/addressSearch.jsp").forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
