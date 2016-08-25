package All.controller;

import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import All.vo.MemberVO;
import member.service.MemberService;
import member.service.MultiLoginPreventorListener;

@Controller
public class MainController {
	
	@Autowired
	private MemberService memberService;
	
	MultiLoginPreventorListener preventorListener = MultiLoginPreventorListener.getInstance();
	
	@RequestMapping(value = {"/","front"}, method = RequestMethod.GET)
	public String home() {
		
		return "login/login";
	}
	
	//메인
	@RequestMapping(value="{userId}/main", produces={"text/html"})
	public String method7(@PathVariable("userId") String userId, Model model, HttpSession session, MemberVO memberVO){
		
		if(session.getAttribute("userId")==null)
			return "/login/login";
		
		int m_idx = memberService.selectByIdx(userId);
		
		session.setAttribute("m_idx",m_idx );

		preventorListener.addUser(memberVO.getUserId(), session);
		model.addAttribute("usersMap", preventorListener.getTotalActiveSession());
		return "main";
	}
}
