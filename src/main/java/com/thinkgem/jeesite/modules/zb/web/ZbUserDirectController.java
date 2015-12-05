/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zb.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.zb.entity.ZbUserDirect;
import com.thinkgem.jeesite.modules.zb.service.ZbUserDirectService;

/**
 * 直播列表管理需要审查Controller
 * @author dao
 * @version 2015-12-05
 */
@Controller
@RequestMapping(value = "${adminPath}/zb/zbUserDirect")
public class ZbUserDirectController extends BaseController {

	@Autowired
	private ZbUserDirectService zbUserDirectService;
	
	@ModelAttribute
	public ZbUserDirect get(@RequestParam(required=false) String id) {
		ZbUserDirect entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = zbUserDirectService.get(id);
		}
		if (entity == null){
			entity = new ZbUserDirect();
		}
		return entity;
	}
	
	@RequiresPermissions("zb:zbUserDirect:view")
	@RequestMapping(value = {"list", ""})
	public String list(ZbUserDirect zbUserDirect, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ZbUserDirect> page = zbUserDirectService.findPage(new Page<ZbUserDirect>(request, response), zbUserDirect); 
		model.addAttribute("page", page);
		return "modules/zb/zbUserDirectList";
	}

	@RequiresPermissions("zb:zbUserDirect:view")
	@RequestMapping(value = "form")
	public String form(ZbUserDirect zbUserDirect, Model model) {
		model.addAttribute("zbUserDirect", zbUserDirect);
		return "modules/zb/zbUserDirectForm";
	}

	@RequiresPermissions("zb:zbUserDirect:edit")
	@RequestMapping(value = "save")
	public String save(ZbUserDirect zbUserDirect, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, zbUserDirect)){
			return form(zbUserDirect, model);
		}
		zbUserDirectService.save(zbUserDirect);
		addMessage(redirectAttributes, "保存审查成功成功");
		return "redirect:"+Global.getAdminPath()+"/zb/zbUserDirect/?repage";
	}
	
	@RequiresPermissions("zb:zbUserDirect:edit")
	@RequestMapping(value = "delete")
	public String delete(ZbUserDirect zbUserDirect, RedirectAttributes redirectAttributes) {
		zbUserDirectService.delete(zbUserDirect);
		addMessage(redirectAttributes, "删除审查成功成功");
		return "redirect:"+Global.getAdminPath()+"/zb/zbUserDirect/?repage";
	}

}