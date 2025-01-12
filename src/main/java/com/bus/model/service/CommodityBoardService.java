package com.bus.model.service;

import org.apache.ibatis.session.SqlSession;

import com.bus.model.dao.CommodityBoardDao;
import com.bus.model.dto.CommodityBoard;

import static com.bus.common.SqlSessionTemplate.getSession;

import java.util.List;

public class CommodityBoardService {
	
	private CommodityBoardDao dao = new CommodityBoardDao();
	
	public List<CommodityBoard> selectCommodityBoard(){
		SqlSession session = getSession();
		List<CommodityBoard> result = dao.selectCommodityBoard(session);
		session.close();
		return result;
	}
	
	public int insertCommodityBoard(CommodityBoard b) {
		SqlSession session = getSession();
		int result=dao.insertCommodityBoard(session,b);
		
		if(result>0) session.commit();
		else session.rollback();
		
		session.close();
		return result;
	}

}
