package com.rjsong.news.dao;

import com.rjsong.news.entity.Attention;
import com.rjsong.news.entity.Page;



public interface IAttentionDao {
	/**
	 * 第一次添加关注
	 * @param id
	 */
	public void addAttention(Attention attention);

	/**
	 * 根据id来取消关注
	 * @param id
	 */
	public void deleteAttention(int attentionId,int userId);
	
	/**
	 * 之后通过修改状态添加关注
	 */
	public void  updateAttenStatus(int attentionId,int userId);
	 
	/**
	 * 查询关注的好友
	 * @param userId
	 * @param pageNow
	 * @param PageSize
	 * @return
	 */
	public Page selectAttentionsByUser(int userId,int pageNow,int pageSize);
   
   
	public Attention selectAttentionById(int from_userId,int to_userId);
}
