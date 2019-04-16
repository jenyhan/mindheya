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
//			https://news.google.com/search?q=    %EC%98%81%ED%99%94    &hl=ko&gl=KR&ceid=KR%3Ako
		    ArrayList<News> newsList = new ArrayList<News>();
		
		try {
			
			doc = Jsoup.connect(myUrl).get();
			
			// Body 가져옴
			// article 태그 바로 위 div를 가져와야 a tag를 인식한다
			Elements selectBody = doc.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne");
//											   NiLAwe y6IFtc R7GTQ keNKEd j7vNaf nID9nc
			// selectBody여긴 문제 없음
			
			for (Element element : selectBody) {
				
				News news = new News();
				
				// 여긴 잘들어옴
				// System.out.println("element : "+element);
				
				
				String address = element.select("> a").attr("href");
				// 주소 맨 앞에 오는 . 제거
				
				address = address.substring(1);
				
				// 0404 -   4월3일까지 제목은 h4태그안에 있었는데 4월4일에 h3로 바뀜 ..  구글이 바꾼거겟지?
				// 반드시 TEST 할 것!!!!!!@!@!@!@!@!@!@ 
				// 발표날 아침까지 확인해봐야 할 곳 !!!!!!!!!!!!!!!!!!!!!!!!!
				String newsTitle = element.select("> h3").text();
				String summary = element.select("> p").text();
				String press = element.select(".xxIStf.AVN2gc.pNs0Jf").text();
				
				news.setTitle(newsTitle);
				news.setSummary(summary);
				news.setPress(press);
				news.setAddress(address);
				
				newsList.add(news);
			}
			
			/*for (int i = 0; i < newsList.size(); i++) {
				System.out.println((i+1) + "번째 뉴스 제목 : " + newsList.get(i).getTitle());
			}*/
			
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
		int result = 0;
		
		String loginId = (String) session.getAttribute("loginId");
		news.setId(loginId);
	
		result = dao.insertBM(news);
		
		// 여긴 return값을 원하는 걸로 바꿔서 보내는 걸루
		
		return result;
	}
	
	@RequestMapping(value="/goScrap", method=RequestMethod.GET)
	public String goScrap() {
		
		return "Scrap";
	}
	
	
	@RequestMapping(value = "/selectAllBM", method = RequestMethod.GET)
	public @ResponseBody ArrayList<News> selectAllBM(HttpSession session) {
		ArrayList<News> bmList = new ArrayList<News>();
		
		String loginId = (String) session.getAttribute("loginId");
		
		bmList = dao.selectAllBM(loginId);

//		제대로 bmList 값 들어오고 보내짐
		
		return bmList;
	}
	
	@RequestMapping(value = "/deleteBM", method = RequestMethod.POST)
	public @ResponseBody int deleteBM(String bmSeq) {
		int result;
		
		result = dao.deleteBM(bmSeq);
		
		return result;
	}
	
	@RequestMapping(value = "/selectLink", method = RequestMethod.GET)
	public @ResponseBody String selectLink(String bmSeq) {
		News returnNews;
		
		returnNews = dao.selectLink(bmSeq);
		
		String result = returnNews.getAddress();
		
		return result;
	}
	
	@RequestMapping(value = "/searchArticle", method = RequestMethod.GET)
	public @ResponseBody ArrayList<News> searchArticle(News news, HttpSession session) {
		
		ArrayList<News> bmList = new ArrayList<News>();
		
		String loginId = (String)session.getAttribute("loginId");
		
		news.setId(loginId);
		
		bmList = dao.searchArticle(news);
		
		return bmList;
	}
	
	
		
}
