package com.bus.model.service.admin;

import static com.bus.common.SqlSessionTemplate.getSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bus.model.dao.admin.MemberResetPasswordDao;
import com.bus.model.dto.admin.MemberResetPassword;
import com.bus.model.dto.member.Member;

public class MemberResetPasswordService {
	
	private MemberResetPasswordDao dao = new MemberResetPasswordDao();
	
	public List<MemberResetPassword> selectMemberResetPasswordList(){
		SqlSession session = getSession();
		List<MemberResetPassword> result = dao.selectMemberResetPasswordList(session);
		session.close();
		return result;
	}
	
	public int resetPassword(Member m) {
		SqlSession session = getSession();
		int result = dao.resetPassword(session, m);
		session.close();
		return result;
	}

}
