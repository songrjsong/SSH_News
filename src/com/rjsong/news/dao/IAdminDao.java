package com.rjsong.news.dao;

import com.rjsong.news.entity.Admin;

public interface IAdminDao {

	/**
	 * 查询管理员
	 * @param username
	 */
	public Admin selectAdminByName(String username);

}
