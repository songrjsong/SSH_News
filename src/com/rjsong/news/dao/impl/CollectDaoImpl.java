package com.rjsong.news.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.rjsong.news.dao.ICollectDao;
import com.rjsong.news.entity.Collect;
import com.rjsong.news.entity.Page;



@Repository("collectDao")
public class CollectDaoImpl implements ICollectDao {
	SessionFactory sessionFactory;

	@Override
	public void addCollect(Collect collect) {
		this.sessionFactory.getCurrentSession()
		.saveOrUpdate(collect);

	}

	@Override
	public void deleteCollect(int collectId) {
		this.sessionFactory.getCurrentSession()
		.createQuery("update Collect col set col.collectStatus=0 where col.collect_Id=:collectId")
		.setInteger("collectId", collectId)
		.executeUpdate();

	}
	
	@Override
	public void modifyCollectStatus(int collectId) {
		this.sessionFactory.getCurrentSession()
		.createQuery("update Collect col set col.collectStatus=1 where col.collect_Id=:collectId ")
		.setInteger("collectId", collectId)
		.executeUpdate();
		
	}


	@Override
	public Page selectCollectByPage(int userId,String collectStatus,int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql =  "from Collect col where col.user.user_Id=:userId and col.collectStatus = 1";
		Query query = session.createQuery(hql)
				.setInteger("userId", userId)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		List<Collect> collects =query.list();
		Page page = new Page();
		page.setCollects(collects);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		
		int rowCount = (int) this.getRowCount(userId,collectStatus);
		
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
	private long getRowCount(int userId,String collectStatus){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from Collect col where col.user.user_Id =:userId and col.collectStatus = 1 ";
		Query query = session.createQuery(hql).setInteger("userId", userId);
		long rowCount = (long) query.uniqueResult();
		
		return rowCount;
	}
	
	@Override
	public Collect selectCollect(int userId, int newsId) {
		
		 return (Collect) this.sessionFactory.getCurrentSession()
					.createQuery("from Collect coll where coll.user.user_Id=:userId and coll.news.news_Id=:newsId")
					.setInteger("userId", userId)
					.setInteger("newsId", newsId)
					.uniqueResult();
	}
	

	@Override
	public Collect selectCollectById(int collectId) {
		
		return (Collect)this.sessionFactory.getCurrentSession()
				.createQuery("from Collect col where col.collect_Id=:collectId")
				.uniqueResult();
	}

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	
	
}
