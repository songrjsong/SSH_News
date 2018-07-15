package com.rjsong.news.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="NEWS_USER")
public class User {
	
	private Integer user_Id; //编辑者的ID
	private String password;//密码
	private String nickname;//昵称
	private String name;//真实姓名
	private String image; //头像
	private String tel;//电话
	private String ID_Number;//身份证号
	private String email;//邮箱
	private String sex;//性别
	private Date birthday;//生日
	private int level;//等级
	private String signature;//个人签名
	private String address;//地址
	private Date regTime;//注册时间
	private Date loginTime;//登录时间
	private String status;//状态
	private String is_editor;//是否为编辑
	
	@Id
	@GeneratedValue
	public Integer getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(Integer user_Id) {
		this.user_Id = user_Id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getID_Number() {
		return ID_Number;
	}
	public void setID_Number(String iD_Number) {
		ID_Number = iD_Number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIs_editor() {
		return is_editor;
	}
	public void setIs_editor(String is_editor) {
		this.is_editor = is_editor;
	}

	
}
