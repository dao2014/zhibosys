/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zb.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 直播用户管理Entity
 * @author dao
 * @version 2015-12-07
 */
public class ZbUser extends DataEntity<ZbUser> {
	
	private static final long serialVersionUID = 1L;
	private String userName;		// 名字
	private String userPassword;		// user_password
	private String wachtName;		// 昵称
	private String wachtOpenId;		// 微信Id
	private String wachtUnitId;		// wacht_unit_id
	private String userPraise;		// 点赞数
	private String userTitle;		// 职称
	private String userPone;		// 电话号码
	private String userSex;		// 性别
	private String userStatus;		// 是否有效
	private Date createTime;		// 创建时间
	private Date updateTime;		// 更新时间
	private String nickName;		// 用户昵称
	private String userHeadImage;		// 用户头像
	private String wachatCity;		// 城市
	private String wachatProvince;		// 省份
	private String wachatCountry;		// 国家
	
	public ZbUser() {
		super();
	}

	public ZbUser(String id){
		super(id);
	}

	@Length(min=0, max=40, message="名字长度必须介于 0 和 40 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=0, max=64, message="user_password长度必须介于 0 和 64 之间")
	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	@Length(min=0, max=100, message="昵称长度必须介于 0 和 100 之间")
	public String getWachtName() {
		return wachtName;
	}

	public void setWachtName(String wachtName) {
		this.wachtName = wachtName;
	}
	
	@Length(min=0, max=128, message="微信Id长度必须介于 0 和 128 之间")
	public String getWachtOpenId() {
		return wachtOpenId;
	}

	public void setWachtOpenId(String wachtOpenId) {
		this.wachtOpenId = wachtOpenId;
	}
	
	@Length(min=0, max=128, message="wacht_unit_id长度必须介于 0 和 128 之间")
	public String getWachtUnitId() {
		return wachtUnitId;
	}

	public void setWachtUnitId(String wachtUnitId) {
		this.wachtUnitId = wachtUnitId;
	}
	
	@Length(min=0, max=10, message="点赞数长度必须介于 0 和 10 之间")
	public String getUserPraise() {
		return userPraise;
	}

	public void setUserPraise(String userPraise) {
		this.userPraise = userPraise;
	}
	
	@Length(min=0, max=2, message="职称长度必须介于 0 和 2 之间")
	public String getUserTitle() {
		return userTitle;
	}

	public void setUserTitle(String userTitle) {
		this.userTitle = userTitle;
	}
	
	@Length(min=0, max=11, message="电话号码长度必须介于 0 和 11 之间")
	public String getUserPone() {
		return userPone;
	}

	public void setUserPone(String userPone) {
		this.userPone = userPone;
	}
	
	@Length(min=0, max=1, message="性别长度必须介于 0 和 1 之间")
	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	
	@Length(min=0, max=2, message="是否有效长度必须介于 0 和 2 之间")
	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	@Length(min=0, max=40, message="用户昵称长度必须介于 0 和 40 之间")
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	@Length(min=0, max=500, message="用户头像长度必须介于 0 和 500 之间")
	public String getUserHeadImage() {
		return userHeadImage;
	}

	public void setUserHeadImage(String userHeadImage) {
		this.userHeadImage = userHeadImage;
	}
	
	@Length(min=0, max=50, message="城市长度必须介于 0 和 50 之间")
	public String getWachatCity() {
		return wachatCity;
	}

	public void setWachatCity(String wachatCity) {
		this.wachatCity = wachatCity;
	}
	
	@Length(min=0, max=50, message="省份长度必须介于 0 和 50 之间")
	public String getWachatProvince() {
		return wachatProvince;
	}

	public void setWachatProvince(String wachatProvince) {
		this.wachatProvince = wachatProvince;
	}
	
	@Length(min=0, max=50, message="国家长度必须介于 0 和 50 之间")
	public String getWachatCountry() {
		return wachatCountry;
	}

	public void setWachatCountry(String wachatCountry) {
		this.wachatCountry = wachatCountry;
	}
	
}