package com.bus.model.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bus.model.dto.admin.CommodityBoardReport;

public class CommodityBoardReportDao {
	
	public List<CommodityBoardReport> selectCommodityBoardReportList(SqlSession session){
		return session.selectList("admin.selectCommodityBoardReportList");
	}
	
	public CommodityBoardReport selectCommodiryBoardreportView(SqlSession session, String boaCode) {
		return session.selectOne("admin.selectCommodiryBoardreportView",boaCode);
	}

}
