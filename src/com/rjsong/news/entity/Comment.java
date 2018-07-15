package com.rjsong.news.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="NEWS_COMMENT")
public class Comment {
	private Integer comment_Id;//评论Id
	private News news;//文章对象
	private User from_user;//评论人对象
	private String commentContent;//评论内容
	private Date commentTime;//评论时间
	
	@Id
	@GeneratedValue
	public Integer getComment_Id() {
		return comment_Id;
	}
	public void setComment_Id(Integer comment_Id) {
		this.comment_Id = comment_Id;
	}
	
	@ManyToOne
	@JoinColumn(name="COMMENT_NEWS_ID")
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	@ManyToOne
	@JoinColumn(name="COMMENT_FROM_USER_ID")
	public User getFrom_user() {
		return from_user;
	}
	public void setFrom_user(User from_user) {
		this.from_user = from_user;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}
	
	
	
	
}
