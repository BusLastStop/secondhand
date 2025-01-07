package com.bus.model.service.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bus.model.dao.admin.MemberReportDao;
import com.bus.model.dto.admin.MemberReport;

import static com.bus.common.SqlSessionTemplate.getSession;

public class MemberReportService {
	
	private MemberReportDao dao = new MemberReportDao();
	
	public List<MemberReport> selectMemberReportList(){
		SqlSession session = getSession();
		List<MemberReport> result = dao.selectMemberReportList(session);
		session.close();
		return result;
	}

}
