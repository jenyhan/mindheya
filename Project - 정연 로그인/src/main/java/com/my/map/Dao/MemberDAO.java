package com.my.map.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.map.vo.Member;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession session;

	// ȸ������
	public int join(Member member) {
		int result = 0;

		MemberMapper mapper = session.getMapper(MemberMapper.class);

		try {
			result = mapper.join(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return result;
		}
		return result;
	}

	// ȸ�� �α���
	public Member login(Member member) {
		Member result = null;

		MemberMapper mapper = session.getMapper(MemberMapper.class);

		try {
			result = mapper.login(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return result;
		}
		return result;

	}
	
	public String checkEmail(String email) {

		String result = null;
		
		MemberMapper mapper = session.getMapper(MemberMapper.class);

		try {
			result = mapper.checkEmail(email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return result;
		}
		return result;
							
	}
	
}
