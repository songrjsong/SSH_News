package com.rjsong.news.service;

import java.util.List;

import com.rjsong.news.entity.News;
import com.rjsong.news.entity.Page;

public interface INewsService {
	
	/**
	 * 后台文章列表显示
	 * @param nickname  作者昵称
	 * @param typeName  类别
	 * @param startTime 起始时间
	 * @param endTime	截止时间
	 * @param title 	标题名称
	 * @param pageNow   
	 * @param pageSize
	 * @return
	 */
	public Page queryNewsByCondtion(String nickname,String typeName,String startTime,String endTime,String title,int pageNow, int pageSize);
	
	/**
	 * 查询所有发布的新闻显示在前台
	 * @param status 新闻状态
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page queryNewsByStatus(int pageNow, int pageSize);
	
	/**
	 * 前台用户通过关键字搜索新闻
	 * @param inputTag 关键字
	 * @return
	 */
	public Page queryNewsByInputTag(String inputTag,int pageNow, int pageSize);
	
	/**
	 * 热点新闻推荐
	 * @return
	 */
	public List<News> queryNewsByRecommend();
	
	/**
	 * 个人中心动态显示新闻
	 * @param userId
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page queryNewsByUserId(int userId,int pageNow, int pageSize);
	
	
	/**
	 * 前台显示不同类型的新闻
	 * @param type
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page queryNewsByType(String typeName,int pageNow, int pageSize);
	
	/**
	 * 发表新闻
	 * @param news
	 */
	public void insertNews(News news);
	
	/**
	 * 删除新闻
	 * @param newsId
	 */
	public void remove(int newsId);
	
	/**
	 * 审核新闻是否发布
	 * @param newsId
	 */
	public void shenhe(int newsId);
	
	/**
	 * 查询新闻
	 * @param newsId
	 * @return
	 */
	public News queryNewsById(int newsId);
	
	/**
	 * 修改新闻
	 * @param news
	 */
	public void modifyNews(News news);
}
