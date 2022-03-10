package com.woori.myhome.member;

public interface MemberDao {
	boolean isDuplicate(MemberDto dto);
	void insert(MemberDto dto);
	MemberDto getInfo(MemberDto dto);
	MemberDto findId(MemberDto dto);
	MemberDto findPassword(MemberDto dto);
	void update(MemberDto dto);
}
