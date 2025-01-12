package com.bus.model.service.member;

import static com.bus.common.SqlSessionTemplate.getSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bus.model.dao.member.MemberDao;
import com.bus.model.dto.member.Member;
import com.bus.model.dto.member.MemberCart;
import com.bus.model.dto.member.MemberDownloadHistory;
import com.bus.model.dto.member.MemberProduct;

public class MemberService {
	
	private MemberDao dao= new MemberDao();
	
	public Member memberIdCheck(String memId) {
		SqlSession session = getSession();
		Member result = dao.memberIdCheck(session, memId);
		session.close();
		return result;
	}
	
	public int insertMember(Member m) throws RuntimeException{
		SqlSession session = getSession();
		int result = dao.insertMember(session, m);
		if(result>0) session.commit();
		else session.rollback();
		session.close();
		return result;
	}
	
	public Member searchMemberInfo(String memId) {
		SqlSession session = getSession();
		Member result = dao.searchMemberInfo(session,memId);
		session.close();
		return result;
	}
	
	public int updateMember(Member m) throws RuntimeException{
		SqlSession session = getSession();
		int result = dao.updateMember(session,m);
		if(result>0) session.commit();
		else session.rollback();
		return result;
	}
	
	public int deleteMember(String memId) {
		SqlSession session = getSession();
		int result = dao.deleteMember(session, memId);
		if(result>0) session.commit();
		else session.rollback();
		return result;
	}
	
	public List<MemberProduct> searchMemberProduct(String memId){
		SqlSession session = getSession();
		List<MemberProduct> result = dao.searchMemberProduct(session, memId);
		session.close();
		return result;
	}
	
	public List<MemberDownloadHistory> searchMemberDowloadHistory(String memId){
		SqlSession session = getSession();
		List<MemberDownloadHistory> result = dao.searchMemberDowloadHistory(session,memId);
		session.close();
		return result;
	}
	
	public List<MemberCart> searchMemberCart(String memId){
		SqlSession session = getSession();
		List<MemberCart> result = dao.searchMemberCart(session, memId);
		session.close();
		return result;
	}

}
