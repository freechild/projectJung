package All.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import All.vo.CommentVO;
import board.service.CommentService;
import board.service.PasswordCheckLogic;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	@Autowired
	private PasswordCheckLogic passwordCheckLogic;
	
	
	@RequestMapping(value ="/b_comment")
	@ResponseBody
	public String b_comment( String email,@ModelAttribute CommentVO vo,HttpServletRequest request){
		
		System.out.println(vo);
		
		commentService.insert(vo);
			
		return "b_view?idx="+vo.getB_ref();
	}

	@RequestMapping(value ="${email}/c_checkPW")
	@ResponseBody
	public String c_checkPW(@PathVariable("email") String email,@RequestParam("pw") String pw,@RequestParam("idx") int idx,
			@RequestParam("b_idx")int b_idx){
		System.out.println(b_idx);
		String bool =
		passwordCheckLogic.passwordCheck(idx, pw, 1);
		
		if(bool=="true" ){
			commentService.delete(idx);
			bool = "b_view?idx="+b_idx;
		}
		
		return bool;
	}
}
