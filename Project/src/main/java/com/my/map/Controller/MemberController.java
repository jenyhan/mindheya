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
	
	//ȸ������ �� �̵�
	@RequestMapping(value="/goJoin", method=RequestMethod.GET)
	public String goJoin() {
		return "JoinForm";
	}
	
	//�α׾ƿ� �׼�
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
	//ȸ������ �׼�
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Member member, Model model) {
		
		int result = dao.join(member);
		if(result==0) {
			model.addAttribute("warning", "�ߺ��� ID�� �ֽ��ϴ�.");
			model.addAttribute("member", member);
			
			return "signup";
		}
		return "home";
	}
	
	//�α����� �̵�
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	//�α����� �׼�
	@RequestMapping(value="/loginMember", method=RequestMethod.GET)
	public String loginMember(Member member, HttpSession session, Model model) {
		Member result = null;
		
		result=dao.login(member);
		if(result==null) {
			model.addAttribute("warning", "ID�� ��й�ȣ�� Ȯ�����ּ���.");
			model.addAttribute("member", member);
			return "login";
		}

		session.setAttribute("loginId", member.getId());

		return "home";
	}
}
	