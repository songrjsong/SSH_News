package com.rjsong.news.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.rjsong.news.entity.Admin;
import com.rjsong.news.service.IAdminService;

@Controller("adminController")
public class AdminController {
	IAdminService adminService;
	
	/**
	 * 管理员登录
	 * @return
	 */
	@RequestMapping("/admin/login")
	public String login(String username,Admin admin,Model model,HttpServletRequest request){
		
		if(admin != null){
			Admin ad = adminService.queryAdminByName(username);
			if(ad != null){
				//用户存在
				if(ad.getPassword().equals(admin.getPassword())){
					//密码正确
					request.getSession().setAttribute("admin", ad);
					return "admin/index";
				}else {
					//密码不正确
					model.addAttribute("message", "密码不正确");
					return "admin/login";
				}
			}else {
				//用户不存在
				model.addAttribute("message", "用户不存在");
				return "admin/login";
			}
		}else {
			
			model.addAttribute("message", "请重新登录");
			return "admin/login";
		}
	}
	
	
	@RequestMapping("/index")
	public String index(Admin admin,Model model){
		model.addAttribute("admin", admin);
		return "admin/index";
		
	}
	
	@RequestMapping("/admin/exit")
	public String exit(){
		return "admin/login";
		
	}
	
	
	@Resource(name="adminService")
	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}
	
	
	
}
