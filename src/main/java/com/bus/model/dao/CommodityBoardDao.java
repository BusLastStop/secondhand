package com.bus.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bus.model.dto.CommodityBoard;

public class CommodityBoardDao {
	
	public List<CommodityBoard> selectCommodityBoard(SqlSession session) {
		return session.selectList("commodityBoard.selectCommodityBoard");
	}
	
	public int insertCommodityBoard(SqlSession session,CommodityBoard b) {
		return session.insert("commodityBoard.insertCommodityBoard",b);
	}

}
