package com.rjsong.news.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rjsong.news.entity.Page;
import com.rjsong.news.entity.User;
import com.rjsong.news.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	IUserService userService;
	
	//日期格式转换器
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		  dateFormat.setLenient(false);
		  binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	/**
	 * 前台用户注册
	 * @param user
	 * @param userName
	 * @return
	 */
	@RequestMapping("/addUser")
	public String register(User user,String userName){
		String nickname = userName;
		user.setNickname(nickname);
		user.setLevel(0);
		user.setRegTime(new Date());
		user.setStatus("1");
		user.setIs_editor("0");
		this.userService.insertUser(user);
		return "ui/login";
		
	}
	
	@RequestMapping("/addUser2")
	public String addInformation(String userId,Model model,HttpServletRequest request) throws ParseException{
		String name =request.getParameter("name");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String birthday = request.getParameter("birthday");
		String numberId = request.getParameter("ID_Number");
		
		User user = this.userService.queryUserById(Integer.parseInt(userId));
		user.setName(name);
		user.setSex(sex);
		user.setAddress(address);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birth = sdf.parse(birthday);
		user.setBirthday(birth);
		user.setID_Number(numberId);
		this.userService.modifyUser(user);
		model.addAttribute("userId", userId);
		return "forward:/news/showPersonNewsList.form";
	}
	
	/**
	 * 前台用户登陆
	 * @return
	 */
	@RequestMapping("/login")
	public String login(String inputType,User user,Model model,String flag,HttpServletResponse resp,HttpSession session){
		if(user != null){
			User u = userService.queryUserByCondition(inputType);
			if(u != null){
				//用户存在
				if(u.getStatus().equals("1")){
					if(u.getPassword().equals(user.getPassword())){
						//密码正确
						int articleCount = userService.queryNewsCountByUser(u.getUser_Id());//用户发表文章数量
						int commentCount = userService.queryCommentCountByUser(u.getUser_Id());//用户评论文章数量
						session.setAttribute("articleCount", articleCount);
						session.setAttribute("commentCount", commentCount);
						session.setAttribute("userInfo", u);
						if("1".equals(flag)){
							Cookie c = new Cookie("myUserInfo",inputType+":"+u.getPassword());
							c.setMaxAge(60*60*24*14);
							c.setPath("/");		
							resp.addCookie(c);
						}
						return "forward:/notice/queryNoticeForUI.form";
						
					}else {
						//密码不正确
						model.addAttribute("message", "密码不正确");
						return "ui/login";
					}
				}else{
					//用户被停用
					model.addAttribute("message", "账号已被停用，请联系管理员进行解封！");
					return "ui/login";
				}
			}else {
				//用户不存在
				model.addAttribute("message", "用户不存在!");
				return "ui/login";
			}
		}else {
			model.addAttribute("message", "请登录");
			return "ui/login";
		}
	}
	
	/**
	 * 查询用户列表
	 * @param userService
	 */
	@RequestMapping("/userList")
	public String userList(String queryCondition,String startTime,String endTime,String pageNow,String pageSize,Model model){
		pageNow = pageNow==null?"1":pageNow;
		pageSize = pageSize==null?"10":pageSize;
		Page page = userService.queryUserByPage(queryCondition,startTime,endTime,Integer.parseInt(pageNow), Integer.parseInt(pageSize));
		//查询后数据显示
		model.addAttribute("page", page);
		model.addAttribute("queryCondition", queryCondition);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		return "admin/user-list";
	}
	
	/**
	 * 停用用户
	 * @param userId
	 * @return
	 */
	@RequestMapping("/userStop")
	public String user_Stop(String userId){
		this.userService.user_Stop(Integer.parseInt(userId));
		return "forward:/user/userList.form";
	}
	
	/**
	 * 启用用户
	 * @param request
	 * @return
	 */
	@RequestMapping("/userStart")
	public String user_Start(String userId){
		this.userService.user_Start(Integer.parseInt(userId));
		return "forward:/user/userList.form";
	}
	
	/**
	 * 作者审核
	 * @param request
	 * @return
	 */
	@RequestMapping("/zhuceEditor")
	public String user_Shenhe(String userId){
		this.userService.user_Shenhe(Integer.parseInt(userId));
		return "forward:/user/userList.form";
	}
	
	/**
	 * 在后台管理员查看用户个人信息		
	 * @param user_Id
	 * @param model
	 * @return
	 */
	@RequestMapping("/showUser")
	public String showUser(int user_Id,Model model){
		User user = userService.queryUserById(user_Id);
		model.addAttribute("u", user);
		return "admin/user-show";
	
	}
	
	@RequestMapping("/modifyUser")
	public String updateUser(String userId,Model model,HttpServletRequest request) throws ParseException{
		String nickname = request.getParameter("nickname");
		String sex = request.getParameter("sex");
		String birthday = request.getParameter("birthday");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String signature = request.getParameter("signature");
		
		User user  = this.userService.queryUserById(Integer.parseInt(userId));
		user.setNickname(nickname);
		user.setSex(sex);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birth = sdf.parse(birthday);
		user.setBirthday(birth);
		user.setTel(tel);
		user.setEmail(email);
		user.setSignature(signature);
		this.userService.modifyUser(user);
		model.addAttribute("u", user);
		return "ui/personal/personal-set";
	}
	
	/**
	 * 修改密码
	 * @param userId
	 * @param newpwd
	 * @return
	 */
	@RequestMapping("/modifyPass")
	public String modifyPass(String userId,String newpwd){
		this.userService.modifyPass(Integer.parseInt(userId), newpwd);
		return "ui/personal/update-pwd";
	}
	
	/**
	 * 修改头像
	 * @param 
	 * @param 
	 * @param session
	 * @return
	 */
	@RequestMapping("/updateImg")
	public String updateImg(@RequestParam(name="userImg")MultipartFile userImg,int userId,Model model,HttpSession session){
		User user = this.userService.queryUserById(userId);
		String uname = userImg.getOriginalFilename();
		user.setImage(uname);	
		String path = session.getServletContext().getRealPath("/jsp/ui/img");
		String localPath = path + "/" + uname;
		File f = new File(localPath);
		
			try {
				userImg.transferTo(f);
				userService.modifyImg(userId, user.getImage());
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			} 
		model.addAttribute("userId", userId);
		return "forward:/news/showPersonNewsList.form";
	}
	
	
	/**
	 * 用户查看自己的个人消息
	 * @return
	 */
	@RequestMapping("/showUserForUI")
	public String showUserForUI(String userId,Model model){
		User user = userService.queryUserById(Integer.parseInt(userId));
		model.addAttribute("u", user);
		return "ui/personal/personal-set";	
	}
	
	
	@RequestMapping("/findpwd1")
	public String findPwd1(String inputType, Model model){
		
		User u = userService.queryUserByCondition(inputType);
		if (u != null) {
			return "ui/forgetPwd/forgetpwd2";
		}else {
			return "ui/forgetPwd/forgetpwd1";
		}
		
	}
	
	@RequestMapping("/findpwd2")
	public String findPwd2(String inputType,HttpServletRequest request, Model model) throws Exception{
		request.setCharacterEncoding("utf-8");
		User u = userService.queryUserByCondition(inputType);
		String password = request.getParameter("newpwd1");
		if (u != null) {
			userService.modifyPass(u.getUser_Id(), password);
			return "ui/forgetPwd/forgetpwd3";
		}else {
			return "ui/forgetPwd/forgetpwd2";
		}
	
	}
	
	
	/**
	 * 前台用户退出登录
	 * @param request
	 * @return
	 */
	@RequestMapping("/exit")
	public String exit(HttpServletRequest request){
		request.getSession().invalidate();
		return "forward:/notice/queryNoticeForUI.form";
	}
	
	@Resource(name="userService")
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

}
