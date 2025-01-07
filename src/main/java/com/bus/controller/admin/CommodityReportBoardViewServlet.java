package com.bus.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bus.model.dto.admin.CommodityBoardReport;
import com.bus.model.service.admin.CommodityBoardReportService;

/**
 * Servlet implementation class CommodityReportBoardViewServlet
 */
@WebServlet("/commodity/report/board/view.do")
public class CommodityReportBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommodityReportBoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boaCode = request.getParameter("boaCode");
		CommodityBoardReport report = new CommodityBoardReportService().selectCommodiryBoardreportView(boaCode);
		request.setAttribute("report", report);
		request.getRequestDispatcher("/WEB-INF/views/admin/commodityReportView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
