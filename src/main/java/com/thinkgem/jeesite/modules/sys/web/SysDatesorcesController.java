/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

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
import com.thinkgem.jeesite.modules.sys.entity.SysDatesorces;
import com.thinkgem.jeesite.modules.sys.service.SysDatesorcesService;

/**
 * 动态数据库设置Controller
 * @author dao
 * @version 2015-12-03
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/sysDatesorces")
public class SysDatesorcesController extends BaseController {

	@Autowired
	private SysDatesorcesService sysDatesorcesService;
	
	@ModelAttribute
	public SysDatesorces get(@RequestParam(required=false) String id) {
		SysDatesorces entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysDatesorcesService.get(id);
		}
		if (entity == null){
			entity = new SysDatesorces();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:sysDatesorces:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysDatesorces sysDatesorces, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysDatesorces> page = sysDatesorcesService.findPage(new Page<SysDatesorces>(request, response), sysDatesorces); 
		model.addAttribute("page", page);
		return "modules/sys/sysDatesorcesList";
	}

	@RequiresPermissions("sys:sysDatesorces:view")
	@RequestMapping(value = "form")
	public String form(SysDatesorces sysDatesorces, Model model) {
		model.addAttribute("sysDatesorces", sysDatesorces);
		return "modules/sys/sysDatesorcesForm";
	}

	@RequiresPermissions("sys:sysDatesorces:edit")
	@RequestMapping(value = "save")
	public String save(SysDatesorces sysDatesorces, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysDatesorces)){
			return form(sysDatesorces, model);
		}
		sysDatesorcesService.save(sysDatesorces);
		addMessage(redirectAttributes, "保存数据库成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysDatesorces/?repage";
	}
	
	@RequiresPermissions("sys:sysDatesorces:edit")
	@RequestMapping(value = "delete")
	public String delete(SysDatesorces sysDatesorces, RedirectAttributes redirectAttributes) {
		sysDatesorcesService.delete(sysDatesorces);
		addMessage(redirectAttributes, "删除数据库成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysDatesorces/?repage";
	}

}