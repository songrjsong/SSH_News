package com.rjsong.news.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.rjsong.news.dao.INewsDao;
import com.rjsong.news.entity.News;
import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.User;

@Repository("newsDao")
public class NewsDaoImpl implements INewsDao {
	
	SessionFactory sessionFactory;
	

	@Override
	public Page selectNewsByCondtion(String nickname, String typeName,String startTime, String endTime, String title, int pageNow,int pageSize) {
		
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from News n where 1=1 ";
		if(null !=  nickname&& !"".equals(nickname.trim())){	
			hql += " and n.user.nickname= '"+nickname+"' ";	
		}
		if(null !=  typeName&& !"".equals(typeName.trim())){	
			hql += " and n.type.typeName= '"+typeName+"' ";	
		}
		if((startTime != null && !startTime.equals("")) && (endTime == null || "".equals(endTime.trim()))){
			hql += " and n.createTime >= '"+startTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime == null || "".equals(startTime.trim()))){
			hql += " and n.createTime <= '"+endTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime != null && !"".equals(endTime.trim()))){
			hql += " and n.createTime between '"+startTime+"' and  '"+endTime+"' ";
		}
		if(null !=  title&& !"".equals(title.trim())){	
			hql += " and n.title= '"+title+"' ";	
		}
		Query query = session.createQuery(hql)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		
		List<News> news = query.list();
		
		Page page = new Page();
		page.setNews(news);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		
		int rowCount = (int) this.getRowCount(nickname,typeName,startTime,endTime,title);
		
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
	
	
	private long getRowCount(String nickname, String typeName,String startTime, String endTime, String title){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from News n where 1=1 ";		
		if(null !=  nickname&& !"".equals(nickname.trim())){	
			hql += " and n.user.nickname= '"+nickname+"' ";	
		}
		if(null !=  typeName&& !"".equals(typeName.trim())){	
			hql += " and n.type.typeName= '"+typeName+"' ";	
		}
		if((startTime != null && !startTime.equals("")) && (endTime == null || "".equals(endTime.trim()))){
			hql += " and n.createTime >= '"+startTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime == null || "".equals(startTime.trim()))){
			hql += " and n.createTime <= '"+endTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime != null && !"".equals(endTime.trim()))){
			hql += " and n.createTime between '"+startTime+"' and  '"+endTime+"' ";
		}
		if(null !=  title&& !"".equals(title.trim())){	
			hql += " and n.title= '"+title+"' ";	
		}
		Query query = session.createQuery(hql);
		long rowCount = (long) query.uniqueResult();
		return rowCount;
		
	}
	

	@Override
	public Page selectNewsByStatus( int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from News n where n.status = 1  order by n.createTime desc,n.lookCount desc";
		Query query = session.createQuery(hql)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		List<News> news = query.list();
		Page page = new Page();
		page.setNews(news);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);	
		int rowCount = (int) this.getRowCountByStatus();	
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
	
	private long getRowCountByStatus(){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from News n where n.status = 1";		
		Query query = session.createQuery(hql);
		long rowCount = (long) query.uniqueResult();
		return rowCount;
		
	}
	

	@Override
	public Page selectNewsByInputTag(String inputTag,int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from News n where 1=1 ";		
		if(null != inputTag && !"".equals(inputTag.trim())){	
			hql += " and n.title like '%"+inputTag+"%' ";	
		}
		Query query = session.createQuery(hql)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		List<News> news = query.list();
		Page page = new Page();
		page.setNews(news);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);	
		int rowCount = (int) this.getRowCountByTag(inputTag);	
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


	private long getRowCountByTag(String inputTag){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from News n where 1=1";	
		if(null != inputTag && !"".equals(inputTag.trim())){	
			hql += " and n.title like '%"+inputTag+"%' ";	
		}
		Query query = session.createQuery(hql);
		long rowCount = (long) query.uniqueResult();
		return rowCount;
		
	}
	
	
	@Override
	public List<News> selectNewsByRecommend() {
		String hql = "from News n where n.status= 1 order by n.lookCount desc,n.favorCount desc,n.commentCount desc";
		Query query =  this.sessionFactory.getCurrentSession().createQuery(hql)
					.setFirstResult(0)
					.setMaxResults(8);
		List<News> newss = query.list();		
		return newss;					
	}

	@Override
	public Page selectNewsByUserId(int userId, int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from News n where n.user.user_Id =:userId and n.status=1 order by n.createTime desc";				
		Query query = session.createQuery(hql)
				.setInteger("userId", userId)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		List<News> news = query.list();
		Page page = new Page();
		page.setNews(news);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);	
		int rowCount = (int) this.getRowCountUserId(userId);	
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

	private long getRowCountUserId(int userId){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from News n where n.user.user_Id=:userId";	
		Query query = session.createQuery(hql).setInteger("userId", userId);
		long rowCount = (long) query.uniqueResult();
		return rowCount;
		
	}
	

	@Override
	public Page selectNewsByType(String typeName, int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from News n where n.type.typeName =:typeName and n.status=1 order by n.createTime desc";				
		Query query = session.createQuery(hql)
				.setString("typeName", typeName)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		List<News> news = query.list();
		Page page = new Page();
		page.setNews(news);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);	
		int rowCount = (int) this.getRowCountByType(typeName);	
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

	private long getRowCountByType(String typeName){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from News n where n.type.typeName=:typeName";	
		Query query = session.createQuery(hql).setString("typeName", typeName);
		long rowCount = (long) query.uniqueResult();
		return rowCount;
		
	}

	@Override
	public void addNews(News news) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().save(news);
	}

	
	@Override
	public void delete(int newsId) {
		this.sessionFactory.getCurrentSession().createQuery("update News n set n.status = '0' where n.news_Id =:newsId")
			.setInteger("newsId", newsId)
			.executeUpdate();
	}


	@Override
	public void shenhe(int newsId) {
		this.sessionFactory.getCurrentSession().createQuery("update News n set n.status = '1' where n.news_Id =:newsId")
			.setInteger("newsId", newsId)
			.executeUpdate();
		
	}
	

	@Override
	public News selectNewsById(int newsId) {
		return (News) this.sessionFactory.getCurrentSession().createQuery("from News n where n.news_Id=:newsId")
			.setInteger("newsId", newsId)
			.uniqueResult();
	}
	

	@Override
	public void updateNews(News news) {
		this.sessionFactory.getCurrentSession().update(news);
		
	}


	

	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	
}
