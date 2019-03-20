package com.my.map.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MindMapController {
	
	//마인드맵 페이지 이동
	@RequestMapping(value="/goMindmap", method=RequestMethod.GET)
	public String goMindmap() {
		return "mindMap";
	}
		
}
