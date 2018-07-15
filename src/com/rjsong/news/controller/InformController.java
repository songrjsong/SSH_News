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

import com.rjsong.news.entity.Inform;
import com.rjsong.news.entity.News;
import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.User;
import com.rjsong.news.service.IInformService;

@Controller
@RequestMapping("/inform")
public class InformController {
	
	IInformService informService;
	
	//日期格式转换器
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
	}
	
	@RequestMapping("/informList")
	public String showInformList(String inputCondition,String nickname,String title,String startTime,String endTime,String pageNow,String pageSize,Model model){
		pageNow = pageNow == null?"1" : pageNow;
		pageSize = pageSize == null?"10" : pageSize;
		Page page = this.informService.queryInformByPage(inputCondition, startTime, endTime, Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		//查询数据后显示
		model.addAttribute("page", page);
		model.addAttribute("nickname", nickname);
		model.addAttribute("title", title);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		return "admin/inform-list";
	}
	
	/**
	 * 用户对新闻进行举报
	 * @param inform
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/addInform")
	public String addInform(Inform inform,HttpServletRequest request,Model model){
		User user = (User) request.getSession().getAttribute("userInfo");
		News news = (News) request.getSession().getAttribute("news");
		inform.setInformTime(new Date());
		inform.setNews(news);
		inform.setUser(user);
		this.informService.insertInform(inform);
		return "ui/inform-news";
		
	}
	
	@RequestMapping("/delInform")
	public String delInform(String informId){
		this.informService.remove(Integer.parseInt(informId));
		return "forward:/inform/informList.form";
	}
	
	
	@Resource(name="informService")
	public void setInformService(IInformService informService) {
		this.informService = informService;
	}
}
