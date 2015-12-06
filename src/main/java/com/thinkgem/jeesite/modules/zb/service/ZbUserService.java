/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zb.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.dataSource.DBContextHolder;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.zb.dao.ZbUserDao;
import com.thinkgem.jeesite.modules.zb.entity.ZbUser;

/**
 * 直播用户管理Service
 * @author dao
 * @version 2015-12-05
 */
@Service
public class ZbUserService extends CrudService<ZbUserDao, ZbUser> {

	public ZbUser get(String id) {
		return super.get(id);
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<ZbUser> findList(ZbUser zbUser) {
		return super.findList(zbUser);
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Page<ZbUser> findPage(Page<ZbUser> page, ZbUser zbUser) {
		return super.findPage(page, zbUser);
	}
	public void save(ZbUser zbUser) {
		super.save(zbUser);
	}
	public void delete(ZbUser zbUser) {
		super.delete(zbUser);
	}
	
}