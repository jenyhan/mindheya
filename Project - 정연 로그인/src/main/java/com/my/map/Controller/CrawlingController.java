package com.my.map.Controller;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;
import com.my.map.vo.News;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CrawlingController {
	
		
	@RequestMapping(value = "/selectContent", method = RequestMethod.GET)
	public @ResponseBody ArrayList<News> selectContent(String title) {

		//여기 주석은 무시
		//JSON 보낼 때 UTF-8로 변환
		//produces = "application/text; charset=UTF-8"

		System.out.println(title);
		
		//Document 정보를 가져오는 객체
		Document doc = null;

		JsonObject gsonResult = new JsonObject();
		
		String myUrl = "https://news.naver.com/main/mainNews.nhn?sid1=300&firstLoad=Y";
		
		ArrayList<News> newsList = new ArrayList<News>();
		
		
		try {
			
			//GSON 사용한 json parser
			//정상적인 url이 아니므로 ignoreContentType으로 타입을 무시하고 내용물(html ? json?)을 가져온다
			doc = Jsoup.connect(myUrl).ignoreContentType(true).get();
			
			//Body 가져옴
			Element selectBody = doc.body();
			
			//GSON parser
			JsonParser parser = new JsonParser();

			// JSON순서
			// 1. parse해온 객체를 JsonObject화 한다.
			// 2. JsonObject화 한 객체에서 원하는 key값을 입력해서 JsonElement타입에 저장
			// 3. Element화 한 객체를 JsonPrimitive화해서 JsonPrimitive에 저장
			// 4. JsonPrimitive객체에 .getAsString()를 사용해서 parse 후  다시  JsonObject화
			
			
			//1. parse -> JsonObject
			//2. JsonObject -> JsonElement	
			//3. JsonElement -> JsonPrimitive(캐스팅화)
			

			JsonObject json = (JsonObject) parser.parse(selectBody.text());
			JsonElement json2 = json.get("airsResult");
			JsonPrimitive jp = (JsonPrimitive) json2;

			
			JsonObject json3 = (JsonObject) parser.parse(jp.getAsString());
			JsonObject json4 = (JsonObject) json3.get("result");
						
			//4. JsonArray
			JsonArray newsResources;
			
			newsResources = (JsonArray) json4.get("100");		 			
			newsList = keyWordCheck(newsList, newsResources, title);
			
			newsResources = (JsonArray) json4.get("101");		 			
			newsList = keyWordCheck(newsList, newsResources, title);

			newsResources = (JsonArray) json4.get("102");		 			
			newsList = keyWordCheck(newsList, newsResources, title);
			
			newsResources = (JsonArray) json4.get("103");		 			
			newsList = keyWordCheck(newsList, newsResources, title);
			
			newsResources = (JsonArray) json4.get("104");		 			
			newsList = keyWordCheck(newsList, newsResources, title);
			
			newsResources = (JsonArray) json4.get("105");		 			
			newsList = keyWordCheck(newsList, newsResources, title);

			
			for (int i = 0; i < newsList.size(); i++) {
				System.out.println(i + "번째 뉴스 제목 : " + newsList.get(i).getTitle());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
	}
		
		return newsList;
	}
	
	
	public ArrayList<News> keyWordCheck(ArrayList<News> newsList, JsonArray newsJSONArray, String keyWord) {

		System.out.println("으아아");
		Gson gson = new Gson();
		News news;

		for (int i = 0; i < newsJSONArray.size(); i++) {
			JsonObject returnNews = (JsonObject) newsJSONArray.get(i);
			news = gson.fromJson(returnNews, News.class);

			if(news.getSummary().contains(keyWord)) {
				newsList.add(news);					
			};
		}
		
		return newsList;
	}	
	
	@RequestMapping(value="/goScrap", method=RequestMethod.GET)
	public String goScrap() {
		
		
		
		return "Scrap";
	}
	
}
