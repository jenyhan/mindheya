package com.my.map.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.map.Dao.MemberDAO;

@Controller
public class MemberController {
	@Autowired
	MemberDAO dao;
	
	@RequestMapping(value="/goJoin", method=RequestMethod.GET)
	public String goJoin() {
		return "join";
	}
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(String id, String pw) {
		HashMap<String, String> member = new HashMap<String, String>();
		member.put("id", id);
		member.put("pw", pw);
		
		int result=dao.join(member);
		if(result==0) {
			return "redirect:/goJoin";
		}
		return "redirect:/";
	}
}
