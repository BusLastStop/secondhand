package com.bus.model.service.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bus.model.dao.admin.CommodityBoardReportDao;
import com.bus.model.dto.admin.CommodityBoardReport;

import static com.bus.common.SqlSessionTemplate.getSession;

public class CommodityBoardReportService {
	
	private CommodityBoardReportDao dao = new CommodityBoardReportDao();
	
	public List<CommodityBoardReport> selectCommodiryBoardReportList(){
		SqlSession session = getSession();
		List<CommodityBoardReport> result = dao.selectCommodityBoardReportList(session);
		session.close();
		return result;
	}
	
	public CommodityBoardReport selectCommodiryBoardreportView(String boaCode) {
		SqlSession session = getSession();
		CommodityBoardReport result = dao.selectCommodiryBoardreportView(session, boaCode);
		session.close();
		return result;
	}

}
