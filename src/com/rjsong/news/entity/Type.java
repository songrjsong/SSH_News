package com.rjsong.news.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="NEWS_TYPE")
public class Type {
	private Integer type_Id;//类型ID
	private String typeName;//类型名称
	private String introduce;//备注

	@Id
	@GeneratedValue
	public Integer getType_Id() {
		return type_Id;
	}
	public void setType_Id(Integer type_Id) {
		this.type_Id = type_Id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
}
