package com.lightbrary.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lightbrary.member.model.MemberDto;
import com.lightbrary.member.model.MemberListParamDto;
import com.lightbrary.rent.model.RentDto;


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
		System.out.println(memberDto);
		System.out.println(memberDto);
		System.out.println(memberDto);
		System.out.println(memberDto);
		System.out.println(memberDto);
		System.out.println(memberDto);
		System.out.println(memberDto);
		System.out.println(memberDto);
		System.out.println(memberDto);
		System.out.println(memberDto);
		return sqlSession.update(namespace + "updateOneMember", memberDto);
	}

	@Override
	public MemberDto selectOneMember(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "selectOneMember", no);
	}

	@Override
	public MemberDto memberExist(String email, String password) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("email", email);
		paramMap.put("password", password);
		
		MemberDto memberDto = sqlSession.selectOne(namespace + "memberExist", paramMap);
		
		return memberDto;
	}
	
	@Override
	public int checkEmail(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "checkEmail", email);
	}

	@Override
	public MemberDto findEmail(String userName, String phone) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("userName", userName);
		paramMap.put("phone", phone);
		
		MemberDto memberDto = sqlSession.selectOne(namespace + "findEmail", paramMap);
		
		return memberDto;
	}

	@Override
	public String findPassword(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "findPassword", email);
	}

	@Override
	public List<MemberDto> selectMember(MemberListParamDto memberListParamDto) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace + "selectMember", memberListParamDto);
	}

	@Override
	public int totalCountMember(MemberListParamDto memberListParamDto) {
		// TODO Auto-generated method stub

		return sqlSession.selectOne(namespace + "totalCountMember", memberListParamDto);
	}


}
