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
		
		String path=getServletContext().getRealPath("/resources/upload/commodityBoard");
		System.out.println(path);
		MultipartRequest mr=new MultipartRequest(
					request,
					path,
					1024*1024*100,
					"utf-8",
					new DefaultFileRenamePolicy()
				);
		
		String boardTitle=mr.getParameter("boardTitle");
		String boardWriter=mr.getParameter("boardWriter");
		String boardContent=mr.getParameter("boardContent");
		
		String originalFileName=mr.getOriginalFileName("upfile");
		String renamedFileName=mr.getFilesystemName("upfile");
		
		CommodityBoard b = CommodityBoard.builder().boaCode(renamedFileName).boaComName(renamedFileName).boaComPrice(0).boaContent(boardContent).boaFilePath(path)
		.boaTitle(boardTitle).build();
		
		int result = new CommodityBoardService().insertCommodityBoard(b);
		
		String msg,loc;
		if(result>0) {
			msg="게시글 등록성공!";
			// 카테고리를 사용 하여 분기 처리
			loc="/insert/commodity/board.do";
		}else {
			msg="게시글 등록실패!";
			loc="/insert/commodity/board.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher(getServletContext().getInitParameter("viewpath")+"/common/msg.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
