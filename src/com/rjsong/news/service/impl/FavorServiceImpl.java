package com.rjsong.news.service.impl;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjsong.news.dao.IFavorDao;
import com.rjsong.news.entity.Favor;
import com.rjsong.news.entity.Page;
import com.rjsong.news.service.IFavorService;

@Service("favorService")
@Transactional("txManager")
public class FavorServiceImpl implements IFavorService {
	
	IFavorDao favorDao;

	@Override
	public Page queryFavorsByPage(int userId,int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.favorDao.selectFavorByPage(userId,pageNow, pageSize);
	}

	@Override
	public Favor queryFavorById(int userId, int newsId) {
		// TODO Auto-generated method stub
		return this.favorDao.selectFavorById(userId, newsId);
	}
	
	@Override
	public long queryCountByFavor(int newsId) {
		// TODO Auto-generated method stub
		return this.favorDao.selectCountByFavor(newsId);
	}


	@Override
	public void insertFavor(Favor favor) {
		// TODO Auto-generated method stub
		this.favorDao.addFavor(favor);
	}

	@Override
	public void removeFavor(int newsId, int userId) {
		// TODO Auto-generated method stub
		this.favorDao.cancleFavor(newsId, userId);
	}
	
	@Override
	public void removeFavor2(int favorId) {
		// TODO Auto-generated method stub
		this.favorDao.deleteFavor(favorId);
	}


	@Override
	public void updateStatus(int newsId, int userId) {
		// TODO Auto-generated method stub
		this.favorDao.modifyStatus(newsId, userId);
	}
	
	@Resource(name="favorDao")
	@Transient
	public void setFavorDao(IFavorDao favorDao) {
		this.favorDao = favorDao;
	}

	

}
