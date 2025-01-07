package com.bus.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.bus.model.dto.CommodityBoard;

public class CommodityBoardDao {
	
	public int insertBoard(SqlSession session,CommodityBoard b) {
		return session.insert("commodityBoard.insertCommodityBoard",b);
	}

}
