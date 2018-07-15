package com.rjsong.news.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="NEWS_INFORM")
public class Inform {
	private Integer inform_Id;//举报Id
	private User user;//举报人
	private News news;//被举报的新闻对象
	private String content;//举报内容
	private Date informTime;//举报时间
	
	@Id
	@GeneratedValue
	public Integer getInform_Id() {
		return inform_Id;
	}
	public void setInform_Id(Integer inform_Id) {
		this.inform_Id = inform_Id;
	}
	
	@ManyToOne
	@JoinColumn(name="INFORM_USER_ID")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@ManyToOne
	@JoinColumn(name="INFORM_NEWS_ID")
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getInformTime() {
		return informTime;
	}
	public void setInformTime(Date informTime) {
		this.informTime = informTime;
	}
	
	
}
