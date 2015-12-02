/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.SysDatesorces;

/**
 * 动态数据库设置DAO接口
 * @author dao
 * @version 2015-12-03
 */
@MyBatisDao
public interface SysDatesorcesDao extends CrudDao<SysDatesorces> {
	
}