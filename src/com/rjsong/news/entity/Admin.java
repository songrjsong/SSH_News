package com.rjsong.news.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @author rjsong
 *
 */

@Entity
@Table(name="NEWS_ADMIN")
public class Admin {

	private Integer admin_Id;//管理员Id
	private String username;//用户名
	private String password;//密码
	
	@Id
	@GeneratedValue
	public Integer getAdmin_Id() {
		return admin_Id;
	}
	public void setAdmin_Id(Integer admin_Id) {
		this.admin_Id = admin_Id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
