package com.my.map.Dao;

import java.util.ArrayList;

import com.my.map.vo.News;

public interface CrawlingMapper {

	// BookMark 삽입
	public int insertBM(News news);
	// BookMarkList 출력
	public ArrayList<News> selectAllBM(String loginId);
}
