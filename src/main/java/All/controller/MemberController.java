package All.controller;


import java.util.HashMap;
import java.util.List;

import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.google.gson.Gson;

import All.vo.MemberVO;
import All.vo.MessageVO;
import member.email.Email;
import member.email.EmailSender;
import member.service.Aria;
import member.service.MemberService;
import member.service.MessageService;
import member.service.MultiLoginPreventorListener;

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
	private MemberService memberService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	MultiLoginPreventorListener preventorListener = MultiLoginPreventorListener.getInstance();
	

	// 로그인
	@RequestMapping(value = "login.do")
	@ResponseBody
	public String login(Model model, HttpSession session, MemberVO memberVO, HttpServletRequest request){
		String result = memberService.loginId(memberVO.getUserId(), memberVO.getUserPw());

		if(result == "true"){
			if(preventorListener.findByLoginId(memberVO.getUserId())){
				result = "e";
			}
			preventorListener.addUser(memberVO.getUserId(), session);
		}
		return result; 
	} 
	// 로그아웃
	@RequestMapping(value = "/logout.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String logout(HttpSession session){

		session.invalidate();
		System.out.println(session);
		return "login/login";
	}
	
	// 회원가입
	@RequestMapping(value = "/registerOk.do", method = RequestMethod.POST)
	public String register(MemberVO memberVO, HttpServletRequest request){
		String pass = aria.Encrypt(memberVO.getUserPw());
		memberVO.setUserPw(pass);
		memberService.insert(memberVO);
		return "login/login";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/sendpw.do", method = RequestMethod.POST)
	public ModelAndView sendEmailAction (MemberVO memberVO, ModelMap model) throws Exception {
	    ModelAndView mav;
	    
	    String e_mail = memberVO.getEmail();
	    String pw = memberService.getPw(e_mail);
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
	public void update(MemberVO memberVO, HttpServletRequest request){
		String pass = aria.Encrypt(memberVO.getUserPw());
		memberVO.setUserPw(pass);
		
		System.out.println(memberVO);
		memberService.update(memberVO);
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
		int result = memberService.idCheck(userId);
		String flag = null;
		if(result==1){
			flag = "false";
		}else
			flag = "true";
		return flag;
	}

	@RequestMapping(value = "searchFriend",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public Object searchFried(@RequestParam("search")String search,@RequestParam("idx")int idx){
		String data =null;
		
		List<MemberVO> list = memberService.friendList(search,idx);
//		System.out.println(list);
		if(list.isEmpty())
			data = "false"; 
		else{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("friendList", list);
			Gson gson = new Gson();
			data = gson.toJson(map);
		}
		System.out.println(data);
		return data;
	}
	@RequestMapping(value="addFriend",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String addFriend(@ModelAttribute MessageVO vo){
		String result =null;

		boolean bool = messageService.insert(vo);
		if(bool==true) 
			result ="메시지를 보냈습니다.";
		else
			result ="이미 등록된 친구입니다.";
		return result;
	}
	
}
