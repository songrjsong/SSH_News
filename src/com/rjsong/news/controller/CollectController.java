package com.rjsong.news.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rjsong.news.entity.Collect;
import com.rjsong.news.entity.News;
import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.User;
import com.rjsong.news.service.ICollectService;


@Controller
@RequestMapping("collect")
public class CollectController {
	ICollectService collectService;
	
	/**
	 * 查看收藏的文章列表
	 * @param collect
	 * @param model
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/PersonCollectList")
	public String showCollect(Model model,String userId,String collectStatus,String pageNow,String pageSize){
		pageNow = pageNow == null?"1":pageNow;
		pageSize = pageSize == null?"10":pageSize;
		Page page = collectService.queryCollectByPage(Integer.parseInt(userId),collectStatus,Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		model.addAttribute("page", page);
		return "ui/personal/personal-collect";
	}
	
	
	/**
	 * 查找收藏
	 * @param collect
	 * @return
	 */
	@RequestMapping("/dCollect")
	public String dCollect(HttpServletRequest request,Model model){
		User user = (User) request.getSession().getAttribute("userInfo");
		News news = (News) request.getSession().getAttribute("news");
		Collect collect = collectService.queryCollById(user.getUser_Id(),news.getNews_Id());
		model.addAttribute("collect", collect);
		return "forward:/comment/dComment.form";
		
	}
	
	/**
	 * 添加取消收藏
	 * @param collect
	 * @return
	 */
	@RequestMapping("/addcollect")
	public String addCollect(HttpServletRequest request,Model model){
		User user = (User) request.getSession().getAttribute("userInfo");
		News news = (News) request.getSession().getAttribute("news");
		Collect collec = collectService.queryCollById(user.getUser_Id(),news.getNews_Id());
			if(collec == null){         
				Collect cl = new Collect();
				cl.setUser(user);
				cl.setNews(news);
				cl.setCollectTime(new Date());
				cl.setCollectStatus("1");
				collectService.insertCollect(cl);
				model.addAttribute("collect", cl);
				return "ui/news";
				
			}else{
				if(collec.getCollectStatus().equals("1")){      
					collectService.removeCollect(collec.getCollect_Id());
					model.addAttribute("collect", collec);
					return "ui/news";
					
				}else if (collec.getCollectStatus().equals("0")) {
					collectService.updateCollectStatus(collec.getCollect_Id());
					model.addAttribute("collect", collec);
					return "ui/news";
				}
			}
			return "ui/news";
		}
	
	@RequestMapping("/removeCollect")
	public String remove(String collectId,String userId,Model model){
		collectService.removeCollect(Integer.parseInt(collectId));
	//	model.addAttribute("collectId", collectId);
		model.addAttribute("userId", userId);
		return "forward:/collect/PersonCollectList.form";
	}
	
	@Resource(name="collectService")
	public void setCollectService(ICollectService collectService) {
		this.collectService = collectService;
	}
}