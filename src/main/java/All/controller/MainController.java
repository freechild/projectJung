package All.controller;

import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import All.vo.MemberVO;
import event.service.EventProess;
import member.service.MemberService;
import member.service.MultiLoginPreventorListener;

@Controller
public class MainController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private EventProess eventProess;
	
	@Autowired
	MultiLoginPreventorListener preventorListener = MultiLoginPreventorListener.getInstance();
	
	@RequestMapping(value = {"/","front"}, method = RequestMethod.GET)
	public String home() {
		
		return "login/login";
	}
	
	//메인
	@RequestMapping(value={"{userId}/main"}, produces={"text/html"})
	public String method7(@PathVariable("userId") String userId, Model model, HttpSession session, MemberVO memberVO){
		
		int m_idx = memberService.selectByIdx(userId);
		session.setAttribute("m_idx",m_idx );
		
		if(!preventorListener.findByLoginId(memberVO.getUserId())){
			return "redirect:/";
		}
		
		model.addAttribute("usersMap", preventorListener.getTotalActiveSession());
		return "main";
	}
	
	@RequestMapping(value="/calendar")
	@ResponseBody
	public String calendar(HttpServletRequest request){
		HashMap<String, String> map = eventProess.eventProress(request);
		Gson gson = new Gson();
		String date = gson.toJson(map);
		System.out.println(date);
		return date;
	}
	
}
