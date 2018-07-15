package com.rjsong.news.dao;

import com.rjsong.news.entity.Favor;
import com.rjsong.news.entity.Page;



public interface IFavorDao {
	
	/**
	 * 根据点赞状态查询所有的文章信息
	 * @param status  状态
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page selectFavorByPage(int userId,int pageNow, int pageSize);
	
	/**
	 * 查询点赞记录
	 * @param favorId
	 * @return
	 */
	public Favor selectFavorById(int userId,int newsId);
	
	/**
	 * 查询某用户的点赞次数
	 * @param newsId
	 * @return
	 */
	public long selectCountByFavor(int newsId);
	
	/**
	 * 添加点赞
	 * @param 
	 */
	public void addFavor(Favor favor);
	
	/**
	 * 取消点赞Id
	 */
	public void cancleFavor(int newsId,int userId);
	
	/**
	 * 删除点赞
	 * @param favorId
	 */
	public void deleteFavor(int favorId);
	
	
	/**
	 * 改变点赞状态
	 */
	public void modifyStatus(int newsId,int userId);
}
