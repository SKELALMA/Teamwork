package com.woori.myhome.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name="memberDao")
	MemberDao memberDao;

	@Override
	public boolean isDuplicate(MemberDto dto) {
		
		return memberDao.isDuplicate(dto);
	}

	@Override
	public void insert(MemberDto dto) {
		memberDao.insert(dto);
	}

	@Override
	public MemberDto getInfo(MemberDto dto) {
		
		return memberDao.getInfo(dto);
	}

	@Override
	public MemberDto findId(MemberDto dto) {
		
		return memberDao.findId(dto);
	}

	@Override
	public MemberDto findPassword(MemberDto dto) {

		return memberDao.findPassword(dto);
	}

	@Override
	public void update(MemberDto dto) {
		memberDao.update(dto);	
	}	
}



