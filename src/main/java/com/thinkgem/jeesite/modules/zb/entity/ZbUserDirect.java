/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zb.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 直播列表管理需要审查Entity
 * @author dao
 * @version 2015-12-07
 */
public class ZbUserDirect extends DataEntity<ZbUserDirect> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// user_id
	private String wechtOpenId;		// 主播Id
	private String directDes;		// 简介
	private String directPraise;		// 点赞数
	private String directTypeId;		// 课程类型Id
	private String directPassword;		// 密码
	private Date directStartTime;		// 开始时间
	private Date directEndTime;		// 结束时间
	private Date directCreateTime;		// 创建时间
	private Date directUpdateTime;		// 更新时间
	private String directNumber;		// 观看人数
	private String directStatus;		// 直播状态
	private String directExamine;		// 审查状态
	
	public ZbUserDirect() {
		super();
	}

	public ZbUserDirect(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=1, max=64, message="主播Id长度必须介于 1 和 64 之间")
	public String getWechtOpenId() {
		return wechtOpenId;
	}

	public void setWechtOpenId(String wechtOpenId) {
		this.wechtOpenId = wechtOpenId;
	}
	
	@Length(min=0, max=400, message="简介长度必须介于 0 和 400 之间")
	public String getDirectDes() {
		return directDes;
	}

	public void setDirectDes(String directDes) {
		this.directDes = directDes;
	}
	
	@Length(min=0, max=10, message="点赞数长度必须介于 0 和 10 之间")
	public String getDirectPraise() {
		return directPraise;
	}

	public void setDirectPraise(String directPraise) {
		this.directPraise = directPraise;
	}
	
	@Length(min=0, max=32, message="课程类型Id长度必须介于 0 和 32 之间")
	public String getDirectTypeId() {
		return directTypeId;
	}

	public void setDirectTypeId(String directTypeId) {
		this.directTypeId = directTypeId;
	}
	
	@Length(min=0, max=50, message="密码长度必须介于 0 和 50 之间")
	public String getDirectPassword() {
		return directPassword;
	}

	public void setDirectPassword(String directPassword) {
		this.directPassword = directPassword;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDirectStartTime() {
		return directStartTime;
	}

	public void setDirectStartTime(Date directStartTime) {
		this.directStartTime = directStartTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDirectEndTime() {
		return directEndTime;
	}

	public void setDirectEndTime(Date directEndTime) {
		this.directEndTime = directEndTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDirectCreateTime() {
		return directCreateTime;
	}

	public void setDirectCreateTime(Date directCreateTime) {
		this.directCreateTime = directCreateTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDirectUpdateTime() {
		return directUpdateTime;
	}

	public void setDirectUpdateTime(Date directUpdateTime) {
		this.directUpdateTime = directUpdateTime;
	}
	
	@Length(min=0, max=11, message="观看人数长度必须介于 0 和 11 之间")
	public String getDirectNumber() {
		return directNumber;
	}

	public void setDirectNumber(String directNumber) {
		this.directNumber = directNumber;
	}
	
	@Length(min=0, max=1, message="直播状态长度必须介于 0 和 1 之间")
	public String getDirectStatus() {
		return directStatus;
	}

	public void setDirectStatus(String directStatus) {
		this.directStatus = directStatus;
	}
	
	@Length(min=0, max=1, message="审查状态长度必须介于 0 和 1 之间")
	public String getDirectExamine() {
		return directExamine;
	}

	public void setDirectExamine(String directExamine) {
		this.directExamine = directExamine;
	}
	
}