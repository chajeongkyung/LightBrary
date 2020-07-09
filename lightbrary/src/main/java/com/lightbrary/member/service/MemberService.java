package com.lightbrary.member.service;

import java.util.List;

import com.lightbrary.member.model.MemberDto;
import com.lightbrary.member.model.MemberListParamDto;

public interface MemberService {

	public void insertOneMember(MemberDto memberDto);
	public int deleteOneMember(int no);
	public int updateOneMember(MemberDto memberDto);
	public MemberDto selectOneMember(int no);
	
	//일단 모두 조회	
	public List<MemberDto> selectMember(MemberListParamDto memberListParamDto);
	public int totalCountMember(MemberListParamDto memberListParamDto);
	
	public MemberDto memberExist(String email, String password);	
	public int checkEmail(String email);
	public MemberDto findEmail(String userName, String phone);
	public int resetPassword(String email, String password);
	public int findMemberNo(String email);
}
