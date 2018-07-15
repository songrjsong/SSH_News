package com.rjsong.news.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rjsong.news.entity.Comment;
import com.rjsong.news.entity.News;
import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.User;
import com.rjsong.news.service.ICommentService;
import com.rjsong.news.service.INewsService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	ICommentService commentService;
	INewsService newsService;
	
	//日期格式转换器
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
	}
		
	@RequestMapping("/commentList")
	public String showCommentList(String inputCondition,String nickname,String title,String startTime,String endTime,String pageNow,String pageSize,Model model){
		pageNow = pageNow == null?"1" : pageNow;
		pageSize = pageSize == null?"10" : pageSize;
		Page page = this.commentService.queryCommentByPage(inputCondition, startTime, endTime, Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		//查询数据后显示
		model.addAttribute("page", page);
		model.addAttribute("nickname", nickname);
		model.addAttribute("title", title);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		return "admin/comment-list";
	}
	
	/**
	 * 查看个人中心的评论列表
	 * @param collect
	 * @param model
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/PersonCommentList")
	public String showCommentList(Model model,String userId,String pageNow,String pageSize){
		pageNow = pageNow == null?"1":pageNow;
		pageSize = pageSize == null?"10":pageSize;
		Page page = this.commentService.queryCommentByUser(Integer.parseInt(userId),Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		model.addAttribute("page", page);
		return "ui/personal/personal-comment";
	}
	
	/**
	 * 用户发表评论
	 * @return
	 */
	@RequestMapping("/addComment")
	public String sendComment(Comment comment,int newsId,HttpServletRequest request){
		
		News news=this.newsService.queryNewsById(newsId);
		User user=(User) request.getSession().getAttribute("userInfo");
		comment.setNews(news);
		comment.setCommentTime(new Date());
		comment.setFrom_user(user);
		commentService.InsertComment(comment);
		return "ui/news";
	}
	
	/**
	 * 前台，显示评论信息
	 * @return
	 */
	@RequestMapping("/dComment")
	public String showUiComment(HttpServletRequest request,Model model,String pageNow,String pageSize){
		
		pageNow = pageNow == null?"1":pageNow;
		pageSize = pageSize == null?"100":pageSize;
		News news = (News) request.getSession().getAttribute("news");
		Page commentpage = commentService.queryUiComment(news.getNews_Id(),Integer.parseInt(pageNow),Integer.parseInt(pageSize));
		model.addAttribute("commentpage", commentpage);

		return "ui/news";
		
	}
	
	
	
	
	@RequestMapping("/delComment")
	public String removeComment(String commentId){
		this.commentService.remove(Integer.parseInt(commentId));
		return "forward:/comment/commentList.form";
	}
	
	@RequestMapping("/delBatchComment")
	public String removeBatchComment(Model model,HttpServletRequest request){
		String commentids = request.getParameter("commentids");
		String[] commentIds =commentids.split(",");
			for (int i = 0; i < commentIds.length; i++) {
				commentService.remove(Integer.parseInt(commentIds[i]));
			}	
		return "forward:/comment/commentList.form";
	}
	
	
	
	@Resource(name="commentService")
	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}
	@Resource(name="newsService")
	public void setNewsService(INewsService newsService) {
		this.newsService = newsService;
	}
}
