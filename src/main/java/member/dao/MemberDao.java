package member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import All.vo.MemberVO;

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
}
