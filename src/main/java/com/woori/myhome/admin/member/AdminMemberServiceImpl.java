package com.woori.myhome.admin.member;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("AdminmemberService")
public class AdminMemberServiceImpl implements AdminMemberService{

	@Resource(name="AdminmemberDao")
	AdminMemberDao dao;
	
	@Override
	public List<AdminMemberDto> getList(AdminMemberDto dto) {
		// TODO Auto-generated method stub
		return dao.getList(dto);
	}

	@Override
	public void updateactive(AdminMemberDto dto) {
		dao.updateactive(dto);
		
	}

	@Override
	public AdminMemberDto getView(AdminMemberDto dto) {
		// TODO Auto-generated method stub
		return dao.getView(dto);
	}

	
}
