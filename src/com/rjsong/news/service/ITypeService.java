package com.rjsong.news.service;

import java.util.List;

import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.Type;

public interface ITypeService {
	
	/**
	 * 查找出所有的类型
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page queryTypeByPage(int pageNow, int pageSize);
	
	/**
	 * 发表新闻时选择新闻类型
	 * @return
	 */
	public List<Type> queryTypes();
	
	/**
	 * 查询新闻
	 * @param typeName
	 * @return
	 */
	public Type queryTypeByName(String typeName);
	
	/**
	 * 添加类型
	 * @param type
	 */
	public void insertType(Type type);
	
	/**
	 * 查询类型
	 * @param typeId
	 * @return
	 */
	public Type queryTypeById(int typeId);
	
	/**
	 * 修改类型
	 * @param type
	 */
	public void modifyType(Type type);
}
