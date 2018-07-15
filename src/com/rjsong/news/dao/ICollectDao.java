package com.rjsong.news.dao;


import com.rjsong.news.entity.Collect;
import com.rjsong.news.entity.Page;

public interface ICollectDao {
	
	/**
	 * 添加收藏
	 * @param collect
	 */
	public void addCollect(Collect collect);
	
	
	/**
	 * 根据id取消收藏
	 * @param id
	 */
	public void deleteCollect(int collectId);
	
	/**
	 * 点击收藏或取消收藏
	 * @param collectId
	 */
	public void modifyCollectStatus(int collectId);
	
	
	/**
	 * 根据分页查询所有的收藏文章
	 * @param collectId
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page selectCollectByPage(int userId,String collectStatus,int pageNow, int pageSize);
	
	/**
	 * 查询某位用户收藏的新闻
	 * @param userId
	 * @param articleId
	 * @return
	 */
	public Collect selectCollect(int userId,int articleId);
	
	
	/**
	 * 查询单个收藏
	 * @param id
	 */
	public Collect selectCollectById(int collectId);
	
	
}
