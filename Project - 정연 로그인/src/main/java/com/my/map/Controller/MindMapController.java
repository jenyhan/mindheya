package com.my.map.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.map.Dao.MindMapDAO;
import com.my.map.vo.Member;
import com.my.map.vo.MindMap;

@Controller
public class MindMapController {

	@Autowired
	MindMapDAO dao;
	
	//마인드맵 페이지 이동
	@RequestMapping(value="/goMindmap", method=RequestMethod.GET)
	public String goMindmap() {
		return "selectMind";
	}

	@RequestMapping(value="/goMap", method=RequestMethod.GET)
	public String goMap(MindMap mind, Model model) {
		model.addAttribute("mindMap", mind);
		return "mindMap";
	}
	
	@RequestMapping(value="/selectShare", method=RequestMethod.GET)
	public @ResponseBody String selectShare(String shareId) {

		Member result = dao.selectShare(shareId);
		
		if(result == null) {
			return "fail";
		} else {
			return "success";
		}
		
	}
	
	

	@RequestMapping(value="/goShare", method=RequestMethod.GET)
	public String goShare() {
		return "shareBoard";
	}
}