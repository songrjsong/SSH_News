package com.rjsong.news.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjsong.news.dao.ITypeDao;
import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.Type;
import com.rjsong.news.service.ITypeService;

@Service("typeService")
@Transactional("txManager")
public class TypeServiceImpl implements ITypeService {
	
	ITypeDao typeDao;
	
	@Override
	public Page queryTypeByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.typeDao.selectTypeByPage(pageNow, pageSize);
	}
	
	@Override
	public List<Type> queryTypes() {
		// TODO Auto-generated method stub
		return this.typeDao.selectTypes();
	}
	
	@Override
	public Type queryTypeByName(String typeName) {
		// TODO Auto-generated method stub
		return this.typeDao.selectTypeByName(typeName);
	}

	@Override
	public void insertType(Type type) {
		this.typeDao.addType(type);
	}
	
	@Override
	public Type queryTypeById(int typeId) {
		return this.typeDao.selectTypeById(typeId);
	}

	@Override
	public void modifyType(Type type) {
		// TODO Auto-generated method stub
		this.typeDao.updateType(type);
	}
	
	@Resource(name="typeDao")
	@Transient
	public void setTypeDao(ITypeDao typeDao) {
		this.typeDao = typeDao;
	}

	

}
