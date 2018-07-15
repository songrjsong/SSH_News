package com.rjsong.news.dao;


import com.rjsong.news.entity.Comment;
import com.rjsong.news.entity.Page;

public interface ICommentDao {
	
	/**
	 * 后台评论列表显示
	 * @param inputCondition 用户名称，新闻标题
	 * @param startTime
	 * @param endTime
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page selectCommentByPage(String inputCondition,String startTime,String endTime,int pageNow, int pageSize);
	
	/**
	 * 个人中心评论列表
	 * @param userId
	 * @param startTime
	 * @param endTime
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page selectCommentByUser(int userId,int pageNow, int pageSize);
	
	/**
	 * 前台，根据文章id分页查询评论
	 * @param newsId
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page selectUiComment(int newsId,int pageNow,int pageSize);
	
	/**
	 * 删除评论
	 * @param commentId
	 */
	public void delete(int commentId);
	
	/**
	 * 添加评论
	 * @param comment
	 */
	public void addComment(Comment comment);
	
	
	/**
	 * 查询用户的评论数
	 * @return
	 */
	public long selectCountForUser(int userId);
	
	/**
	 * 查询新闻的评论数
	 * @param newsId
	 * @return
	 */
	public long selectCountForNews(int newsId);

}
