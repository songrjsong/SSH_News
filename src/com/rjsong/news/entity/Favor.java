package com.rjsong.news.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="NEWS_FAVOR")
public class Favor {
	private Integer favor_Id; //点赞Id
	private News news;//文章对象
	private User user;//用户对象
	private Date favor_Time;//点赞时间
	private String favor_Status;//是否点赞
	
	@Id
	@GeneratedValue
	public Integer getFavor_Id() {
		return favor_Id;
	}
	public void setFavor_Id(Integer favor_Id) {
		this.favor_Id = favor_Id;
	}
	
	@ManyToOne
	@JoinColumn(name="FAVOR_NEWS_ID")
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	
	@ManyToOne
	@JoinColumn(name="FAVOR_NEWS_USER")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Date getFavor_Time() {
		return favor_Time;
	}
	public void setFavor_Time(Date favor_Time) {
		this.favor_Time = favor_Time;
	}
	public String getFavor_Status() {
		return favor_Status;
	}
	public void setFavor_Status(String favor_Status) {
		this.favor_Status = favor_Status;
	}
	
	
}
