package com.rjsong.news.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.Type;
import com.rjsong.news.entity.User;
import com.rjsong.news.service.ITypeService;

@Controller
@RequestMapping("/type")
public class TypeController {
	
	ITypeService typeService;
	
	@RequestMapping("/typeList")
	public String showTypeList(String pageNow,String pageSize,Model model){
		pageNow = pageNow == null?"1" : pageNow;
		pageSize = pageSize == null?"10" : pageSize;
		Page page = this.typeService.queryTypeByPage(Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		//查询数据后显示
		model.addAttribute("page", page);
		return "admin/type-list";
	}
	
	@RequestMapping("/showTypesForUI")
	public String showTypesForUI(Model model,HttpSession session,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("userInfo");
		List<Type> types = this.typeService.queryTypes();
		session.setAttribute("types", types);
		session.setAttribute("user", user);
		return "ui/personal/publish-news";
	}
	
	@RequestMapping("/addType")
	public String addType(Type type,Model model){
		this.typeService.insertType(type);
		return "forward:/type/typeList.form";
	}
	
	@RequestMapping("/findType")
	public String findType(String typeId,Model model){
		Type type = typeService.queryTypeById(Integer.parseInt(typeId));
		model.addAttribute("t", type);
		return "/admin/type-edit";
	}
	
	@RequestMapping("/updateType")
	public String updateType( Type type,HttpServletRequest request){
		this.typeService.modifyType(type);
		return "forward:/type/typeList.form";
	}
	
	
	@Resource(name="typeService")
	public void setTypeService(ITypeService typeService) {
		this.typeService = typeService;
	}
}
