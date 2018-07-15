package com.rjsong.news.service.impl;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjsong.news.dao.INoticeDao;
import com.rjsong.news.entity.Notice;
import com.rjsong.news.entity.Page;
import com.rjsong.news.service.INoticeService;

@Service("noticeService")
@Transactional("txManager")
public class NoticeServiceImpl implements INoticeService {
	
	INoticeDao noticeDao;
	
	@Override
	public Page queryNoticesByPage(String startTime, String endTime,
			int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.noticeDao.selectNoticesByPage(startTime, endTime, pageNow, pageSize);
	}
	
	@Override
	public void remove(int noticeId) {
		this.noticeDao.delete(noticeId);
		
	}
	
	@Override
	public Notice queryNoticeById(int noticeId) {
		
		return this.noticeDao.selectNoticeById(noticeId);
	}

	@Override
	public void insertNotice(Notice notice) {
		
		this.noticeDao.addNotice(notice);

	}

	@Override
	public void modefiyNotice(Notice notice) {
		
		this.noticeDao.updateNotice(notice);
	}
	

	@Override
	public Notice queryNotice() {
		// TODO Auto-generated method stub
		return this.noticeDao.selectNotice();
	}

	
	@Resource(name="noticeDao")
	@Transient
	public void setNoticeDao(INoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	
}
