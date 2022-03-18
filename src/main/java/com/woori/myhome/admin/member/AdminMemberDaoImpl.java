package com.woori.myhome.admin.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("AdminmemberDao")
public class AdminMemberDaoImpl implements AdminMemberDao {

	@Autowired
	SqlSessionTemplate sm;

	@Override
	public List<AdminMemberDto> getList(AdminMemberDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("admin_getList",dto);
	}

	@Override
	public void updateactive(AdminMemberDto dto) {
		sm.update("updateactive",dto);
		
	}

	@Override
	public AdminMemberDto getView(AdminMemberDto dto) {
		return sm.selectOne("admin_getView", dto);
	}
	
	
}
