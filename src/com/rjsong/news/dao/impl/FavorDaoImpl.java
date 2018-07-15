package com.rjsong.news.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.rjsong.news.dao.IFavorDao;
import com.rjsong.news.entity.Favor;
import com.rjsong.news.entity.Page;

@Repository("favorDao")
public class FavorDaoImpl implements IFavorDao {

	SessionFactory sessionFactory;
	
	@Override
	public Page selectFavorByPage(int userId,int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql ="from Favor f where f.user.user_Id=:userId and f.favor_Status = 1";
		Query query = session.createQuery(hql)
				.setInteger("userId", userId)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		 List<Favor> favors = query.list();
		Page page = new Page();
		page.setFavors(favors);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		
		int rowCount = (int) this.getRowCount(userId);
		int pageCount=0;
		
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
		String hql = "select count(*) from Favor f where f.user.user_Id=:userId and f.favor_Status = 1 ";
		Query query = session.createQuery(hql).setInteger("userId", userId);
		long rowCount = (long) query.uniqueResult();
		return rowCount;
	}
	
	@Override
	public Favor selectFavorById(int userId,int newsId) {

		  return (Favor) this.sessionFactory.getCurrentSession()
				.createQuery("from Favor f where f.user.user_Id=:userId and f.news.news_Id=:newsId")
				.setInteger("userId", userId)
				.setInteger("newsId", newsId)
				.uniqueResult();
	}
	
	@Override
	public long selectCountByFavor(int newsId) {
		// TODO Auto-generated method stub
		return (long) this.sessionFactory.getCurrentSession()
				.createQuery("select count(*) from Favor f where  f.news.news_Id=:newsId")
				.setInteger("newsId", newsId)	
				.uniqueResult();
	}

	
	@Override
	public void addFavor(Favor favor) {
		this.sessionFactory.getCurrentSession()
		.saveOrUpdate(favor);

	}

	//取消点赞
	@Override
	public void cancleFavor(int newsId,int userId) {
		
		this.sessionFactory.getCurrentSession()
		.createQuery("update Favor f set f.favor_Status=0 where f.news.news_Id=:newsId and f.user.user_Id=:userId")
		.setInteger("newsId", newsId)
		.setInteger("userId", userId)
		.executeUpdate();

	}
	
	@Override
	public void deleteFavor(int favorId) {
		this.sessionFactory.getCurrentSession()
			.createQuery("update Favor f set f.favor_Status=0 where f.favor_Id=:favorId")
			.setInteger("favorId", favorId)
			.executeUpdate();
		
	}
	
	
	
	@Override
	public void modifyStatus(int newsId, int userId) {
		
		this.sessionFactory.getCurrentSession()
		.createQuery("update Favor f  set f.favor_Status=1 where f.news.news_Id=:newsId and f.user.user_Id=:userId")
		.setInteger("newsId", newsId)
		.setInteger("userId", userId)
		.executeUpdate();
	}

	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
}
