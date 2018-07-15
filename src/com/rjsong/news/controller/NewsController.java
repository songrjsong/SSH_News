package com.rjsong.news.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.rjsong.news.entity.News;
import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.Type;
import com.rjsong.news.entity.User;
import com.rjsong.news.service.ICommentService;
import com.rjsong.news.service.IFavorService;
import com.rjsong.news.service.INewsService;
import com.rjsong.news.service.ITypeService;

@Controller
@RequestMapping("/news")
public class NewsController {
	INewsService newsService;
	ITypeService typeService;
	ICommentService commentService;
	IFavorService favorService;
	
	//日期格式转换器
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 dateFormat.setLenient(false);
		 binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	/**
	 * 在后台管理员多条件查询新闻
	 * @param nickname
	 * @param typeName
	 * @param title
	 * @param startTime
	 * @param endTime
	 * @param pageNow
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/showNewsListToAdmin")
	public String showNewsListToAdmin(String nickname,String typeName,String title,String startTime,String endTime,String pageNow,String pageSize,Model model){
		pageNow = pageNow == null?"1" : pageNow;
		pageSize = pageSize == null?"10" : pageSize;
		Page page = this.newsService.queryNewsByCondtion(nickname, typeName, startTime, endTime, 
				title, Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		//查询数据后显示
		model.addAttribute("page", page);
		model.addAttribute("nickname", nickname);
		model.addAttribute("typeName", typeName);
		model.addAttribute("title", title);
		return "admin/news-list";
	}
	
	/**
	 * 前台显示已发布的新闻
	 * @param status
	 * @param pageSize
	 * @param pageNow
	 * @param model
	 * @return
	 */
	@RequestMapping("/findAllNewsByStatus")
	public String findAllNewsByStatus(String pageSize,String pageNow,Model model){
		pageNow = pageNow==null?"1":pageNow;
		pageSize = pageSize==null?"10":pageSize;
		Page page = newsService.queryNewsByStatus( Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		model.addAttribute("page", page);
		return "ui/index";
	}
	
	/**
	 * 前台用户根据新闻标题关键字搜索新闻
	 * @param inputTag
	 * @param pageSize
	 * @param pageNow
	 * @param model
	 * @return
	 */
	@RequestMapping("/findNewsByTag")
	public String findNewsByTag(String inputtag,String pageSize,String pageNow,Model model,HttpSession session){
		pageNow = pageNow==null?"1":pageNow;
		pageSize = pageSize==null?"10":pageSize;
		Page page = this.newsService.queryNewsByInputTag(inputtag,Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		//model.addAttribute("page", page);
		session.setAttribute("page", page);
		return "ui/index";
	}
	
	/**
	 * 前台热点新闻推荐
	 * @param model
	 * @return
	 */
	@RequestMapping("/findNewsRecommend")
	public String showNewsByRecommend(Model model,HttpSession session){
		List<News> newss = this.newsService.queryNewsByRecommend();
		//model.addAttribute("newss", newss);
		session.setAttribute("newss", newss);
		return "forward:/news/findAllNewsByStatus.form";
	}
	
	@RequestMapping("/showPersonNewsList")
	public String showNewsForPerson(String userId,String pageSize,String pageNow,Model model){
		pageNow = pageNow==null?"1":pageNow;
		pageSize = pageSize==null?"5":pageSize;
		Page page = this.newsService.queryNewsByUserId(Integer.parseInt(userId), Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		model.addAttribute("page", page);
		return "ui/personal/personal-dongtai";
	}
	
	@RequestMapping("/queryNewsByType")
	public String showNewsTypeForUI(String typeName,String pageSize,String pageNow,Model model){
		pageNow = pageNow==null?"1":pageNow;
		pageSize = pageSize==null?"5":pageSize;
		Page page = this.newsService.queryNewsByType(typeName,Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		model.addAttribute("page", page);
		return "ui/index";

	}
	
	@RequestMapping("/queryNews")
	public String showNews(String newsId,Model model,HttpSession session){
		News news = this.newsService.queryNewsById(Integer.parseInt(newsId));
		int lookCount = news.getLookCount()+1;
		int commentCount = (int) this.commentService.queryCountForNews(Integer.parseInt(newsId));
		int favorCount = (int) this.favorService.queryCountByFavor(Integer.parseInt(newsId));
		news.setLookCount(lookCount);
		news.setCommentCount(commentCount);
		news.setFavorCount(favorCount);
		this.newsService.modifyNews(news);
	//	model.addAttribute("news", news);
		session.setAttribute("news",news);
		return "forward:/favor/dFavor.form";
	}
	
	/**
	 * 用户发布文章
	 * @param article
	 * @param session
	 * @return
	 */
	@RequestMapping("/addNews")
	public String addNews(@RequestParam(name="newImg")MultipartFile newImg,String userId,News news,HttpServletRequest request,HttpSession session,Model model){
		User user = (User) request.getSession().getAttribute("userInfo");
		String newsname = newImg.getOriginalFilename();
		news.setNewsImg(newsname);	
		String path = session.getServletContext().getRealPath("/jsp/ui/img");
		String localPath = path + "/" + newsname;
		File f = new File(localPath);
		String typeName=request.getParameter("typeName");
		String label = request.getParameter("label");
		Type type = typeService.queryTypeByName(typeName);
		
			try {
				newImg.transferTo(f);
				news.setCreateTime(new Date());
				news.setStatus("0");
				news.setType(type);
				news.setLabel(label);
				news.setUser(user);
				newsService.insertNews(news);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		model.addAttribute("userId", userId);
		
		return "forward:/news/showPersonNewsList.form";
	}
	
	
	/**
	 * 新闻删除
	 * @param newsId
	 * @return
	 */
	@RequestMapping("/newsDel")
	public String delNews(String newsId){
		this.newsService.remove(Integer.parseInt(newsId));
		return "forward:/news/showNewsListToAdmin.form";
		
	}
	
	/**
	 * 新闻审核
	 * @param request
	 * @return
	 */
	@RequestMapping("/newsShenHe")
	public String shenhe(String newsId){
		this.newsService.shenhe(Integer.parseInt(newsId));
		return "forward:/news/showNewsListToAdmin.form";
	}
	
	/**
	 * 管理员在系统后台查看新闻信息
	 * @return
	 */
	@RequestMapping("/showNews2")
	public String findNews2(String newsId,Model model){
		News news = this.newsService.queryNewsById(Integer.parseInt(newsId));
		model.addAttribute("news", news);
		return "/admin/news-show";
	}
	
	
	@Resource(name="newsService")
	public void setNewsService(INewsService newsService) {
		this.newsService = newsService;
	}
	@Resource(name="typeService")
	public void setTypeService(ITypeService typeService) {
		this.typeService = typeService;
	}
	@Resource(name="commentService")
	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}
	@Resource(name="favorService")
	public void setFavorService(IFavorService favorService) {
		this.favorService = favorService;
	}
}
