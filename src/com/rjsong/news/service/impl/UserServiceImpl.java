package com.rjsong.news.service.impl;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjsong.news.dao.IUserDao;
import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.User;
import com.rjsong.news.service.IUserService;

@Service("userService")
@Transactional("txManager")
public class UserServiceImpl implements IUserService{
	
	IUserDao userDao;

	@Override
	public void insertUser(User user) {
		this.userDao.addUser(user);
	}

	@Override
	public User queryUserById(int userId) {

		return this.userDao.selectUserById(userId);
	}

	@Override
	public User queryUserByCondition(String inputType) {
		return this.userDao.selectUserByCondition(inputType);
	}

	@Override
	public Page queryUserByPage(String queryCondition, String startTime,
			String endTime, int pageNow, int pageSize) {
		return this.userDao.selectUserByPage(queryCondition, startTime, endTime, pageNow, pageSize);
	}

	@Override
	public int queryNewsCountByUser(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.getNewsCountByUser(userId);
	}

	@Override
	public int queryCommentCountByUser(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.getCommentCountByUser(userId);
	}

	@Override
	public void modifyUser(User user) {
		// TODO Auto-generated method stub
		this.userDao.updateUser(user);
	}

	@Override
	public void modifyPass(int userId, String password) {
		this.userDao.updatePass(userId, password);
		
	}

	@Override
	public void modifyImg(int userId, String userImg) {
		this.userDao.updateImg(userId, userImg);
		
	}

	@Override
	public void user_Stop(int userId) {
		this.userDao.user_Stop(userId);
		
	}

	@Override
	public void user_Start(int userId) {
		this.userDao.user_Start(userId);
		
	}
	@Override
	public void user_Shenhe(int userId) {
		// TODO Auto-generated method stub
		this.userDao.user_shenhe(userId);
	}
	
	@Resource(name="userDao")
	@Transient
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	

}
