package com.rjsong.news.dao.impl;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.rjsong.news.dao.IAdminDao;
import com.rjsong.news.entity.Admin;


@Repository("adminDao")
public class AdminDaoImpl implements IAdminDao{
	SessionFactory sessionFactory;
	
	@Override
	public Admin selectAdminByName(String username) {
		
		return (Admin) this.sessionFactory.getCurrentSession()
				.createQuery("from Admin ad where ad.username = :username")
				.setString("username", username)
				.uniqueResult();
	}
	
	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
