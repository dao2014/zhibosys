package com.thinkgem.jeesite.common.aop;

import java.sql.SQLException;
import java.util.Map;

import org.apache.commons.dbcp.BasicDataSource;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.thinkgem.jeesite.common.dataSource.DBContextHolder;
import com.thinkgem.jeesite.common.dataSource.DynamicDataSource;

@Component
@Aspect
public class DateSourceAop {
	
	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	DynamicDataSource  dynamicDataSource;
	
	
	@Pointcut("execution(* com.thinkgem.jeesite.modules.zb.service.*.*(..)) or execution(* com.thinkgem.jeesite.common.persistence.interceptor.intercept(..)) ")
	public void startUserSource(){
		logger.info("===========================>拦截切入点 @Pointcut注解指定了切点 ");
	}
	
	
	@Before("startUserSource()")  
    public void setDynamicDataSource(JoinPoint jp) {  
		DBContextHolder.setDBType("1"); 
    } 
	
	@After("startUserSource()")
	public void killSrouse(JoinPoint jp){
			Map<Object, Object> _targetDataSources = dynamicDataSource.get_targetDataSources();
			BasicDataSource bds = (BasicDataSource) _targetDataSources.get("1");
			try {
				bds.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		DBContextHolder.clearDBType();
		System.out.println(">>>>>>>>　增加用户--检查完毕！未发现异常!..........");
	}
	
}
