package com.rjsong.news.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="NEWS_NEWS")
public class News {
	private Integer news_Id; //文章ID
	private User user; //作者对象
	private String title;//标题
	private Type type;//类型
	private String label;//标签
	private String newsImg;//封面
	private String content;//内容
	private String descript;//描述
	private Date createTime;//发布时间
	private Date updateTime;//更改时间
	private String is_Draft;//草稿:1.是 2.否
	private String status;//审核状态:1.通过 2.未通过
	private int lookCount;//浏览数
	private int commentCount;//评论数
	private int favorCount;//点赞数
	
	@Id
	@GeneratedValue
	public Integer getNews_Id() {
		return news_Id;
	}
	public void setNews_Id(Integer news_Id) {
		this.news_Id = news_Id;
	}
	
	@ManyToOne
	@JoinColumn(name="NEWS_USER_ID")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@ManyToOne
	@JoinColumn(name="NEWS_TYPE_ID")
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getNewsImg() {
		return newsImg;
	}
	public void setNewsImg(String newsImg) {
		this.newsImg = newsImg;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getIs_Draft() {
		return is_Draft;
	}
	public void setIs_Draft(String is_Draft) {
		this.is_Draft = is_Draft;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getLookCount() {
		return lookCount;
	}
	public void setLookCount(int lookCount) {
		this.lookCount = lookCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getFavorCount() {
		return favorCount;
	}
	public void setFavorCount(int favorCount) {
		this.favorCount = favorCount;
	}
	
	
	
}
