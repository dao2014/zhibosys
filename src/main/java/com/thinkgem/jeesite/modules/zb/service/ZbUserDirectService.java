/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zb.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.JedisUtils;
import com.thinkgem.jeesite.modules.zb.ControllerMessage;
import com.thinkgem.jeesite.modules.zb.dao.ZbUserDirectDao;
import com.thinkgem.jeesite.modules.zb.entity.ZbUserDirect;

/**
 * 直播列表管理需要审查Service
 * @author dao
 * @version 2015-12-07
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
		if(zbUserDirect.getDirectStatus().equals("1") && zbUserDirect.getDirectStatus().equals("0"))
			createDirectRedis(zbUserDirect);
	}
	
	public void delete(ZbUserDirect zbUserDirect) {
		super.delete(zbUserDirect);
	}
	
	/**
	 * 创建 用户 预约听直播的人 对应的缓存 
	 * @return
	 */
	public boolean createDirectRedis(ZbUserDirect ud){
		String openId = ud.getWechtOpenId();
		Date start = ud.getDirectStartTime();
		Date end = ud.getDirectEndTime();
		JedisUtils.getResource().lpush(openId+ControllerMessage.OPEN_ID_SEELING, ud.getId()+","+DateUtils.formateDate(start)+","+DateUtils.formateDate(end));
		int scon = DateUtils.dateSecondDiff(new Date(),end );
		logger.info("失效时间"+scon);
		JedisUtils.getResource().expire(openId+ControllerMessage.OPEN_ID_SEELING, scon);
		return true;
	}
	
}