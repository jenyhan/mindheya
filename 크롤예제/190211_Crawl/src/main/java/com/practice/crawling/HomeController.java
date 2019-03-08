package com.practice.crawling;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	/*
	 * private static String URL = "http://www.jobkorea.co.kr/Search/?stext=";
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "home";
	}

	//////////////////////////////////// 여기부터는 크롤링

	@RequestMapping(value = "/selectNews")
	public String selectNews(String key_word, int page, Model model) throws Exception {

		String url = "http://www.jobkorea.co.kr/Search/?";

		String params = "&IsCoInfoSC=false" + "&IsRecruit=false" + "&ord=1" + "&Order=1" + "&page=" + page + ""
				+ "&stext=" + key_word + "" + "&pageSize=30" + "&pageType=GI";

//		1.Document를 가져온다
		Document doc = Jsoup.connect(url + params).get();

		String tag = "#smGiList .list .detailList li .corpName .giTitle";
//		2. 목록을 가져온다.
		Elements element = doc.select(tag);
		System.out.println(element);
//		3. 목록(배열)에서 정보를 가져온다.
		int index = 0;
		ArrayList<String> result = new ArrayList<String>();
		for (Element ele : element) {
			result.add(++index + " :: " + ele.text());
		}

		model.addAttribute("result", result);
		return "home";
	}

	@RequestMapping(value = "/selectNews2")
	public @ResponseBody ArrayList<String> selectNews2(String key_word, int page, Model model) throws Exception {

		String url = "http://www.jobkorea.co.kr/Search/?";

		String params = "&IsCoInfoSC=false" + "&IsRecruit=false" + "&ord=1" + "&Order=1" + "&page=" + page + ""
				+ "&stext=" + key_word + "" + "&pageSize=30" + "&pageType=GI";

//		1.Document를 가져온다
		Document doc = Jsoup.connect(url + params).get();

		String tag = "#smGiList .list .detailList li .corpName .giTitle";
//		2. 목록을 가져온다.
		Elements element = doc.select(tag);
		System.out.println(element);
//		3. 목록(배열)에서 정보를 가져온다.
		int index = 0;
		ArrayList<String> result = new ArrayList<String>();
		for (Element ele : element) {
			result.add(++index + " :: " + ele.text());
		}

		return result;
	}

///////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "/selectNaver", method = RequestMethod.GET)
	public @ResponseBody ArrayList<String> selectNaver() {

		//Document 정보를 가져오는 객체
		Document doc = null;

		try {

			//Jsoup의 connect를 통해 사이트의 html 정보를 가져온다.
			doc = Jsoup.connect("http://www.naver.com/").get();

		} catch (Exception e) {

			e.printStackTrace();
		}

		//ElementById처럼. select문을 통해 해당 태그를 id 정보를 가지고 찾아온다.
		Elements elements = doc.select(".ah_roll_area.PM_CL_realtimeKeyword_rolling .ah_l .ah_item .ah_a .ah_k");
		// realrank는 ol의 id

		
		//몇개인지 확인하려고 그냥 만듬
		int index = 0;
		
		//가져온 elements에 담기는 정보들을 ArrayList에 담기 위해 생성
		ArrayList<String> result = new ArrayList<String>();

		//forEach로 각각의 element의 text를 배열에 저장
		for (Element e : elements) {

			System.out.println(++index);
			System.out.println(e.text());
			result.add(e.text());
		}

		//저장된 배열을 리턴
		return result;
	}
}
