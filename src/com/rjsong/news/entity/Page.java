package com.rjsong.news.entity;

import java.util.List;



public class Page {
	private int pageNow;
	private int pageSize;
	private int pageCount;
	private int rowCount;
	
	private List<User> users; //用户集合对象
	private List<News> news;//文章集合对象
	private List<Notice> notices;//公告集合对象
	private List<Inform> informs;//举报集合对象
	private List<Comment> comments;//评论集合对象
    private List<Attention> attentions;//关注集合
	private List<Collect> collects;//收藏集合
	private List<Favor> favors;//点赞集合
	private List<Reply> replys;//回复的所有集合
	private List<Type> types;//类型集合
	private List<Feedback> feedbacks;//用户反馈的所有集合
	
	
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public List<News> getNews() {
		return news;
	}
	public void setNews(List<News> news) {
		this.news = news;
	}
	
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
	public List<Notice> getNotices() {
		return notices;
	}
	public void setNotices(List<Notice> notices) {
		this.notices = notices;
	}

	public List<Inform> getInforms() {
		return informs;
	}
	
	public void setInforms(List<Inform> informs) {
		this.informs = informs;
	}
	
	public List<Collect> getCollects() {
		return collects;
	}
	public void setCollects(List<Collect> collects) {
		this.collects = collects;
	}
	public List<Favor> getFavors() {
		return favors;
	}
	public void setFavors(List<Favor> favors) {
		this.favors = favors;
	}

	public List<Reply> getReplys() {
		return replys;
	}
	public void setReplys(List<Reply> replys) {
		this.replys = replys;
	}
	public List<Type> getTypes() {
		return types;
	}
	public void setTypes(List<Type> types) {
		this.types = types;
	}
	public List<Feedback> getFeedbacks() {
		return feedbacks;
	}
	public void setFeedbacks(List<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

	public List<Attention> getAttentions() {
		return attentions;
	}
	public void setAttentions(List<Attention> attentions) {
		this.attentions = attentions;
	}

}
