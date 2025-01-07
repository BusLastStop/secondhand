package com.bus.model.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bus.model.dto.admin.MemberReport;

public class MemberReportDao {
	
	public List<MemberReport> selectMemberReportList(SqlSession session){
		return session.selectList("admin.selectMemberReportList");
	}

}
