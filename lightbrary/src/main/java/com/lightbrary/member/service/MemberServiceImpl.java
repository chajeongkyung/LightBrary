package com.lightbrary.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lightbrary.member.dao.MemberDao;
import com.lightbrary.member.model.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{

	private static final Logger log = 
			LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	public MemberDao memberDao;

	@Override
	public void insertOneMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		memberDao.insertOneMember(memberDto);
	
	}

	@Override
	public int deleteOneMember(int no) {
		// TODO Auto-generated method stub
		return memberDao.deleteOneMember(no);
	}

	@Override
	public int updateOneMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		int resultNum = 0;
		
		resultNum = memberDao.updateOneMember(memberDto);
		return resultNum;
	}

	@Override
	public MemberDto selectOneMember(int no) {
		// TODO Auto-generated method stub
		MemberDto memberDto = memberDao.selectOneMember(no);
		
		return memberDto;
	}

	@Override
	public List<MemberDto> selectListMember() {
		// TODO Auto-generated method stub
		List<MemberDto> memberList = memberDao.selectListMember();
		
		return memberList;
	}

	@Override
	public MemberDto memberExist(String email, String password) {
		// TODO Auto-generated method stub
		MemberDto memberDto = memberDao.existMember(email, password);
		
		return memberDto;
	}

	
	
}
