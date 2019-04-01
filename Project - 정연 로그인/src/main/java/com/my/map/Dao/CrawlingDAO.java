package com.my.map.Dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.map.vo.News;

@Repository
public class CrawlingDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertBM(News news) {
		int result = 0;
		
		CrawlingMapper mapper = sqlSession.getMapper(CrawlingMapper.class);
		
		try {
			result = mapper.insertBM(news);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
	}
	
	public ArrayList<News> selectAllBM(){
		ArrayList<News> allBM = new ArrayList<News>();
		
		CrawlingMapper mapper = sqlSession.getMapper(CrawlingMapper.class);
		
		try {
			allBM = mapper.selectAllBM();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return allBM;
	}
	
}
