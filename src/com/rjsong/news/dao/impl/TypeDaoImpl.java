package com.rjsong.news.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.rjsong.news.dao.ITypeDao;
import com.rjsong.news.entity.Inform;
import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.Type;

@Repository("typeDao")
public class TypeDaoImpl implements ITypeDao {
	
	SessionFactory sessionFactory;
	
	@Override
	public Page selectTypeByPage(int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Type ";
		Query query = session.createQuery(hql)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		
		List<Type>  types= query.list();
		
		Page page = new Page();
		page.setTypes(types);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		
		int rowCount = (int) this.getRowCount();
		int pageCount = 0;
		if(rowCount % pageSize == 0){
			pageCount = rowCount / pageSize;
		}else {
			pageCount = rowCount / pageSize + 1;
		}
		
		page.setPageCount(pageCount);
		page.setRowCount(rowCount);
		
		return page;
	}
	
	private long getRowCount(){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from Type ";	
		Query query = session.createQuery(hql);			
		long rowCount = (long) query.uniqueResult();
		return rowCount;
		
	}
	
	
	@Override
	public List<Type> selectTypes() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Type");
		List<Type> types = query.list();
		
		return types;
	}
	
	@Override
	public Type selectTypeByName(String typeName) {
		// TODO Auto-generated method stub
		return (Type) this.sessionFactory.getCurrentSession()
				.createQuery("from Type t where t.typeName=:typeName")
				.setString("typeName", typeName)
				.uniqueResult();
	}


	@Override
	public void addType(Type type) {
		this.sessionFactory.getCurrentSession().save(type);
	}
	
	@Override
	public Type selectTypeById(int typeId) {
		return (Type) this.sessionFactory.getCurrentSession()
				.createQuery("from Type t where t.type_Id=:typeId")
				.setInteger("typeId", typeId)
				.uniqueResult();
	}
	
	
	@Override
	public void updateType(Type type) {
		int typeId = type.getType_Id();
		String typeName = type.getTypeName();
		String introduce = type.getIntroduce();
		String hql = "update Type t set t.typeName=:typeName,t.introduce=:introduce where t.type_Id=:typeId";
		this.sessionFactory.getCurrentSession().createQuery(hql)
			.setInteger("typeId", typeId)
			.setString("typeName", typeName)
			.setString("introduce", introduce)
			.executeUpdate();
	}

	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	

}
