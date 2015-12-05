/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zb.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.zb.entity.ZbUser;

/**
 * 直播用户管理DAO接口
 * @author dao
 * @version 2015-12-05
 */
@MyBatisDao
public interface ZbUserDao extends CrudDao<ZbUser> {

	
}