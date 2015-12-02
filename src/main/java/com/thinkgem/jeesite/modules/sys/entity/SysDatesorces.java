/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 动态数据库设置Entity
 * @author dao
 * @version 2015-12-03
 */
public class SysDatesorces extends DataEntity<SysDatesorces> {
	
	private static final long serialVersionUID = 1L;
	private String dbsType;		// 库类型
	private String dbsName;		// 名称
	private String dbsDriverClassName;		// 数据库驱动
	private String dbsUrl;		// 连接
	private String dbsUserName;		// 数据库名称
	private String dbsPassword;		// 密码
	
	public SysDatesorces() {
		super();
	}

	public SysDatesorces(String id){
		super(id);
	}

	@Length(min=1, max=4, message="库类型长度必须介于 1 和 4 之间")
	public String getDbsType() {
		return dbsType;
	}

	public void setDbsType(String dbsType) {
		this.dbsType = dbsType;
	}
	
	@Length(min=0, max=64, message="名称长度必须介于 0 和 64 之间")
	public String getDbsName() {
		return dbsName;
	}

	public void setDbsName(String dbsName) {
		this.dbsName = dbsName;
	}
	
	@Length(min=1, max=256, message="数据库驱动长度必须介于 1 和 256 之间")
	public String getDbsDriverClassName() {
		return dbsDriverClassName;
	}

	public void setDbsDriverClassName(String dbsDriverClassName) {
		this.dbsDriverClassName = dbsDriverClassName;
	}
	
	@Length(min=1, max=256, message="连接长度必须介于 1 和 256 之间")
	public String getDbsUrl() {
		return dbsUrl;
	}

	public void setDbsUrl(String dbsUrl) {
		this.dbsUrl = dbsUrl;
	}
	
	@Length(min=1, max=64, message="数据库名称长度必须介于 1 和 64 之间")
	public String getDbsUserName() {
		return dbsUserName;
	}

	public void setDbsUserName(String dbsUserName) {
		this.dbsUserName = dbsUserName;
	}
	
	@Length(min=1, max=32, message="密码长度必须介于 1 和 32 之间")
	public String getDbsPassword() {
		return dbsPassword;
	}

	public void setDbsPassword(String dbsPassword) {
		this.dbsPassword = dbsPassword;
	}
	
}