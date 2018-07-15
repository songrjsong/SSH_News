package com.rjsong.news.dao;

import com.rjsong.news.entity.Feedback;
import com.rjsong.news.entity.Page;

public interface IFeedbackDao {

	/**
	 * 查询反馈信息
	 * @param nickname
	 * @param startTime
	 * @param endTime
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page selectFeedBackByPage(String nickname,String startTime,String endTime,int pageNow, int pageSize);
	
	/**
	 * 添加反馈
	 * @param feedback
	 */
	public void addFeedback(Feedback feedback);
	
	/**
	 * 删除反馈
	 * @param feedbackId
	 */
	public void delete(int feedbackId);

}
