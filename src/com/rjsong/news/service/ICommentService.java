package com.rjsong.news.service;

import com.rjsong.news.entity.Comment;
import com.rjsong.news.entity.Page;

public interface ICommentService {

	/**
	 * 分页查询评论对象集合
	 * @param inputCondition
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page queryCommentByPage(String inputCondition, String startTime, String endTime, int pageNow, int pageSize);
	
	/**
	 * 个人中心评论列表
	 * @param userId
	 * @param startTime
	 * @param endTime
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page queryCommentByUser(int userId,int pageNow, int pageSize);
	
	/**
	 * 前台，根据文章id分页查询评论
	 * @param newsId
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page queryUiComment(int newsId,int pageNow,int pageSize);
	
	/**
	 * 删除评论
	 * @param commentId
	 */
	public void remove(int commentId);
	
	/**
	 * 添加评论
	 * @param comment
	 */
	public void InsertComment(Comment comment);
	
	/**
	 * 查询用户的评论数
	 * @param userId
	 * @return
	 */
	public long queryCountForUser(int userId);
	
	/**
	 * 查询新闻的评论数
	 * @param newsId
	 * @return
	 */
	public long queryCountForNews(int newsId);
}
