package com.rjsong.news.service.impl;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjsong.news.dao.IInformDao;
import com.rjsong.news.entity.Inform;
import com.rjsong.news.entity.Page;
import com.rjsong.news.service.IInformService;

@Service("informService")
@Transactional("txManager")
public class InformServiceImpl implements IInformService {
	
	IInformDao informDao;

	@Override
	public Page queryInformByPage(String inputCondition, String startTime,
			String endTime, int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.informDao.selectInformByPage(inputCondition, startTime, endTime, pageNow, pageSize);
	}
	
	@Override
	public void remove(int informId) {
		this.informDao.delete(informId);
		
	}
	
	@Override
	public void insertInform(Inform inform) {
		// TODO Auto-generated method stub
		this.informDao.addInform(inform);
	}

	
	@Resource(name="informDao")
	@Transient
	public void setInformDao(IInformDao informDao) {
		this.informDao = informDao;
	}

	

}
