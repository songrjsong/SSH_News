package com.rjsong.news.service;

import com.rjsong.news.entity.Favor;
import com.rjsong.news.entity.Page;



public interface IFavorService {
	
	
	public Page queryFavorsByPage(int userId,int pageNow, int pageSize);
	
	/**
	 * 查询某个点赞过的新闻
	 * @param likeId
	 * @return
	 */
	public Favor queryFavorById(int userId,int newsId);
	
	/**
	 * 查询某篇文章的点赞数目
	 * @param newsId
	 * @return
	 */
	public long queryCountByFavor(int newsId);
	
	/**
	 * 添加点赞
	 * @param newsId 新闻Id
	 */
	public void insertFavor(Favor favor);
	
	/**
	 * 取消点赞Id
	 */
	public void removeFavor(int newsId,int userId);
	
	/**
	 * 删除点赞Id
	 */
	public void removeFavor2(int favorId);
	
	/**
	 * 更改点赞状态
	 * @param articleId
	 * @param userId
	 */
	public void updateStatus(int newsId,int userId);
}
