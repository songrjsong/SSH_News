package com.rjsong.news.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjsong.news.dao.INewsDao;
import com.rjsong.news.entity.News;
import com.rjsong.news.entity.Page;
import com.rjsong.news.service.INewsService;


@Service("newsService")
@Transactional("txManager")
public class NewsServiceImpl implements INewsService {
	
	INewsDao newsDao;

	@Override
	public Page queryNewsByCondtion(String nickname, String typeName,String startTime, String endTime, String title, int pageNow,int pageSize) {
		return this.newsDao.selectNewsByCondtion(nickname, typeName, startTime, endTime, title, pageNow, pageSize);
	}

	@Override
	public Page queryNewsByStatus(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.newsDao.selectNewsByStatus(pageNow, pageSize);
	}

	@Override
	public Page queryNewsByInputTag(String inputTag, int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.newsDao.selectNewsByInputTag(inputTag, pageNow, pageSize);
	}

	@Override
	public List<News> queryNewsByRecommend() {
		// TODO Auto-generated method stub
		return this.newsDao.selectNewsByRecommend();
	}
	
	@Override
	public Page queryNewsByUserId(int userId, int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.newsDao.selectNewsByUserId(userId, pageNow, pageSize);
	}
	
	
	@Override
	public Page queryNewsByType(String typeName, int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.newsDao.selectNewsByType(typeName, pageNow, pageSize);
	}
	
	@Override
	public void insertNews(News news) {
		// TODO Auto-generated method stub
		this.newsDao.addNews(news);
	}

	
	@Override
	public void remove(int newsId) {
		this.newsDao.delete(newsId);
	}


	@Override
	public void shenhe(int newsId) {
		this.newsDao.shenhe(newsId);
	}

	@Override
	public News queryNewsById(int newsId) {
		return this.newsDao.selectNewsById(newsId);
	}

	@Override
	public void modifyNews(News news) {
		// TODO Auto-generated method stub
		this.newsDao.updateNews(news);
	}
	

	@Resource(name="newsDao")
	@Transient
	public void setNewsDao(INewsDao newsDao) {
		this.newsDao = newsDao;
	}

	
	
}
