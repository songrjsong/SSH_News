package com.rjsong.news.service;

import com.rjsong.news.entity.Admin;

public interface IAdminService {
	
	/**
	 * 查询管理员
	 * @param username
	 */	
	public Admin queryAdminByName(String username);
}
