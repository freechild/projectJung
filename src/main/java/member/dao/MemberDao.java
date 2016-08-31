package member.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import All.vo.MemberVO;
import All.vo.TotalVO;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO selectById(String id){
		return sqlSession.selectOne("member.selectById", id);
	}
	public void insert(MemberVO vo){
		sqlSession.selectOne("member.insert",vo);
	}
	
	public String getPw(String email){
		return sqlSession.selectOne("member.getPw", email);
	}
	
	public int idCheck(String userID){
		return sqlSession.selectOne("member.selectIdCheck", userID);
	}
	
	public void update(MemberVO vo){
		sqlSession.selectOne("member.update",vo);
	}
	
	//add 
	public TotalVO selectByIdx(int idx){
		return sqlSession.selectOne("member.selectByIdx",idx);
	}
	public void add_friend(int idx,String friendList){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("idx", idx+"");
		map.put("friendList", friendList);
		sqlSession.update("member.add_friend",map);
	} 
	public List<MemberVO> searchFriend(String search,int idx){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("idx",idx+"");
		return sqlSession.selectList("member.searchFriend",map);
	}
	
}
