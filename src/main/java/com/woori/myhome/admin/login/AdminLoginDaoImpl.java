package com.woori.myhome.admin.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminLoginDao")
public class AdminLoginDaoImpl implements AdminLoginDao {
	
	@Autowired
	SqlSessionTemplate sm;

	@Override
	public boolean isDuplicate(AdminLoginDto dto) {

		int cnt = sm.selectOne("AdminLogin_isduplicate", dto);
		if(cnt==0)
			return false; //중복아님, 사용가능한 아이디임  
		else
			return true; //이미 사용중임 
	}

	@Override
	public void insert(AdminLoginDto dto) {
		
		sm.insert("AdminLogin_insert", dto);
	}

	@Override
	public AdminLoginDto getInfo(AdminLoginDto dto) {
		
		return sm.selectOne("AdminLogin_getInfo", dto);
	}

	@Override
	public AdminLoginDto findId(AdminLoginDto dto) {
		
		return sm.selectOne("AdminLogin_findid", dto);
	}

	@Override
	public AdminLoginDto findPassword(AdminLoginDto dto) {
		
		return sm.selectOne("AdminLogin_findpassword", dto);
	}

	@Override
	public void update(AdminLoginDto dto) {
		
		sm.update("AdminLogin_updateInfo", dto);
	}

}
