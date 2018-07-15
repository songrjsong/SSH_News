package com.rjsong.news.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;


import com.rjsong.news.dao.IUserDao;
import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.User;


@Repository("userDao")
public class UserDaoImpl  implements IUserDao{
	
	SessionFactory sessionFactory;

	@Override
	public void addUser(User user) {
		
		this.sessionFactory.getCurrentSession().save(user);
		
	}

	@Override
	public User selectUserById(int userId) {
		
		return (User) this.sessionFactory.getCurrentSession()
				.createQuery("from User u where u.user_Id=:userId")
				.setInteger("userId", userId)
				.uniqueResult();
	}

	@Override
	public User selectUserByCondition(String inputType) {
		
		return (User) this.sessionFactory.getCurrentSession()
				.createQuery("from User u where u.tel=:inputType or u.email=:inputType")
				.setString("inputType",inputType)
				.uniqueResult();
	}

	@Override
	public Page selectUserByPage(String queryCondition,String startTime,String endTime, int pageNow,int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from User u where 1=1 ";
		if(null != queryCondition && !"".equals(queryCondition.trim())){	
			hql += " and u.name like '%"+queryCondition+"%' or u.email like '%"+queryCondition+"%' or u.tel like '%"+queryCondition+"%'";	
		}
		if((startTime != null && !startTime.equals("")) && (endTime == null || "".equals(endTime.trim()))){
			hql += " and u.regTime >= '"+startTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime == null || "".equals(startTime.trim()))){
			hql += " and u.regTime <= '"+endTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime != null && !"".equals(endTime.trim()))){
			hql += " and u.regTime between '"+startTime+"' and  '"+endTime+"' ";
		}
		Query query = session.createQuery(hql)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		
		List<User> users = query.list();
		
		Page page = new Page();
		page.setUsers(users);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		
		int rowCount = (int) this.getRowCount(queryCondition,startTime,endTime);
		
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
	
	private long getRowCount(String queryCondition,String startTime,String endTime){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from User u where 1=1 ";
		if(null != queryCondition && !"".equals(queryCondition.trim())){	
			hql += " and u.name like '%"+queryCondition+"%' or u.email like '%"+queryCondition+"%' or u.tel like '%"+queryCondition+"%'";	
		}
		if((startTime != null && !startTime.equals("")) && (endTime == null || "".equals(endTime.trim()))){
			hql += " and u.regTime >= '"+startTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime == null || "".equals(startTime.trim()))){
			hql += " and u.regTime <= '"+endTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime != null && !"".equals(endTime.trim()))){
			hql += " and u.regTime between '"+startTime+"' and  '"+endTime+"' ";
		}
		Query query = session.createQuery(hql);
				
		long rowCount = (long) query.uniqueResult();
	
		return rowCount;
		
	}
	
	

	@Override
	public int getNewsCountByUser(int userId) {
		String hql="select count(*) from News n where n.user.user_Id=:userId";
		Session session = this.sessionFactory.getCurrentSession();
		long articleCount = (long) session.createQuery(hql)
				.setInteger("userId", userId)
				.uniqueResult();
		return (int) articleCount;
	}

	@Override
	public int getCommentCountByUser(int userId) {
		String hql="select count(*) from Comment comm where comm.from_user.user_Id=:userId";
		Session session = this.sessionFactory.getCurrentSession();
		long comment_Count =  (long) session.createQuery(hql)
				.setInteger("userId", userId)
				.uniqueResult();
		return (int) comment_Count;
	}

	@Override
	public void updateUser(User user) {
		
	//	String hql="update User u set u.nickname=";
		this.sessionFactory.getCurrentSession().update(user);
	}

	@Override
	public void updatePass(int userId, String password) {
		String hql = "update User u set u.password =:password where u.user_Id=:userId";
        this.sessionFactory.getCurrentSession().createQuery(hql)
        .setString("password", password)
        .setInteger("userId", userId)
        .executeUpdate(); 
		
	}

	@Override
	public void updateImg(int userId, String userImg) {
		String hql = "update User u set u.image =:userImg where u.user_Id=:userId";
        this.sessionFactory.getCurrentSession().createQuery(hql)
        .setString("userImg", userImg)
        .setInteger("userId", userId)
        .executeUpdate(); 
		
	}

	@Override
	public void user_Stop(int userId) {
		Session session = this.sessionFactory.getCurrentSession();
		session.createQuery("update User u set u.status = '0' where u.user_Id = :userId ")
		.setInteger("userId", userId)
		.executeUpdate();
		
	}

	@Override
	public void user_Start(int userId) {
		Session session = this.sessionFactory.getCurrentSession();
		session.createQuery("update User u set u.status = '1' where u.user_Id = :userId ")
		.setInteger("userId", userId)
		.executeUpdate();
		
	}
	
	@Override
	public void user_shenhe(int userId) {
		Session session = this.sessionFactory.getCurrentSession();
		session.createQuery("update User u set u.is_editor = '1' where u.user_Id = :userId ")
		.setInteger("userId", userId)
		.executeUpdate();
		
	}

	

	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	

}
