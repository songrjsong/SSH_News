package com.rjsong.news.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="NEWS_NOTICE")
public class Notice {
	
	private Integer notice_Id;//公告Id
	private String notice_Title;//公告标题
	private String notice_Content;//内容
	private Admin admin;//管理员对象
	private Date noticeTime;//发表时间
	
	@Id
	@GeneratedValue
	public Integer getNotice_Id() {
		return notice_Id;
	}
	public void setNotice_Id(Integer notice_Id) {
		this.notice_Id = notice_Id;
	}
	public String getNotice_Title() {
		return notice_Title;
	}
	public void setNotice_Title(String notice_Title) {
		this.notice_Title = notice_Title;
	}
	public String getNotice_Content() {
		return notice_Content;
	}
	public void setNotice_Content(String notice_Content) {
		this.notice_Content = notice_Content;
	}
	@ManyToOne
	@JoinColumn(name="NOTICE_ADMIN_ID")
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Date getNoticeTime() {
		return noticeTime;
	}
	public void setNoticeTime(Date noticeTime) {
		this.noticeTime = noticeTime;
	}
	
	
	
}
