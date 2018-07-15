package com.rjsong.news.dao;

import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.User;

public interface IUserDao {
	
	/**
	 * 添加用户
	 * @param user
	 */
	public void addUser(User user);
	/**
	 * 根据Id查询
	 * @param userId
	 * @return
	 */
	public User selectUserById(int userId);
	
	
	/**
	 * 根据 手机号，或邮箱查询到用户
	 * @param queryType
	 * @return
	 */
	public User selectUserByCondition(String inputType);
	
	/**
	 * 分页查询用户
	 * @param queryCondition
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page selectUserByPage(String queryCondition,String startTime,String endTime,int pageNow, int pageSize);
	
	/**
	 * 查询某位用户发表新闻的数量
	 * @param userid
	 * @return
	 */
	public int getNewsCountByUser(int userId);
	
	
	/**
	 * 查询某位用户评新闻的数量
	 * @param userid
	 * @return
	 */
	public int getCommentCountByUser(int userId);
	
	/**
	 * 修改个人信息
	 * @param id
	 * @return 
	 */
	public void updateUser(User user);
	
	/**
	 * 修改密码
	 * @param user
	 */
	public void updatePass(int userId,String password);
	
	/**
	 * 修改用户头像
	 * @param user
	 */
	public void updateImg(int userId,String userImg);
	
	/**
	 * 停用用户
	 * @param userId
	 */
	public void user_Stop(int userId);
	
	/**
	 * 启用用户
	 * @param userId
	 */
	public void user_Start(int userId);
	
	/**
	 * 作者审核
	 * @param userId
	 */
	public void user_shenhe(int userId);
	

}
