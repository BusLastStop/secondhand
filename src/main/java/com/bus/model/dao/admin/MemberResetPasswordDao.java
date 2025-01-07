package com.bus.model.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bus.model.dto.admin.MemberResetPassword;

public class MemberResetPasswordDao {
	
	public List<MemberResetPassword> selectMemberResetPasswordList(SqlSession session){
		return session.selectList("admin.selectMemberResetList");
	}

}
