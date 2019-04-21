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
	
		
	@RequestMapping(value = "/selectContentKr", method = RequestMethod.GET)
	public @ResponseBody ArrayList<News> selectContentKr(String title) {
		
		//Document 정보를 가져오는 객체
		Document doc = null;
		String encTitle="";
		    // 전송 문자 UTF-8 인코딩
		    try {
				encTitle = URLEncoder.encode(title, "UTF-8") ;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}

		    String url1 = "https://news.google.com/search?q=";
		    String url2 = "&hl=ko&gl=KR&ceid=KR%3Ako";
		    String myUrl = url1 + encTitle + url2;
		    
		    ArrayList<News> newsList = new ArrayList<News>();
		
		try {
			
			doc = Jsoup.connect(myUrl).get();
			
			// article 태그 바로 위 div를 가져와야 a tag를 인식한다
			
//			사진이 있는 기사는 nID9nc가 붙음
//			Elements selectBody = doc.select(".NiLAwe.y6IFtc.R7GTQ.keNKEd.j7vNaf.nID9nc");
//			figure class ="AZtY5d fvuwob  d7hoq"  
			
//			element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne");
			Elements selectBody = doc.select(".NiLAwe.y6IFtc.R7GTQ.keNKEd.j7vNaf.nID9nc"); 
			
//			article 밑 a 태그 제대로 가져옴
//			System.out.println(selectBody.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne"));
			
			for (Element element : selectBody) {
				
//				이미지 src 하나씩 잘 가져옴   .select(".NiLAwe.y6IFtc.R7GTQ.keNKEd.j7vNaf.nID9nc"); 일때
//				System.out.println(element.select(".AZtY5d.fvuwob.d7hoq").select("> img_src").attr("src"));
				
				News news = new News();
				
//				.MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne
//				이건 원래 쓰던 태그주소  article로 바로 a태그에 접근하던 것
				
				String address = element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne").select("> a").attr("href");
				
				// 주소 맨 앞에 오는 . 제거
				address = address.substring(1);
				
				// 0404 -   4월3일까지 제목은 h4태그안에 있었는데 4월4일에 h3로 바뀜 ..  구글이 바꾼거겟지?
				// 반드시 TEST 할 것!!!!!!@!@!@!@!@!@!@ 
				// 발표날 아침까지 확인해봐야 할 곳 !!!!!!!!!!!!!!!!!!!!!!!!!
				
				String newsTitle = element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne").select("> h3").text();
				String summary = element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne").select("> p").text();
				String press = element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne").select(".xxIStf.AVN2gc.pNs0Jf").text();
				String img_src = element.select(".AZtY5d.fvuwob.d7hoq").select("> img").attr("src");
				
				news.setTitle(newsTitle);
				news.setSummary(summary);
				news.setPress(press);
				news.setAddress(address);
				news.setImg_src(img_src);
				
				newsList.add(news);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
	}
		return newsList;
	}
	
	
	@RequestMapping(value = "/selectContentEn", method = RequestMethod.GET)
	public @ResponseBody ArrayList<News> selectContentEn(String title) {
		
		//Document 정보를 가져오는 객체
		Document doc = null;
		String encTitle="";
		    // 전송 문자 UTF-8 인코딩
		    try {
				encTitle = URLEncoder.encode(title, "UTF-8") ;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}

		    String url1 = "https://news.google.com/search?q=";
		    String url2 = "&hl=en-US&gl=US&ceid=US%3Aen";
		    String myUrl = url1 + encTitle + url2;
		    ArrayList<News> newsList = new ArrayList<News>();
		
		try {
			
			doc = Jsoup.connect(myUrl).get();
			
			Elements selectBody = doc.select(".NiLAwe.y6IFtc.R7GTQ.keNKEd.j7vNaf.nID9nc"); 
			
			for (Element element : selectBody) {
				
				News news = new News();
				
				String address = element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne").select("> a").attr("href");
				
				// 주소 맨 앞에 오는 . 제거
				address = address.substring(1);
				
				// 0404 -   4월3일까지 제목은 h4태그안에 있었는데 4월4일에 h3로 바뀜 ..  구글이 바꾼거겟지?
				// 반드시 TEST 할 것!!!!!!@!@!@!@!@!@!@ 
				// 발표날 아침까지 확인해봐야 할 곳 !!!!!!!!!!!!!!!!!!!!!!!!!
				String newsTitle = element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne").select("> h3").text();
				String summary = element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne").select("> p").text();
				String press = element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne").select(".xxIStf.AVN2gc.pNs0Jf").text();
				String img_src = element.select(".AZtY5d.fvuwob.d7hoq").select("> img").attr("src");
				
				news.setTitle(newsTitle);
				news.setSummary(summary);
				news.setPress(press);
				news.setAddress(address);
				news.setImg_src(img_src);
				
				newsList.add(news);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
	}
		
		return newsList;
	}
	
	
	@RequestMapping(value = "/selectContentJp", method = RequestMethod.GET)
	public @ResponseBody ArrayList<News> selectContentJp(String title) {
		
		//Document 정보를 가져오는 객체
		Document doc = null;
		String encTitle="";
		    // 전송 문자 UTF-8 인코딩
		    try {
				encTitle = URLEncoder.encode(title, "UTF-8") ;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}

		    String url1 = "https://news.google.com/search?q=";
		    String url2 = "&hl=ja&gl=JP&ceid=JP:ja";
		    String myUrl = url1 + encTitle + url2;

		    ArrayList<News> newsList = new ArrayList<News>();
		
		try {
			
			doc = Jsoup.connect(myUrl).get();
			
			Elements selectBody = doc.select(".NiLAwe.y6IFtc.R7GTQ.keNKEd.j7vNaf.nID9nc"); 
			
			for (Element element : selectBody) {
				
				News news = new News();
				
				String address = element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne").select("> a").attr("href");
				
				// 주소 맨 앞에 오는 . 제거
				address = address.substring(1);
				
				// 0404 -   4월3일까지 제목은 h4태그안에 있었는데 4월4일에 h3로 바뀜 ..  구글이 바꾼거겟지?
				// 반드시 TEST 할 것!!!!!!@!@!@!@!@!@!@ 
				// 발표날 아침까지 확인해봐야 할 곳 !!!!!!!!!!!!!!!!!!!!!!!!!
				String newsTitle = element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne").select("> h3").text();
				String summary = element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne").select("> p").text();
				String press = element.select(".MQsxIb.xTewfe.R7GTQ.keNKEd.j7vNaf.Cc0Z5d.EjqUne").select(".xxIStf.AVN2gc.pNs0Jf").text();
				String img_src = element.select(".AZtY5d.fvuwob.d7hoq").select("> img").attr("src");
				
				news.setTitle(newsTitle);
				news.setSummary(summary);
				news.setPress(press);
				news.setAddress(address);
				news.setImg_src(img_src);
				
				newsList.add(news);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
	}
		
		return newsList;
	}
	
	@RequestMapping(value = "/insertBM", method = RequestMethod.POST)
	public @ResponseBody int insertBM(News news, HttpSession session) {
		int result = 0;
		
		String loginId = (String) session.getAttribute("loginId");
		news.setId(loginId);
		
		result = dao.insertBM(news);
		
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
