package com.my.map.Dao;

import java.util.ArrayList;

import com.my.map.vo.News;

public interface CrawlingMapper {

	// BookMark 삽입
	public int insertBM(News news);
	// BookMarkList 출력
	public ArrayList<News> selectAllBM(String loginId);
	// BookMark 삭제
	public int deleteBM(String bmSeq);
	// Scrap.jsp에서 기사 원문보기
	public News selectLink(String bmSeq);
	// Scrap.jsp에서 제목으로 북마크 검색
	public ArrayList<News> searchArticle(News news);
	
}
