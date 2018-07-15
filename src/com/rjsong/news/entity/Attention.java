package com.rjsong.news.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="NEWS_ATTENTION")
public class Attention {
	
	private Integer attention_Id; //关注id
	private User from_user;//关注用户对象
	private User to_user;//被关注用户对象
	private String status;//状态
	
	@Id
	@GeneratedValue
	public Integer getAttention_Id() {
		return attention_Id;
	}
	public void setAttention_Id(Integer attention_Id) {
		this.attention_Id = attention_Id;
	}
	
	@ManyToOne  //多个被关注人的ID对应一个用户的ID
	@JoinColumn(name="ATTENTION_FROM_USER_ID")
	public User getFrom_user() {
		return from_user;
	}
	public void setFrom_user(User from_user) {
		this.from_user = from_user;
	}
	
	@ManyToOne
	@JoinColumn(name="ATTENTION_TO_USER_ID")
	public User getTo_user() {
		return to_user;
	}
	public void setTo_user(User to_user) {
		this.to_user = to_user;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
