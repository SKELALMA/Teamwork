package com.woori.myhome.admin.login;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminLoginService")
public class AdminLoginServiceImpl implements AdminLoginService {
	
	@Resource(name="adminLoginDao")
	AdminLoginDao loginDao;

	@Override
	public boolean isDuplicate(AdminLoginDto dto) {

		return loginDao.isDuplicate(dto);
	}

	@Override
	public void insert(AdminLoginDto dto) {
		
		loginDao.insert(dto);
	}

	@Override
	public AdminLoginDto getInfo(AdminLoginDto dto) {
		
		return loginDao.getInfo(dto);
	}

	@Override
	public AdminLoginDto findId(AdminLoginDto dto) {
		
		return loginDao.findId(dto);
	}

	@Override
	public AdminLoginDto findPassword(AdminLoginDto dto) {

		return loginDao.findPassword(dto);
	}

	@Override
	public void update(AdminLoginDto dto) {
		
		loginDao.update(dto);
	}
}
