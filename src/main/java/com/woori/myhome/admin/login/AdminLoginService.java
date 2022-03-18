package com.woori.myhome.admin.login;

public interface AdminLoginService {
	boolean isDuplicate(AdminLoginDto dto);
	void insert(AdminLoginDto dto);
	AdminLoginDto getInfo(AdminLoginDto dto);
	AdminLoginDto findId(AdminLoginDto dto);
	AdminLoginDto findPassword(AdminLoginDto dto);
	void update(AdminLoginDto dto);
}
