package com.rjsong.news.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.rjsong.news.dao.ICommentDao;
import com.rjsong.news.entity.Comment;
import com.rjsong.news.entity.Page;

@Repository("commentDao")
public class CommentDaoImpl implements ICommentDao {
	SessionFactory sessionFactory;
	
	/**
	 * 添加评论
	 */
	@Override
	public void addComment(Comment comment) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(comment);
	}
	
	/**
	 * 根据分页来查询评论过的文章
	 */
	@Override
	public Page selectCommentByPage(String inputCondition, String startTime,
			String endTime, int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Comment c where 1=1 ";
		if(null !=  inputCondition&& !"".equals(inputCondition.trim())){	
			hql += " and c.from_user.nickname like '%"+inputCondition+"%' or c.news.title like '%"+inputCondition+"%'";
		}
		
		if((startTime != null && !startTime.equals("")) && (endTime == null || "".equals(endTime.trim()))){
			hql += " and c.commentTime >= '"+startTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime == null || "".equals(startTime.trim()))){
			hql += " and c.commentTime <= '"+endTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime != null && !"".equals(endTime.trim()))){
			hql += " and c.commentTime between '"+startTime+"' and  '"+endTime+"' ";
		}
	
		Query query = session.createQuery(hql)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		
		List<Comment> comments = query.list();
		
		Page page = new Page();
		page.setComments(comments);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		
		int rowCount = (int) this.getRowCount(inputCondition,startTime,endTime);
		
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
	
	private long getRowCount(String inputCondition,String startTime,String endTime){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from Comment c where 1=1 ";
		if(null !=  inputCondition&& !"".equals(inputCondition.trim())){	
			hql += " and c.from_user.nickname like '%"+inputCondition+"%' or c.news.title like '%"+inputCondition+"%'";
		}
		
		if((startTime != null && !startTime.equals("")) && (endTime == null || "".equals(endTime.trim()))){
			hql += " and c.commentTime >= '"+startTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime == null || "".equals(startTime.trim()))){
			hql += " and c.commentTime <= '"+endTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime != null && !"".equals(endTime.trim()))){
			hql += " and c.commentTime between '"+startTime+"' and  '"+endTime+"' ";
		}
		Query query = session.createQuery(hql);
				
		long rowCount = (long) query.uniqueResult();
	
		return rowCount;
		
	}
	
	
	@Override
	public Page selectCommentByUser(int userId, int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Comment comm where comm.from_user.user_Id=:userId ";
		Query query = session.createQuery(hql)
				.setInteger("userId", userId)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		
		List<Comment> comments = query.list();
		
		Page page = new Page();
		page.setComments(comments);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		
		int rowCount = (int) this.getRowCountByUser(userId);
		
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
	

	
	private long getRowCountByUser(int userId){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from Comment comm where comm.from_user.user_Id =:userId";
		
		Query query = session.createQuery(hql).setInteger("userId", userId);
				
		long rowCount = (long) query.uniqueResult();
	
		return rowCount;
		
	}
	

	@Override
	public Page selectUiComment(int newsId, int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Comment comm where comm.news.news_Id=:newsId ";
		Query query = session.createQuery(hql)
				.setInteger("newsId", newsId)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		
		List<Comment> comments = query.list();
		Page page = new Page();
		page.setComments(comments);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		int rowCount = (int) this.getRowCountForUI(newsId);
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

	
	private long getRowCountForUI(int newsId){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from Comment comm where comm.news.news_Id =:newsId";
		Query query = session.createQuery(hql).setInteger("newsId", newsId);
		long rowCount = (long) query.uniqueResult();
		return rowCount;
		
	}
	
	
	/**
	 * 根据id删除评论
	 */
	@Override
	public void delete(int commentId) {
		this.sessionFactory.getCurrentSession()
		.createQuery("delete from Comment com where com.comment_Id=:commentId")
		.setInteger("commentId", commentId)
		.executeUpdate();
	}
	
	@Override
	public long selectCountForUser(int userId) {
		
		return (long) this.sessionFactory.getCurrentSession()
				.createQuery("select count(*) from Comment comm where  comm.from_user.user_Id=:userId")
				.setInteger("userId", userId)	
				.uniqueResult();
	}
	
	@Override
	public long selectCountForNews(int newsId) {
		// TODO Auto-generated method stub
		return (long) this.sessionFactory.getCurrentSession()
				.createQuery("select count(*) from Comment comm where  comm.news.news_Id=:newsId")
				.setInteger("newsId", newsId)	
				.uniqueResult();
	}
	
	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	
}
