package com.rjsong.news.dao;

import com.rjsong.news.entity.Notice;
import com.rjsong.news.entity.Page;

public interface INoticeDao {
	
	/**
	 * 后台公告显示列表
	 * @param startTime
	 * @param endTime
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page selectNoticesByPage(String startTime,String endTime,int pageNow, int pageSize);
	
	/**
	 * 前台显示最新发布公告信息
	 * @return
	 */
	public Notice selectNotice();
	
	/**
	 * 后台管理员删除公告
	 * @param noticeId
	 */
	public void delete(int noticeId);
	
	/**
	 * 查询单个公告信息
	 * @param noticeId
	 * @return
	 */
	public Notice selectNoticeById(int noticeId);
	
	
	/**
	 * 发布公告
	 * @param notice
	 * 
	 */
	public void addNotice(Notice notice);
	
	
	/**
	 * 修改公告信息
	 * @param noticeId 
	 */
	public void updateNotice(Notice notice);
	
	
}
