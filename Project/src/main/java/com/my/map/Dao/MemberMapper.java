package com.my.map.Dao;

import java.util.HashMap;

public interface MemberMapper {
	
	public int join(HashMap<String, String> member);
	public String login(HashMap<String, String> member);
}
