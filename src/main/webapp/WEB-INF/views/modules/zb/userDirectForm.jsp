<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>审查成功管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/zb/userDirect/">审查成功列表</a></li>
		<li class="active"><a href="${ctx}/zb/userDirect/form?id=${userDirect.id}">审查成功<shiro:hasPermission name="zb:userDirect:edit">${not empty userDirect.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="zb:userDirect:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="userDirect" action="${ctx}/zb/userDirect/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">user_id：</label>
			<div class="controls">
				<form:input path="user.id" htmlEscape="false" maxlength="32" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">直播人员微信ID：</label>
			<div class="controls">
				<form:input path="wechtOpenId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">直播简介：</label>
			<div class="controls">
				<form:input path="directDes" htmlEscape="false" maxlength="400" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">点赞数：</label>
			<div class="controls">
				<form:input path="directPraise" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">课程类型Id：</label>
			<div class="controls">
				<form:input path="directTypeId" htmlEscape="false" maxlength="32" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">密码：</label>
			<div class="controls">
				<form:input path="directPassword" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预约开始直播时间：</label>
			<div class="controls">
				<input name="directStartTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${userDirect.directStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预约结束直播时间：</label>
			<div class="controls">
				<input name="directEndTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${userDirect.directEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">创建时间：</label>
			<div class="controls">
				<input name="directCreateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${userDirect.directCreateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">更新时间：</label>
			<div class="controls">
				<input name="directUpdateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${userDirect.directUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">观看人数：</label>
			<div class="controls">
				<form:input path="directNumber" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否在直播0直播待审查 1默认等待直播,2正在直播 3 直播结束 4.没发布 5 已经发布：</label>
			<div class="controls">
				<form:select path="directStatus" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('direct_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">0 默认待审查 1. 审查 通过：</label>
			<div class="controls">
				<form:select path="directExamine" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('direct_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="zb:userDirect:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>