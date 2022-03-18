package com.woori.myhome.admin.member;

import java.util.List;

public interface AdminMemberService {
	List<AdminMemberDto> getList(AdminMemberDto dto);
	void updateactive(AdminMemberDto dto);
	AdminMemberDto getView(AdminMemberDto dto);	
}
