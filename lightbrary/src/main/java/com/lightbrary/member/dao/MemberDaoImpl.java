package com.lightbrary.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lightbrary.member.model.MemberDto;


@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.lightbrary.member.";
	
	@Override
	public void insertOneMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "insertOneMember", memberDto);
	}

	@Override
	public int deleteOneMember(int no) {
		// TODO Auto-generated method stub
		
		return sqlSession.delete(namespace + "deleteOneMember", no);
	}

	@Override
	public int updateOneMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneMember", memberDto);
	}

	@Override
	public MemberDto selectOneMember(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "selectOneMember", no);
	}

	@Override
	public List<MemberDto> selectListMember() {
		// TODO Auto-generated method stub
		List<MemberDto> memberList = 
				sqlSession.selectList(namespace + "selectListMember");
		
		return memberList;
	}

	@Override
	public MemberDto existMember(String email, String password) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("email", email);
		paramMap.put("password", password);
		
		MemberDto memberDto = sqlSession.selectOne(namespace + "existMember", paramMap);
		
		return memberDto;
	}
	
	
}
