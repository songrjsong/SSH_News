package com.rjsong.news.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="NEWS_REPLY")
public class Reply {
	private Integer reply_Id;//回复ID
	private News news;//文章对象
	private Date replyTime; //回复时间
	private User from_User; //评论人对象
	private User to_User; //回复人对象
	private Comment comment;//评论对象
	private String replyContent;//回复内容
	
	@Id
	@GeneratedValue
	public Integer getReply_Id() {
		return reply_Id;
	}
	public void setReply_Id(Integer reply_Id) {
		this.reply_Id = reply_Id;
	}
	@ManyToOne
	@JoinColumn(name="REPLY_NEWS_ID")
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public Date getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}
	
	@ManyToOne
	@JoinColumn(name="REPLY_FROM_USER_ID")
	public User getFrom_User() {
		return from_User;
	}
	public void setFrom_User(User from_User) {
		this.from_User = from_User;
	}
	@ManyToOne
	@JoinColumn(name="REPLY_TO_USER_ID")
	public User getTo_User() {
		return to_User;
	}
	public void setTo_User(User to_User) {
		this.to_User = to_User;
	}
	
	@ManyToOne
	@JoinColumn(name="REPLY_COMMENT_ID")
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
	
	
}
