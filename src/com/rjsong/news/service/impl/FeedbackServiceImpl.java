package com.rjsong.news.service.impl;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjsong.news.dao.IFeedbackDao;
import com.rjsong.news.entity.Feedback;
import com.rjsong.news.entity.Page;
import com.rjsong.news.service.IFeedbackService;

@Service("feedbackService")
@Transactional("txManager")
public class FeedbackServiceImpl implements IFeedbackService {
	
	IFeedbackDao feedbackDao;
	
	@Override
	public Page queryFeedBackByPage(String nickname, String startTime,
			String endTime, int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.feedbackDao.selectFeedBackByPage(nickname, startTime, endTime, pageNow, pageSize);
	}
	

	@Override
	public void InsertFeedback(Feedback feedback) {
		// TODO Auto-generated method stub
		 this.feedbackDao.addFeedback(feedback);
	}


	@Override
	public void remove(int feedbackId) {
		this.feedbackDao.delete(feedbackId);
		
	}
	
	
	@Resource(name="feedbackDao")
	@Transient
	public void setFeedbackDao(IFeedbackDao feedbackDao) {
		this.feedbackDao = feedbackDao;
	}

	
}
