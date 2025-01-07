package com.bus.model.dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bus.model.dto.member.Member;
import com.bus.model.dto.member.MemberCart;
import com.bus.model.dto.member.MemberDownloadHistory;
import com.bus.model.dto.member.MemberProduct;

public class MemberDao {
	
	public Member searchMemberInfo(SqlSession session, String memId) {
		return session.selectOne("member.searchMemberId", memId);
	}
	
	public List<MemberProduct> searchMemberProduct(SqlSession session, String memId){
		return session.selectList("member.searchMemberProduct", memId);
	}
	
	public List<MemberDownloadHistory> searchMemberDowloadHistory(SqlSession session, String memId){
		return session.selectList("member.searchMemberDowloadHistory", memId);
	}
	
	public List<MemberCart> searchMemberCart(SqlSession session, String memId){
		return session.selectList("member.searchMemberCart", memId);
	}
	
	public int insertMember(SqlSession session, Member m) throws RuntimeException{
		return session.insert("member.insertMember", m);
	}

}
