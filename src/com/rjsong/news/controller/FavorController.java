package com.rjsong.news.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rjsong.news.entity.Favor;
import com.rjsong.news.entity.News;
import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.User;
import com.rjsong.news.service.IFavorService;


@Controller
@RequestMapping("/favor")
public class FavorController {
	IFavorService favorService;
	

	/**
	 * 查看收藏的文章列表
	 * @param collect
	 * @param model
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/PersonFavorList")
	public String showFavorList(Model model,String userId,String pageNow,String pageSize){
		pageNow = pageNow == null?"1":pageNow;
		pageSize = pageSize == null?"10":pageSize;
		Page page = favorService.queryFavorsByPage(Integer.parseInt(userId),Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		model.addAttribute("page", page);
		return "ui/personal/personal-favor";
	}
	
	/**
	 * 查找favor
	 * @param favor
	 * @return
	 */
	@RequestMapping("/dFavor")
	public String dFavor(HttpServletRequest request,Model model){
		User user = (User) request.getSession().getAttribute("userInfo");
		News news = (News) request.getSession().getAttribute("news");
		Favor favor = favorService.queryFavorById(user.getUser_Id(),news.getNews_Id());
		model.addAttribute("favor", favor);
		return "forward:/attention/dAttention.form";
		
	}
	/**
	 * 点赞
	 * @param Favor
	 * @return
	 */
	@RequestMapping("/addFavor")
	public String add(Favor favor,HttpServletRequest request,Model model){
		User user = (User) request.getSession().getAttribute("userInfo");
		News news = (News) request.getSession().getAttribute("news");
		Favor favor2 = favorService.queryFavorById(user.getUser_Id(),news.getNews_Id());
			if(favor2 == null){          
				Favor f = new Favor();
				f.setUser(user);
				news.setFavorCount(news.getFavorCount()+1);
				f.setNews(news);
				f.setFavor_Status("1");
				f.setFavor_Time(new Date());
				favorService.insertFavor(f);
				model.addAttribute("favor",f );
				return "ui/news";
			}else{
				if(favor2.getFavor_Status().equals("1")){       
					favorService.removeFavor(news.getNews_Id(),user.getUser_Id());
					model.addAttribute("favor2",favor2 );
					return "ui/news";
					
				}else if (favor2.getFavor_Status().equals("0")) {
					favorService.updateStatus(news.getNews_Id(),user.getUser_Id());
					model.addAttribute("favor2",favor2 );
					return "ui/news";
				}
			}
			return "ui/news";
		}
	


	@RequestMapping("/deleteFavor")
	public String delete(String favorId,String userId,Model model){
		favorService.removeFavor2(Integer.parseInt(favorId));
		model.addAttribute("favorId", favorId);
		model.addAttribute("userId", userId);
		return "forward:/favor/PersonFavorList.form";
	}
	
	@Resource(name="favorService")
	public void setFavorService(IFavorService favorService) {
		this.favorService = favorService;
	}
}
