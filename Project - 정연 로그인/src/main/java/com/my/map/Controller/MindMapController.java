package com.my.map.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.map.vo.MindMap;

@Controller
public class MindMapController {
	
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
		
}
