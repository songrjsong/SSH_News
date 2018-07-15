package com.rjsong.news.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.rjsong.news.dao.IInformDao;
import com.rjsong.news.entity.Inform;
import com.rjsong.news.entity.Page;

@Repository("informDao")
public class InformDaoImpl implements IInformDao {
	
	SessionFactory sessionFactory;

	@Override
	public Page selectInformByPage(String inputCondition, String startTime,
			String endTime, int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Inform i where 1=1 ";
		if(null !=  inputCondition&& !"".equals(inputCondition.trim())){	
			hql += " and i.user.nickname like '%"+inputCondition+"%' or i.news.title like '%"+inputCondition+"%'";
		}
		
		if((startTime != null && !startTime.equals("")) && (endTime == null || "".equals(endTime.trim()))){
			hql += " and i.informTime >= '"+startTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime == null || "".equals(startTime.trim()))){
			hql += " and i.informTime <= '"+endTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime != null && !"".equals(endTime.trim()))){
			hql += " and i.informTime between '"+startTime+"' and  '"+endTime+"' ";
		}
	
		Query query = session.createQuery(hql)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		
		List<Inform> informs = query.list();
		
		Page page = new Page();
		page.setInforms(informs);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		
		int rowCount = (int) this.getRowCount(inputCondition,startTime,endTime);
		
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
	
	private long getRowCount(String inputCondition,String startTime,String endTime){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from Inform i where 1=1 ";
		if(null !=  inputCondition&& !"".equals(inputCondition.trim())){	
			hql += " and i.user.nickname like '%"+inputCondition+"%' or i.news.title like '%"+inputCondition+"%'";
		}
		if((startTime != null && !startTime.equals("")) && (endTime == null || "".equals(endTime.trim()))){
			hql += " and i.informTime >= '"+startTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime == null || "".equals(startTime.trim()))){
			hql += " and i.informTime <= '"+endTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime != null && !"".equals(endTime.trim()))){
			hql += " and i.informTime between '"+startTime+"' and  '"+endTime+"' ";
		}
		Query query = session.createQuery(hql);
				
		long rowCount = (long) query.uniqueResult();
	
		return rowCount;
		
	}
	
	@Override
	public void addInform(Inform inform) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().save(inform);
	}

	
	@Override
	public void delete(int informId) {
		this.sessionFactory.getCurrentSession().createQuery("delete from Inform i where i.inform_Id=:informId")
			.setInteger("informId", informId)
			.executeUpdate();
	}
	
	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


}
