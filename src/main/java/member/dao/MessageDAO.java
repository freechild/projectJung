package member.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import All.vo.MessageVO;
import All.vo.TotalVO;



@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSession session;
	
	public void insert(MessageVO vo){
		 session.insert("message.insert",vo);
	}
	public List<TotalVO> selectList(int both_idx){
		 return session.selectList("message.selectList",both_idx);
	}
	public int getCount(int both_idx){
		return session.selectOne("message.getCount",both_idx);
	}
	public TotalVO selectByIdx(int idx){
		return session.selectOne("message.selectByIdx",idx);
	}
	public void delete(int idx){
		session.delete("message.delete",idx);
	}

}
