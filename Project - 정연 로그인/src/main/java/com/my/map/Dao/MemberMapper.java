package com.my.map.Dao;

import com.my.map.vo.Member;

public interface MemberMapper {
	
	public int join(Member member);
	public Member login(Member member);
	public String checkEmail(String email);
}
