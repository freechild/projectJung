package All.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


import All.vo.MemberVO;
import member.email.Email;
import member.email.EmailSender;
import member.service.Aria;
import member.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {

	@Autowired
	private EmailSender emailSender;
	
	String key = "qwerty~!@#$%";
	Aria aria = new Aria(key);
	
	@Autowired
	private Email email;
	
	@Autowired
	private MemberService service;
	
	// 로그인
	@RequestMapping(value = "login.do")
	@ResponseBody
	public String login(HttpSession session, MemberVO memberVO, HttpServletRequest request){
		
		String result = service.loginId(memberVO.getUserId(), memberVO.getUserPw());
		if(result == "true")
			session.setAttribute("userId",memberVO.getUserId());
		return result; 
	} 
	// 로그아웃
	@RequestMapping(value = "/logout.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String logout(HttpSession session){

		System.out.println(session);
		session.invalidate();
		System.out.println(session);
		return "login/login";
	}
	
	// 회원가입
	@RequestMapping(value = "/registerOk.do", method = RequestMethod.POST)
	public String register(MemberVO memberVO, HttpServletRequest request){
		System.out.println(memberVO);
		
		String pass = aria.Encrypt(memberVO.getUserPw());
		System.out.println(pass);
		
		memberVO.setUserPw(pass);
		service.insert(memberVO);
		return "login/login";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/sendpw.do", method = RequestMethod.POST)
	public ModelAndView sendEmailAction (MemberVO memberVO, ModelMap model) throws Exception {
	    ModelAndView mav;
	    
	    String e_mail = memberVO.getEmail();
	    String pw = service.getPw(e_mail);
	    String id = memberVO.getUserId();
	    
	    String pass = aria.Decrypt(pw);
	    
	    System.out.println(id);
	    System.out.println(pass);
	    System.out.println(e_mail);
	   
	    if(pw!=null){
	    	email.setContent("비밀번호는 "+pass+" 입니다.");
	    	email.setReceiver(e_mail);
	    	email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
	    	emailSender.SendEmail(email);
	    	mav = new ModelAndView("login/login");
	    	return mav;
	    }else{
	    	mav = new ModelAndView("redirect:/logout.do");
	    	return mav;
	    }
	}
	
	// 비밀번호 찾기
	@RequestMapping("/search.do")
	public String searchpw(){
		return "login/searchpw";
	}
	
	// 회원정보 수정
	@RequestMapping("{userId}/updateUser.do")
	public String update(MemberVO memberVO, HttpServletRequest request){
		String pass = aria.Encrypt(memberVO.getUserPw());
		memberVO.setUserPw(pass);
		
		service.update(memberVO);
		return "login/login";
	}
	
	//회원정보 수정
	@RequestMapping("{userId}/update.do")
	public String updateUser(){
		return "login/updateUser";
	}
	

	// 아이디 중복체크
	@RequestMapping(value = "/idCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam("userId1") String userId){
		System.out.println("get in"+userId);
		int result = service.idCheck(userId);
		String flag = null;
		if(result==1){
			flag = "false";
		}else
			flag = "true";
		return flag;
	}
}
