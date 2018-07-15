package com.rjsong.news.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="NEWS_COLLECT")
public class Collect {
	private Integer collect_Id;//收藏ID
	private News news;//新闻对象
	private User user;//用户对象
	private Date collectTime;//收藏时间
	private String collectStatus;//是否收藏
	
	
	@Id
	@GeneratedValue
	public Integer getCollect_Id() {
		return collect_Id;
	}
	public void setCollect_Id(Integer collect_Id) {
		this.collect_Id = collect_Id;
	}
	@ManyToOne
	@JoinColumn(name="COLLECT_NEWS_ID")
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	
	@ManyToOne
	@JoinColumn(name="COLLECT_USER_ID")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getCollectTime() {
		return collectTime;
	}
	public void setCollectTime(Date collectTime) {
		this.collectTime = collectTime;
	}
	public String getCollectStatus() {
		return collectStatus;
	}
	public void setCollectStatus(String collectStatus) {
		this.collectStatus = collectStatus;
	}
	
	
	
	
	
	
}
