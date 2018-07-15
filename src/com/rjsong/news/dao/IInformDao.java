package com.rjsong.news.dao;

import com.rjsong.news.entity.Inform;
import com.rjsong.news.entity.Page;

public interface IInformDao {
	
	
	/**
	 * 
	 * @param inputCondition 举报用户，新闻标题
	 * @param startTime
	 * @param endTime
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page selectInformByPage(String inputCondition,String startTime,String endTime,int pageNow, int pageSize);
	
	/**
	 * 添加举报信息
	 * @param inform
	 */
	public void addInform(Inform inform);
	
	
	/**
	 * 删除举报列表信息
	 * @param userId
	 */
	void delete(int informId);
}