package com.rjsong.news.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.rjsong.news.entity.Attention;
import com.rjsong.news.entity.News;
import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.User;
import com.rjsong.news.service.IAttentionService;

@Controller
@RequestMapping("/attention")
public class AttentionController {
	IAttentionService attentionService;
	
	
	@RequestMapping("/PersonAttentionList")
	public String showAttention(String userId,Model model,String pageNow,String pageSize){
		pageNow = pageNow == null?"1":pageNow;
		pageSize = pageSize == null?"5":pageSize;
		Page page = attentionService.queryAttentionsByUser(Integer.parseInt(userId), Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		model.addAttribute("page", page);
		return "ui/personal/personal-friend";
		
	}
	
	@RequestMapping("/addAttention")
	public String add(Attention attention,HttpServletRequest request,Model model){
		User user = (User) request.getSession().getAttribute("userInfo");
		News news = (News) request.getSession().getAttribute("news");
		Attention att = attentionService.queryAttentionById(user.getUser_Id(), news.getUser().getUser_Id());
		if(att == null){
			Attention atten = new Attention();
			atten.setStatus("1");
			atten.setFrom_user(user);
			atten.setTo_user(news.getUser());
			attentionService.InsertAttention(atten);
			return "ui/news";
		}else{
			if(att.getStatus().equals("1")){
				attentionService.removeAttention(att.getAttention_Id(), att.getFrom_user().getUser_Id());
				model.addAttribute("attention",att );
				return "ui/news";
			}
			if(att.getStatus().equals("0")){
				attentionService.ModifyAttenStatus(att.getAttention_Id(), att.getFrom_user().getUser_Id());
				model.addAttribute("attention",att );
				return "ui/news";
			}
		}
		return "ui/news";
	}
	
	/**
	 * 查找Attention
	 * @param 
	 * @return
	 */
	@RequestMapping("/dAttention")
	public String dAttention(HttpServletRequest request,Model model){
		User user = (User) request.getSession().getAttribute("userInfo");
		News news = (News) request.getSession().getAttribute("news");
		Attention  attention = this.attentionService.queryAttentionById(user.getUser_Id(),news.getUser().getUser_Id());
		model.addAttribute("attention", attention);
		return "forward:/collect/dCollect.form";
		
	}
	
	@Resource(name="attentionService")
	public void setAttentionService(IAttentionService attentionService) {
		this.attentionService = attentionService;
	}
}
