package com.rjsong.news.service.impl;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjsong.news.dao.ICommentDao;
import com.rjsong.news.entity.Comment;
import com.rjsong.news.entity.Page;
import com.rjsong.news.service.ICommentService;

@Service("commentService")
@Transactional("txManager")
public class CommentServiceImpl implements ICommentService {
	
	ICommentDao commentDao;
	
	@Override
	public Page queryCommentByPage(String inputCondition, String startTime,
			String endTime, int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.commentDao.selectCommentByPage(inputCondition, startTime, endTime, pageNow, pageSize);
	}
	
	@Override
	public Page queryCommentByUser(int userId, int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.commentDao.selectCommentByUser(userId, pageNow, pageSize);
	}
	
	@Override
	public Page queryUiComment(int newsId, int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return this.commentDao.selectUiComment(newsId, pageNow, pageSize);
	}

	

	@Override
	public void InsertComment(Comment comment) {
		// TODO Auto-generated method stub
		this.commentDao.addComment(comment);
	}

	
	@Override
	public void remove(int commentId) {
		this.commentDao.delete(commentId);
	}
	
	@Override
	public long queryCountForUser(int userId) {
		// TODO Auto-generated method stub
		return this.commentDao.selectCountForUser(userId);
	}
	
	@Override
	public long queryCountForNews(int newsId) {
		// TODO Auto-generated method stub
		return this.commentDao.selectCountForNews(newsId);
	}

	
	@Resource(name="commentDao")
	@Transient
	public void setCommentDao(ICommentDao commentDao) {
		this.commentDao = commentDao;
	}

	
	
}
