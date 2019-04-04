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
	
	// 북마크 추가
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
	
	// 북마크리스트 전체 출력
	public ArrayList<News> selectAllBM(String loginId){
		ArrayList<News> allBM = new ArrayList<News>();
		
		CrawlingMapper mapper = sqlSession.getMapper(CrawlingMapper.class);
		
		try {
			allBM = mapper.selectAllBM(loginId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return allBM;
	}
	
	// 북마크 삭제
	public int deleteBM(String bmSeq) {
		int result = 0;
		
		CrawlingMapper mapper = sqlSession.getMapper(CrawlingMapper.class);
		
		try {
			result = mapper.deleteBM(bmSeq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러 발생");
			return 0;
		}
		
		return result;
	}
	
	// Scrap.jsp에서 기사 원문보러가기
	public News selectLink(String bmSeq) {
		News news = new News();
		
		CrawlingMapper mapper = sqlSession.getMapper(CrawlingMapper.class);
		
		try {
			news = mapper.selectLink(bmSeq);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return news;
	}
}
