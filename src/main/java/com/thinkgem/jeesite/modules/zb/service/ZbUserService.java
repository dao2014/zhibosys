/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zb.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.dataSource.DBContextHolder;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.zb.entity.ZbUser;
import com.thinkgem.jeesite.modules.zb.dao.ZbUserDao;

/**
 * 直播用户管理Service
 * @author dao
 * @version 2015-12-05
 */
@Service
@Transactional(readOnly = true)
public class ZbUserService extends CrudService<ZbUserDao, ZbUser> {

	public ZbUser get(String id) {
		DBContextHolder.setDBType("1");
		return super.get(id);
	}
	
	public List<ZbUser> findList(ZbUser zbUser) {
		DBContextHolder.setDBType("1");
		return super.findList(zbUser);
	}
	
	public Page<ZbUser> findPage(Page<ZbUser> page, ZbUser zbUser) {
		return super.findPage(page, zbUser);
	}
	
	@Transactional(readOnly = false)
	public void save(ZbUser zbUser) {
		DBContextHolder.setDBType("1");
		super.save(zbUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(ZbUser zbUser) {
		DBContextHolder.setDBType("1");
		super.delete(zbUser);
	}
	
}