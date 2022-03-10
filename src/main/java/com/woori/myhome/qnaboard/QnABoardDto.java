package com.woori.myhome.qnaboard;

import com.woori.myhome.common.BaseDto;

public class QnABoardDto extends BaseDto{

	private String qna_id="";
	private String qna_writer="";
	private String username="";
	private String qna_title="";
	private String qna_comment="";
	private String qna_wdate="";
	private String qna_moddate="";
	private String qna_delyn="";
	private int qna_group_id=0;
	private int qna_depth=0;
	private int qna_g_level=1;
	private int qna_hit=0;
	
	
	public String getQna_id() {
		return qna_id;
	}
	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_comment() {
		return qna_comment;
	}
	public void setQna_comment(String qna_comment) {
		this.qna_comment = qna_comment;
	}
	public String getQna_wdate() {
		return qna_wdate;
	}
	public void setQna_wdate(String qna_wdate) {
		this.qna_wdate = qna_wdate;
	}
	public String getQna_moddate() {
		return qna_moddate;
	}
	public void setQna_moddate(String qna_moddate) {
		this.qna_moddate = qna_moddate;
	}
	public String getQna_delyn() {
		return qna_delyn;
	}
	public void setQna_delyn(String qna_delyn) {
		this.qna_delyn = qna_delyn;
	}
	public int getQna_group_id() {
		return qna_group_id;
	}
	public void setQna_group_id(int qna_group_id) {
		this.qna_group_id = qna_group_id;
	}
	public int getQna_depth() {
		return qna_depth;
	}
	public void setQna_depth(int qna_depth) {
		this.qna_depth = qna_depth;
	}
	public int getQna_g_level() {
		return qna_g_level;
	}
	public void setQna_g_level(int qna_g_level) {
		this.qna_g_level = qna_g_level;
	}
	public int getQna_hit() {
		return qna_hit;
	}
	public void setQna_hit(int qna_hit) {
		this.qna_hit = qna_hit;
	}
	
	
	
	
}
