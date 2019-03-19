package com.my.map.Controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.map.Dao.MemberDAO;
import com.my.map.vo.Member;

@Controller
public class MemberController {
	@Autowired
	MemberDAO dao;
	
	//재원씨 컴퓨터 푸시 확인. 17:50
	//정연씨 컴퓨터 푸시 확인. 18:01
	
	//회원가입 폼 이동
	@RequestMapping(value="/goJoin", method=RequestMethod.GET)
	public String goJoin() {
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
		
		System.out.println(member);
		
		int result = dao.join(member);
		System.out.println(result);
		if(result==0) {
			model.addAttribute("warning", "ID와 비밀번호를 확인해주세요.");
			model.addAttribute("member", member);
			
			return "JoinForm";
		}
		return "home";
	}
	
	//로그인폼 이동//
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	//로그인폼 액션
	@RequestMapping(value="/login-form", method=RequestMethod.GET)
	public String loginMember(Member member, HttpSession session, Model model) {
		Member result = null;
		result=dao.login(member);
		if(result==null) {
			model.addAttribute("warning", "ID와 비밀번호를 확인해주세요.");
			model.addAttribute("member", member);
			return "login";
		}

		session.setAttribute("loginId", member.getId());
		
		return "mindMap";
	}
}