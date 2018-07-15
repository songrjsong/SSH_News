package com.rjsong.news.service;

import com.rjsong.news.entity.Inform;
import com.rjsong.news.entity.Page;

public interface IInformService {
	
	/**
	 * 分页查询举报对象集合
	 * @param inputCondition
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page queryInformByPage(String inputCondition, String startTime, String endTime, int pageNow, int pageSize);
	
	/**
	 * 添加举报信息
	 * @param inform
	 */
	public void insertInform(Inform inform);
	
	/**
	 * 删除举报信息
	 * @param informId
	 */
	public void remove(int informId);

}
