package com.rjsong.news.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="NEWS_FEEDBACK")
public class Feedback {
	
	private Integer feedback_Id; //反馈Id
	private User user; //用户对象
	private String feedbackContent; //反馈内容
	private Date fbTime; //反馈时间
	
	@Id
	@GeneratedValue
	public Integer getFeedback_Id() {
		return feedback_Id;
	}
	public void setFeedback_Id(Integer feedback_Id) {
		this.feedback_Id = feedback_Id;
	}
	@ManyToOne
	@JoinColumn(name="FEEDBACK_USER_ID")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getFeedbackContent() {
		return feedbackContent;
	}
	public void setFeedbackContent(String feedbackContent) {
		this.feedbackContent = feedbackContent;
	}
	public Date getFbTime() {
		return fbTime;
	}
	public void setFbTime(Date fbTime) {
		this.fbTime = fbTime;
	}
	
	
	
}
