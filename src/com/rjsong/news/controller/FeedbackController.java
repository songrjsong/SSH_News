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

import com.rjsong.news.entity.Feedback;
import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.User;
import com.rjsong.news.service.IFeedbackService;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {
	
	IFeedbackService feedbackService;
	
	//日期格式转换器
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
	}
	
	@RequestMapping("/feedbackList")
	public String showFeedbackList(String nickname,String startTime,String endTime,String pageNow,String pageSize,Model model){
		pageNow = pageNow == null?"1" : pageNow;
		pageSize = pageSize == null?"10" : pageSize;
		Page page = this.feedbackService.queryFeedBackByPage(nickname, startTime, endTime, Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		//查询数据后显示
		model.addAttribute("page", page);
		model.addAttribute("nickname", nickname);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		return "admin/feedback-list";
	}
	
	/**
	 * 用户发表反馈信息
	 * @return
	 */
	@RequestMapping("/addFb")
	public String addFeedback(Feedback feedback,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("userInfo");
		feedback.setFbTime(new Date());
		feedback.setUser(user);
		this.feedbackService.InsertFeedback(feedback);
		return "forward:/news/findAllNewsByStatus.form";
	}
	
	@RequestMapping("/delFeedback")
	public String removeFeedback(String feedbackId){
		this.feedbackService.remove(Integer.parseInt(feedbackId));
		return "forward:/feedback/feedbackList.form";
	}
	
	@RequestMapping("/delBatch")
	public String removeBatchFeedback(Model model,HttpServletRequest request){
		String feedbackids = request.getParameter("feedbackids");
		String[] feedbackIds =feedbackids.split(",");
			for (int i = 0; i < feedbackIds.length; i++) {
				feedbackService.remove(Integer.parseInt(feedbackIds[i]));
			}	
		return "forward:/feedback/feedbackList.form";
	}
	
	@Resource(name="feedbackService")
	public void setFeedbackService(IFeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}
	
}
