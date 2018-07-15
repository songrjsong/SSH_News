package com.rjsong.news.service.impl;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjsong.news.dao.ICollectDao;
import com.rjsong.news.entity.Collect;
import com.rjsong.news.entity.Page;
import com.rjsong.news.service.ICollectService;



@Service("collectService")
@Transactional("txManager")

public class CollectServiceImpl implements ICollectService {

	ICollectDao collectDao;
	
	@Override
	public void insertCollect(Collect collect) {
		
		this.collectDao.addCollect(collect);
	}

	@Override
	public void removeCollect(int collectId) {
		
		this.collectDao.deleteCollect(collectId);
	}
	
	@Override
	public void updateCollectStatus(int collectId) {
		
		this.collectDao.modifyCollectStatus(collectId);
		
	}

	@Override
	public Page queryCollectByPage(int userId,String collectStatus,int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.collectDao.selectCollectByPage(userId,collectStatus,pageNow, pageSize);
	}
	
	@Override
	public Collect queryCollById(int userId, int articleId) {
		
		return this.collectDao.selectCollect(userId,articleId);
	}


	@Override
	public Collect queryCollectById(int collectId) {
		
		return this.queryCollectById(collectId);
	}

	@Resource(name="collectDao")
	@Transient
	public void setCollectDao(ICollectDao collectDao){
		this.collectDao = collectDao;
	}

	

	
}
