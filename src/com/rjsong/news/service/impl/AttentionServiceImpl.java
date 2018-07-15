package com.rjsong.news.service.impl;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjsong.news.dao.IAttentionDao;
import com.rjsong.news.entity.Attention;
import com.rjsong.news.entity.Page;
import com.rjsong.news.service.IAttentionService;

@Service("attentionService")
@Transactional("txManager")
public class AttentionServiceImpl implements IAttentionService {
	IAttentionDao attentionDao;
	
	
	@Override
	public void InsertAttention(Attention attention) {
		// TODO Auto-generated method stub
		this.attentionDao.addAttention(attention);
	}

	@Override
	public void removeAttention(int attentionId, int userId) {
		// TODO Auto-generated method stub
		this.attentionDao.deleteAttention(attentionId, userId);
	}

	@Override
	public void ModifyAttenStatus(int attentionId, int userId) {
		// TODO Auto-generated method stub
		this.attentionDao.updateAttenStatus(attentionId, userId);
	}

	@Override
	public Page queryAttentionsByUser(int userId, int pageNow,int pageSize) {
		// TODO Auto-generated method stub
		return this.attentionDao.selectAttentionsByUser(userId, pageNow, pageSize);
	}

	@Override
	public Attention queryAttentionById(int from_userId, int to_userId) {
		// TODO Auto-generated method stub
		return this.attentionDao.selectAttentionById(from_userId, to_userId);
	}
	
	
	@Resource(name="attentionDao")
	@Transient
	public void setAttentionDao(IAttentionDao attentionDao) {
		this.attentionDao = attentionDao;
	}

}
