/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zb.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.zb.entity.ZbUserDirect;
import com.thinkgem.jeesite.modules.zb.dao.ZbUserDirectDao;

/**
 * 直播列表管理需要审查Service
 * @author dao
 * @version 2015-12-05
 */
@Service
@Transactional(propagation=Propagation.NOT_SUPPORTED)
public class ZbUserDirectService extends CrudService<ZbUserDirectDao, ZbUserDirect> {

	public ZbUserDirect get(String id) {
		return super.get(id);
	}
	
	public List<ZbUserDirect> findList(ZbUserDirect zbUserDirect) {
		return super.findList(zbUserDirect);
	}
	
	public Page<ZbUserDirect> findPage(Page<ZbUserDirect> page, ZbUserDirect zbUserDirect) {
		return super.findPage(page, zbUserDirect);
	}
	public void save(ZbUserDirect zbUserDirect) {
		super.save(zbUserDirect);
	}
	public void delete(ZbUserDirect zbUserDirect) {
		super.delete(zbUserDirect);
	}
	
}