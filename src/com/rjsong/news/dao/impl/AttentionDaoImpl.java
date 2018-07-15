package com.rjsong.news.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.rjsong.news.dao.IAttentionDao;
import com.rjsong.news.entity.Attention;
import com.rjsong.news.entity.Page;

@Repository("attentionDao")
public class AttentionDaoImpl implements IAttentionDao {
	SessionFactory sessionFactory;
	
	
	@Override
	public void addAttention(Attention attention) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(attention);

	}

	@Override
	public void deleteAttention(int attentionId,int userId) {
		
		this.sessionFactory.getCurrentSession()
			.createQuery("update Attention att  set att.status =0 where att.attention_Id=:attentionId and att.from_user.user_Id =:userId")
			.setInteger("attentionId", attentionId)
			.setInteger("userId", userId)
			.executeUpdate();
		
	}
	
	@Override
	public void updateAttenStatus(int attentionId,int userId) {
		
		this.sessionFactory.getCurrentSession()
			.createQuery("update Attention att  set att.status =1 where att.attention_Id=:attentionId and att.from_user.user_Id =:userId")
			.setInteger("attentionId", attentionId)
			.setInteger("userId", userId)
			.executeUpdate();
		
	}

	@Override
	public Page selectAttentionsByUser(int userId, int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Attention att where att.from_user.user_Id =:userId and att.status = 1";
		Query query = session.createQuery(hql)
				.setInteger("userId", userId)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		
		List<Attention> attentions = query.list();
		Page page = new Page();
		page.setAttentions(attentions);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		int rowCount = (int) this.getRowCount(userId);
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
	
	private long getRowCount(int userId){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from Attention att where att.from_user.user_Id =:userId and att.status = 1";	
		Query query = session.createQuery(hql)
				.setInteger("userId", userId);
				
		long rowCount = (long) query.uniqueResult();
	
		return rowCount;
	}
	
	@Override
	public Attention selectAttentionById(int from_userId,int to_userId){
		return (Attention) this.sessionFactory.getCurrentSession()
				.createQuery("from Attention atten where atten.from_user.user_Id=:from_userId and atten.to_user.user_Id=:to_userId")
				.setInteger("from_userId", from_userId)
				.setInteger("to_userId", to_userId)
				.uniqueResult();
	}
	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
