package com.rjsong.news.service;

import com.rjsong.news.entity.Feedback;
import com.rjsong.news.entity.Page;

public interface IFeedbackService {
	
	/**
	 * 查询反馈信息
	 * @param nickname
	 * @param startTime
	 * @param endTime
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page queryFeedBackByPage(String nickname,String startTime,String endTime,int pageNow, int pageSize);
	
	/**
	 * 添加反馈
	 * @param feedback
	 */
	public void InsertFeedback(Feedback feedback);
	
	/**
	 * 删除反馈
	 * @param feedbackId
	 */
	public void remove(int feedbackId);
}
