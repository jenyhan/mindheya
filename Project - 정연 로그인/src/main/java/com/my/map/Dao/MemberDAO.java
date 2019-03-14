package com.my.map.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.map.vo.Member;

@Repository
public class MemberDAO{
	
	@Autowired
	SqlSession session;
	//회원가입
	public int join(Member member) {
		int result=0;
		
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		try {
			result=mapper.join(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return result;
		}
		return result;
	}
	//회원 로그인
	public Member login(Member member) {
		Member result=null;
		
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		try {
			result=mapper.login(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return result;
		}
		return result;
	
		}
	}
