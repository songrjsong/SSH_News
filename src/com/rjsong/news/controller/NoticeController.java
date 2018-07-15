package com.rjsong.news.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rjsong.news.entity.Admin;
import com.rjsong.news.entity.Notice;
import com.rjsong.news.entity.Page;
import com.rjsong.news.service.INoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	INoticeService noticeService;
	
	//日期格式转换器
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
	}
	
	@RequestMapping("/noticeList")
	public String showNoticeList(String startTime,String endTime,String pageNow,String pageSize,Model model){
		pageNow = pageNow == null?"1" : pageNow;
		pageSize = pageSize == null?"10" : pageSize;
		Page page = this.noticeService.queryNoticesByPage(startTime, endTime, Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		//查询数据后显示
		model.addAttribute("page", page);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		return "admin/notice-list";
	}
	
	/**
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/queryNoticeForUI")
	public String showNoticeForUI(Model model,HttpSession session){
		Notice notice = this.noticeService.queryNotice();
	//	model.addAttribute("notice", notice);
		session.setAttribute("notice", notice);
		return "forward:/news/findNewsRecommend.form";
	}
	
	/**
	 * 添加公告
	 */
	@RequestMapping("/addNotice")
	public String addNotice(Notice notice,HttpServletRequest request){
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		notice.setAdmin(admin);
		notice.setNoticeTime(new Date());
		noticeService.insertNotice(notice);
		return "forward:/notice/noticeList.form";
	}
	
	/**
	 * 管理员删除公告
	 * @param noticeId
	 * @return
	 */
	@RequestMapping("/delNotice")
	public String removeNotice(String noticeId){
		this.noticeService.remove(Integer.parseInt(noticeId));
		return "forward:/notice/noticeList.form";
	}
	
	/**
	 * 批量删除公告
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/delBatchNotice")
	public String removeBatchNotice(Model model,HttpServletRequest request){
		String noticeids = request.getParameter("noticeids");
		String[] noticeIds =noticeids.split(",");
			for (int i = 0; i < noticeIds.length; i++) {
				noticeService.remove(Integer.parseInt(noticeIds[i]));
			}		
		return "forward:/notice/noticeList.form";
	}
	
	/**
	 * 管理员修改公告
	 * @param noticeId
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateNotice")
	public String updateNotice(String noticeId,HttpServletRequest request){
		String noticeTitle = request.getParameter("notice_Title");
		String noticeContent = request.getParameter("notice_Content");
		Notice notice = noticeService.queryNoticeById(Integer.parseInt(noticeId));
		notice.setNotice_Title(noticeTitle);
		notice.setNotice_Content(noticeContent);
		notice.setNoticeTime(new Date());
		noticeService.modefiyNotice(notice);
		return "forward:/notice/noticeList.form";
	}
	
	/**
	 * 管理员查询公告
	 * @param noticeId
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/findNotice")
	public String findNotice(String noticeId,HttpServletRequest request,Model model){
		Notice notice = noticeService.queryNoticeById(Integer.parseInt(noticeId));
		request.getSession().setAttribute("notice", notice);
		model.addAttribute("n", notice);
		return "admin/notice-edit";
	}
	
	/**
	 * 后台显示公告
	 * @param noticeId
	 * @param model
	 * @return
	 */
	@RequestMapping("/showNotice")
	public String showNotice(String noticeId,Model model){
		Notice notice = noticeService.queryNoticeById(Integer.parseInt(noticeId));
		model.addAttribute("notice", notice);
		return "admin/notice-show";
	}
	
	
	@Resource(name="noticeService")
	public void setNoticeService(INoticeService noticeService) {
		this.noticeService = noticeService;
	}
}
