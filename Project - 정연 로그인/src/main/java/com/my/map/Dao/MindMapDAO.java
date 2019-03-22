package com.my.map.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.map.vo.Member;

@Repository
public class MindMapDAO{
	
	@Autowired
	SqlSession session;
	
	public Member selectShare(String id) {
		Member result = null;
		
		MindMapMapper mapper = session.getMapper(MindMapMapper.class);
		
		try {
			result = mapper.selectShare(id);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
}