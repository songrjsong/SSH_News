package com.rjsong.news.service;

import com.rjsong.news.entity.Collect;
import com.rjsong.news.entity.Page;



public interface ICollectService {

	/**
	 * 添加收藏
	 * @param collect
	 */
	public void insertCollect(Collect collect);
	
	
	/**
	 * 根据id取消收藏
	 * @param id
	 */
	public void removeCollect(int collectId);
	
	/**
	 * 点击收藏或取消收藏
	 * @param collectId
	 */
	public void updateCollectStatus(int collectId);
	
	/**
	 * 根据分页查询所有的书藏
	 * @param collectId
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page queryCollectByPage(int userId,String collectStatus,int pageNow, int pageSize);
	
	
	
	public Collect queryCollById(int userId,int articleId);
	
	
	/**
	 * 查询单个收藏
	 * @param id
	 */
	public Collect queryCollectById(int collectId);
	
}
