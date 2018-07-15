package com.rjsong.news.service;

import com.rjsong.news.entity.Attention;
import com.rjsong.news.entity.Page;



public interface IAttentionService {
	
	/**
	 * 添加关注
	 * @param id
	 */
	public void InsertAttention(Attention attention);
	

	/**
	 * 根据id来取消关注
	 * @param id
	 */
	public void removeAttention(int attentionId,int userId);
	
	/**
	 * 修改关注状态
	 * @param attentionId
	 * @param userId
	 */
	public void ModifyAttenStatus(int attentionId,int userId);
	/**
	 * 查询关注的好友
	 * @param nickname
	 * @param pageNow
	 * @param PageSize
	 * @return
	 */
	public Page queryAttentionsByUser(int userId,int pageNow,int pageSize);
	
	/**
	 * 
	 * @param from_userId
	 * @param to_userId
	 * @return
	 */
	public Attention queryAttentionById(int from_userId,int to_userId);
}
