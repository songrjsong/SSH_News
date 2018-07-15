package com.rjsong.news.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.rjsong.news.dao.INoticeDao;
import com.rjsong.news.entity.Notice;
import com.rjsong.news.entity.Page;

@Repository("noticeDao")
public class NoticeDaoImpl implements INoticeDao {
	SessionFactory sessionFactory;
	
	@Override
	public Page selectNoticesByPage(String startTime, String endTime,
			int pageNow, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Notice n where 1=1 ";
		
		if((startTime != null && !startTime.equals("")) && (endTime == null || "".equals(endTime.trim()))){
			hql += " and n.noticeTime >= '"+startTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime == null || "".equals(startTime.trim()))){
			hql += " and n.noticeTime <= '"+endTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime != null && !"".equals(endTime.trim()))){
			hql += " and n.noticeTime between '"+startTime+"' and  '"+endTime+"' ";
		}
	
		Query query = session.createQuery(hql)
				.setFirstResult((pageNow-1)*pageSize)
				.setMaxResults(pageSize);
		
		List<Notice> notices = query.list();
		
		Page page = new Page();
		page.setNotices(notices);
		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		
		int rowCount = (int) this.getRowCount(startTime,endTime);
		
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
	
	private long getRowCount(String startTime,String endTime){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select count(*) from Notice n where 1=1 ";
		
		if((startTime != null && !startTime.equals("")) && (endTime == null || "".equals(endTime.trim()))){
			hql += " and n.noticeTime >= '"+startTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime == null || "".equals(startTime.trim()))){
			hql += " and n.noticeTime <= '"+endTime+"'";
		}
		
		if((endTime != null && !endTime.equals("")) && (startTime != null && !"".equals(endTime.trim()))){
			hql += " and n.noticeTime between '"+startTime+"' and  '"+endTime+"' ";
		}
		Query query = session.createQuery(hql);
				
		long rowCount = (long) query.uniqueResult();
	
		return rowCount;
		
	}
	
	@Override
	public void delete(int noticeId) {
		this.sessionFactory.getCurrentSession().createQuery("delete from Notice n where n.notice_Id=:noticeId")
			.setInteger("noticeId", noticeId)
			.executeUpdate();	
	}
	
	/**
	 * 查询单个公告信息
	 * @param noticeId
	 * @return
	 */
	@Override
	public Notice selectNoticeById(int noticeId) {
		return (Notice) this.sessionFactory.getCurrentSession()
				.createQuery("from Notice notice where notice.notice_Id=:noticeId")
				.setInteger("noticeId", noticeId)
				.uniqueResult();
	}

	/**
	 * 发布公告
	 * @param notice
	 * 
	 */
	@Override
	public void addNotice(Notice notice) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(notice);
	}
	
	/**
	 * 修改公告信息
	 * @param noticeId 
	 */
	@Override
	public void updateNotice(Notice notice) {
		int noticeId = notice.getNotice_Id();
		String noticeTitle = notice.getNotice_Title();
		String noticeContent = notice.getNotice_Content();
		String hql ="update Notice n set n.notice_Title=:noticeTitle,n.notice_Content=:noticeContent where n.notice_Id=:noticeId";
		this.sessionFactory.getCurrentSession().createQuery(hql)
			.setString("noticeTitle", noticeTitle)
			.setString("noticeContent", noticeContent)
			.setInteger("noticeId", noticeId)
			.executeUpdate();
	}

	@Override
	public Notice selectNotice() {
		String hql ="from Notice n order by n.noticeTime desc ";
		return (Notice) this.sessionFactory.getCurrentSession().createQuery(hql)
				.setFirstResult(0)
				.setMaxResults(1)
				.uniqueResult();
	}

	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}



	
}
