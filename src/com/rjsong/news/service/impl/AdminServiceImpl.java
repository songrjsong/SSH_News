package com.rjsong.news.service.impl;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.rjsong.news.dao.IAdminDao;
import com.rjsong.news.entity.Admin;
import com.rjsong.news.service.IAdminService;

@Service("adminService")
@Transactional("txManager")
public class AdminServiceImpl implements IAdminService {
	IAdminDao adminDao;
	
	@Override
	public Admin queryAdminByName(String username) {
		
		return this.adminDao.selectAdminByName(username);
	}
	

	
	@Resource(name="adminDao")
	@Transient
	public void setAdminDao(IAdminDao adminDao) {
		this.adminDao = adminDao;
	}
}
