package com.my.map.Dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO{
	
	@Autowired
	SqlSession session;
	
	public int join(HashMap<String, String> member) {
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
	public String login(HashMap<String, String> member) {
		String result=null;
		
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
