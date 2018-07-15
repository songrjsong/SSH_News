package com.rjsong.news.dao;


import java.util.List;

import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.Type;

public interface ITypeDao {
	
	/**
	 * 查找出所有的类型
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public Page selectTypeByPage(int pageNow, int pageSize);
	
	/**
	 * 查询单个类型
	 * @param typeId
	 * @return
	 */
	public Type selectTypeById(int typeId);
	
	/**
	 * 通过类别名称查询
	 * @param typeName
	 * @return
	 */
	public Type selectTypeByName(String typeName);
	
	/**
	 * 发表新闻时选择新闻类型
	 * @return
	 */
	public List<Type> selectTypes();
	
	/**
	 * 添加类型
	 * @param type
	 */
	public void addType(Type type);
	
	
	
	public void updateType(Type type);
}
