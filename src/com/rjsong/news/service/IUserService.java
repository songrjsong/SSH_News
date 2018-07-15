package com.rjsong.news.service;

import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.User;

public interface IUserService {
	/**
	 * 添加用户
	 * @param user
	 */
	public void insertUser(User user);
	
	/**
	 * 分页查询用户信息
	 * @param nickname
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	
	/**
	 * 根据Id查询
	 * @param userId
	 * @return
	 */
	public User queryUserById(int userId);

	/**
	 * 根据用户名，手机号，或邮箱查询到用户
	 * @param queryType
	 * @return
	 */
	public User queryUserByCondition(String inputType);
	
	
	/**
	 * 分页查询用户
	 * @param queryCondition
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page queryUserByPage(String queryCondition, String startTime, String endTime, int pageNow, int pageSize);
		
	/**
	 * 查询某位用户发表的新闻
	 * @param userId
	 * @return
	 */
	public int queryNewsCountByUser(int userId);
	
	
	/**
	 * 查询某位用户评论新闻的数量
	 * @param userId
	 * @return
	 */
	public int queryCommentCountByUser(int userId);
	
	/**
	 * 修改个人信息
	 * @param id
	 * @return 
	 */
	public void modifyUser(User user);
	
	
	/**
	 * 修改密码
	 * @param userId
	 * @param password
	 */
	public void modifyPass(int userId,String password);
	
	/**
	 * 修改头像
	 * @param userId
	 * @param userImg
	 */
	public void modifyImg(int userId,String userImg);
	
	/**
	 * 冻结用户
	 * @param userid
	 */
	public void user_Stop(int userId);
	
	/**
	 * 解冻用户
	 * @param userid
	 */
	public void user_Start(int userId);
	
	/**
	 * 作者审核
	 * @param userId
	 */
	public void user_Shenhe(int userId);
}
