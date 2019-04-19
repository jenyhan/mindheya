package com.my.map.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.map.Dao.MemberDAO;
import com.my.map.vo.Member;

@Controller
public class MemberController {
	@Autowired
	MemberDAO dao;
	
	//회원가입 폼 이동
	@RequestMapping(value="/goJoin", method=RequestMethod.GET)
	public String goJoin(int tabNum, Model model) {
		System.out.println(tabNum);
		model.addAttribute("tabNum", tabNum);
		return "JoinForm";
	}
	
	//로그아웃 액션
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
	//회원가입 액션
	@RequestMapping(value="register-form", method=RequestMethod.POST)
	public String join(Member member, Model model) {		
		int result = dao.join(member);

		if(result==0) {
			model.addAttribute("warning", "중복된 ID가 있습니다.");
			model.addAttribute("member", member);
			return "JoinForm";
		}
		return "home";
	}
	
	//로그인폼 이동//
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(int tabNum, Model model) {

		model.addAttribute("tabNum", tabNum);		

		return "login";
	}
	
	//로그인폼 액션
	@RequestMapping(value="/login-form", method=RequestMethod.POST)
	public String loginMember(Member member, HttpSession session, Model model, int tabNum) {
		Member result = null;
		result=dao.login(member);
		if(result==null) {
			model.addAttribute("warning", "ID와 비밀번호를 확인해주세요.");
			model.addAttribute("member", member);
			return "login";
		}

		session.setAttribute("loginId", member.getId());
		
		if(tabNum==1) {
			
			return "selectMind";
			
		} else if(tabNum==2) {
			
			return "Scrap";
		} else if(tabNum==3) {
			
			return "shareBoard";
			
		} else {
			
			return "home";
		}
		
	}

	//홈으로 이동
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value="checkEmail", method=RequestMethod.GET)
	public @ResponseBody String checkEmail(String email, Model model) {

		String result = dao.checkEmail(email);
		
		if(result==null) {
			return "ok";
		} else {
			return "registered";
		}
		
	}
}