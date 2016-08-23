package All.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public String home() {
		
		return "login/login";
	}
	
	@RequestMapping(value="{userId}/main", produces={"text/html"})
	public String method7(@PathVariable("userId") String userId,HttpSession session){
//		System.out.println(session.getAttribute("email"));
		if(session.getAttribute("userId")==null)
			return "login/login";
		int m_idx = memberService.selectByIdx(userId);
		session.setAttribute("m_idx",m_idx );
		return "main";
		
	}
}
