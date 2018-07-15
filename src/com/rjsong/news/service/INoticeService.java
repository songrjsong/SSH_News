package com.rjsong.news.service;

import com.rjsong.news.entity.Notice;
import com.rjsong.news.entity.Page;

public interface INoticeService {
	
	/**
	 * 后台显示公告列表
	 * @param startTime
	 * @param endTime
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page queryNoticesByPage(String startTime,String endTime,int pageNow, int pageSize);
	
	/**
	 * 前台显示公告信息
	 * @return
	 */
	public Notice queryNotice();
	
	/**
	 * 后台管理员删除公告
	 * @param noticeId
	 */
	public void remove(int noticeId);
	/**
	 * 查询单个公告信息
	 * @param noticeId
	 * @return
	 */
	public Notice queryNoticeById(int noticeId);
	
	
	/**
	 * 发布公告
	 * @param notice
	 * 
	 */
	public void insertNotice(Notice notice);
	
	
	/**
	 * 修改公告信息
	 * @param noticeId 
	 */
	public void modefiyNotice(Notice notice);
}
