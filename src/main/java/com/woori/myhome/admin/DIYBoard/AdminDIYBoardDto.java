package com.woori.myhome.admin.DIYBoard;

import com.woori.myhome.common.BaseDto;
 
public class AdminDIYBoardDto extends BaseDto{
	private String id="";
	private String title="";
	private String writer="";
	private String comment="";
	private String wdate="";
	private String delyn="";
	private String image="";
	private int hit=0;
	private String category="";
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "AdminDIYBoardDto [id=" + id + ", title=" + title + ", image=" + image + "]";
	}
	
	
}
