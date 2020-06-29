package com.lightbrary.member.dao;

import java.util.List;

import com.lightbrary.member.model.MemberDto;

public interface MemberDao {

	public void insertOneMember(MemberDto memberDto);
	public int deleteOneMember(int no);
	public int updateOneMember(MemberDto memberDto);
	public MemberDto selectOneMember(int no);
	//일단 모두 조회
	public List<MemberDto> selectListMember();
	public MemberDto existMember(String email, String password);
	
	public int checkEmail(String email);
}

