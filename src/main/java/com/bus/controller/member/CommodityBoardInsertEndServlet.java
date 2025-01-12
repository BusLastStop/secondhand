package com.bus.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bus.model.dto.CommodityBoard;
import com.bus.model.service.CommodityBoardService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class CommodityBoardInsertEndServlet
 */
@WebServlet("/insertend/commodity/board.do")
public class CommodityBoardInsertEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommodityBoardInsertEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String filePath=getServletContext().getRealPath("/resources/upload/commodityBoard");
		String imgPath=getServletContext().getRealPath("/resources/upload/images");
		MultipartRequest mr=new MultipartRequest(
					request,
					filePath,
					1024*1024*100,
					"utf-8",
					new DefaultFileRenamePolicy()
				);
		
		mr=new MultipartRequest(
				request,
				imgPath,
				1024*1024*100,
				"utf-8",
				new DefaultFileRenamePolicy()
				);
		
		String boaTitle=mr.getParameter("boaTitle");
		String boaMemName=mr.getParameter("boaMemName");
		String boaContent=mr.getParameter("boaContent");
		String boaImgName = mr.getParameter("boaImgName");
		String boaComName = mr.getParameter("boaComName");
		int boaComPrice = Integer.parseInt(mr.getParameter("boaComPrice"));
		
		String originalFileName=mr.getOriginalFileName("boaFileName");
		String renamedFileName=mr.getFilesystemName("boaFileName");
		
		CommodityBoard b = CommodityBoard.builder().boaComName(boaComName).boaComPrice(boaComPrice).boaContent(boaContent)
				.boaFileName(originalFileName).boaFileReName(renamedFileName).boaTitle(boaTitle).boaMemName(boaMemName).build();
		
		int result = new CommodityBoardService().insertCommodityBoard(b);
		
		String msg,loc;
		if(result>0) {
			msg="게시글 등록성공!";
			// 카테고리를 사용 하여 분기 처리
			loc="/commodity/board.do";
		}else {
			msg="게시글 등록실패!";
			loc="/insert/commodity/board.do";
		}
		request.setAttribute("msg", msg);
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
