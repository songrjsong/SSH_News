package com.rjsong.news.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.rjsong.news.dao.IFeedbackDao;
import com.rjsong.news.entity.Feedback;
import com.rjsong.news.entity.Inform;
import com.rjsong.news.entity.Page;

@Repository("feedbackDao")
public class FeedbackDaoImpl implements IFeedbackDao {
	
	SessionFactory sessionFactory;

	@Override
	public Page selectFeedBackByPage(String nickname, String startTime,
			String endTime, int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Feedback fb where 1=1 ";
		if(null !=  nickname&& !"".equals(nickname.trim())){	
			hql += " and fb.user.nickname like '%"+nickname+"%'";
		}
		
		if((startTime != null && !startTime.equals("")) && (endTime == null || "".equals(endTime.trim()))){
			hql += " and fb.fbTime >= '"+startTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime == null || "".equals(startTime.trim()))){
			hql += " and fb.fbTime <= '"+endTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime != null && !"".equals(endTime.trim()))){
			hql += " and fb.fbTime between '"+startTime+"' and  '"+endTime+"' ";
		}
	
		Query query = session.createQuery(hql)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		
		List<Feedback> feedbacks = query.list();
		
		Page page = new Page();
		page.setFeedbacks(feedbacks);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		
		int rowCount = (int) this.getRowCount(nickname,startTime,endTime);
		
		int pageCount = 0;
		if(rowCount % pageSize == 0){
			pageCount = rowCount / pageSize;
		}else {
			pageCount = rowCount / pageSize + 1;
		}
		
		page.setPageCount(pageCount);
		page.setRowCount(rowCount);
		
		return page;
	}
	
	private long getRowCount(String nickname,String startTime,String endTime){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from Feedback fb where 1=1 ";
		if(null !=  nickname&& !"".equals(nickname.trim())){	
			hql += " and fb.user.nickname like '%"+nickname+"%'";
		}
		if((startTime != null && !startTime.equals("")) && (endTime == null || "".equals(endTime.trim()))){
			hql += " and fb.fbTime >= '"+startTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime == null || "".equals(startTime.trim()))){
			hql += " and fb.fbTime <= '"+endTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime != null && !"".equals(endTime.trim()))){
			hql += " and fb.fbTime between '"+startTime+"' and  '"+endTime+"' ";
		}
		Query query = session.createQuery(hql);
				
		long rowCount = (long) query.uniqueResult();
	
		return rowCount;
		
	}
	

	@Override
	public void addFeedback(Feedback feedback) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().save(feedback);
	}

	
	@Override
	public void delete(int feedbackId) {
		this.sessionFactory.getCurrentSession().createQuery("delete from Feedback fb where fb.feedback_Id=:feedbackId")
		.setInteger("feedbackId", feedbackId)
		.executeUpdate();
		
	}
	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
}
