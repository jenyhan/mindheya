package com.my.map.Controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.my.map.Dao.CrawlingDAO;
import com.my.map.vo.News;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CrawlingController {
	
	@Autowired
	CrawlingDAO dao;
	
		
	@RequestMapping(value = "/selectContent", method = RequestMethod.GET)
	public @ResponseBody ArrayList<News> selectContent(String title) {

		//여기 주석은 무시
		//JSON 보낼 때 UTF-8로 변환
		//produces = "application/text; charset=UTF-8"

		System.out.println(title);
		
		//Document 정보를 가져오는 객체
		Document doc = null;
		String encTitle="";
		    // 전송 문자 UTF-8 인코딩
		    try {
				encTitle = URLEncoder.encode(title, "UTF-8") ;
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

		    String url1 = "https://news.google.com/search?q=";
		    String url2 = "&hl=ko&gl=KR&ceid=KR%3Ako";
		    String myUrl = url1 + encTitle + url2;
//						https://news.google.com/search?q=    %EC%98%81%ED%99%94    &hl=ko&gl=KR&ceid=KR%3Ako
		    ArrayList<News> newsList = new ArrayList<News>();
		
		try {
			
			doc = Jsoup.connect(myUrl).get();
			
			// Body 가져옴
//			Elements selectBody = doc.select(".T4LgNb .FVeGwb.CVnAc .ajwQHc.BL5WZb.RELBvb .tsldL.Oc0wGc.RELBvb .HKt8rc.CGNRMc .FffXzd .lBwEZb.BL5WZb.xP6mwf .NiLAwe.y6IFtc.R7GTQ.keNKEd.j7vNaf.nID9nc");
			Elements selectBody = doc.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne");
//							.NiLAwe.y6IFtc.R7GTQ.keNKEd.j7vNaf.nID9nc 
//			 										   MQsxIb xTewfe tXImLc R7GTQ keNKEd keNKEd  dIehj EjqUne
//												       NiLAwe y6IFtc R7GTQ keNKEd j7vNaf nID9nc
			
			for (Element element : selectBody) {
				News news = new News();
				
				String address = element.select("> a").attr("href");
				// 주소 맨 앞에 오는 . 제거
				address = address.substring(1);
				
				String newsTitle = element.select("> h4").text();
				String summary = element.select("> p").text();
				String press = element.select(".xxIStf.AVN2gc.pNs0Jf").text();
				

				System.out.println("address : " + address);
				System.out.println("newsTitle : " + newsTitle);
				System.out.println("summary : " + summary);
				System.out.println("press : " + press);
				System.out.println("---------------------------------------------");
				
				news.setTitle(newsTitle);
				news.setSummary(summary);
				news.setPress(press);
				news.setAddress(address);
				
				newsList.add(news);
			}
			
			for (int i = 0; i < newsList.size(); i++) {
				System.out.println((i+1) + "번째 뉴스 제목 : " + newsList.get(i).getTitle());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
	}
		
		return newsList;
	}
	
	
	/*public ArrayList<News> keyWordCheck(ArrayList<News> newsList, JsonArray newsJSONArray, String keyWord) {

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
	}	*/
	
	@RequestMapping(value = "/insertBM", method = RequestMethod.POST)
	public @ResponseBody int insertBM(News news, HttpSession session) {
		String sessionId = (String) session.getAttribute("loginId");
		news.setId(sessionId);
		
		dao.insertBM(news);
		
		return 0;
	}
	
	@RequestMapping(value="/goScrap", method=RequestMethod.GET)
	public String goScrap() {
		
		
		
		return "Scrap";
	}
		
}
