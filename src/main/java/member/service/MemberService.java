package member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import All.vo.MemberVO;
import member.dao.MemberDao;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao dao;
	
	String key = "qwerty~!@#$%";
	Aria aria = new Aria(key);
	
	
	public MemberVO selectById(String id){
		MemberVO vo = dao.selectById(id);
		return vo;
	}
	public int selectByIdx(String id){
		MemberVO vo = dao.selectById(id);
		return vo.getIdx();
	}
	
	
	
	public boolean insert(MemberVO vo){
		boolean isUse = true;
		try{
			dao.insert(vo);
		}catch(Exception e){
			e.printStackTrace();
			isUse = false;
		}
		return isUse;
	}
	
	public String getPw(String email){
		return dao.getPw(email);
	}
	
	public int idCheck(String userID){
		System.out.println(dao.idCheck(userID));
		return dao.idCheck(userID);
	}
	
	
	public void update(MemberVO vo){
		dao.update(vo);
	}
	
	
	
	public String loginId(String userId,String userPw){
		String result =null;
		
		try {
			MemberVO vo = dao.selectById(userId);
			if(vo == null){
				result = "id not here";
			}
			else{
				String pw = aria.Encrypt(userPw);
				if(!pw.equals(vo.getUserPw())){
					result = "password is wrong";	
				}
				else
					result = "true";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
