package com.woori.myhome.noticeboard;
 
import com.woori.myhome.common.BaseDto;

public class NoticeBoardDto extends BaseDto{
	private String notice_id="";
	private String notice_title="";
	private String notice_comment="";
	private String notice_wdate="";
	private String notice_delyn="";
	private int notice_hit=0;
	
	
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_comment() {
		return notice_comment;
	}
	public void setNotice_comment(String notice_comment) {
		this.notice_comment = notice_comment;
	}
	public String getNotice_wdate() {
		return notice_wdate;
	}
	public void setNotice_wdate(String notice_wdate) {
		this.notice_wdate = notice_wdate;
	}
	public String getNotice_delyn() {
		return notice_delyn;
	}
	public void setNotice_delyn(String notice_delyn) {
		this.notice_delyn = notice_delyn;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	
	
	
}
