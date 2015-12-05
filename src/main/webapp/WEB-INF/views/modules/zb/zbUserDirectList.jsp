<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>审查成功管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/zb/zbUserDirect/">审查成功列表</a></li>
		<shiro:hasPermission name="zb:zbUserDirect:edit"><li><a href="${ctx}/zb/zbUserDirect/form">审查成功添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="zbUserDirect" action="${ctx}/zb/zbUserDirect/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>直播人员微信ID：</label>
				<form:input path="wechtOpenId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>预约开始直播时间：</label>
				<input name="directStartTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${zbUserDirect.directStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>预约结束直播时间：</label>
				<input name="directEndTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${zbUserDirect.directEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>是否在直播0直播待审查 1默认等待直播,2正在直播 3 直播结束 4.没发布 5 已经发布：</label>
				<form:select path="directStatus" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('direct_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>0 默认待审查 1. 审查 通过：</label>
				<form:select path="directExamine" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('direct_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>直播人员微信ID</th>
				<th>直播简介</th>
				<th>点赞数</th>
				<th>课程类型Id</th>
				<th>密码</th>
				<th>预约开始直播时间</th>
				<th>预约结束直播时间</th>
				<th>观看人数</th>
				<th>是否在直播0直播待审查 1默认等待直播,2正在直播 3 直播结束 4.没发布 5 已经发布</th>
				<th>0 默认待审查 1. 审查 通过</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="zb:zbUserDirect:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="zbUserDirect">
			<tr>
				<td><a href="${ctx}/zb/zbUserDirect/form?id=${zbUserDirect.id}">
					${zbUserDirect.wechtOpenId}
				</a></td>
				<td>
					${zbUserDirect.directDes}
				</td>
				<td>
					${zbUserDirect.directPraise}
				</td>
				<td>
					${zbUserDirect.directTypeId}
				</td>
				<td>
					${zbUserDirect.directPassword}
				</td>
				<td>
					<fmt:formatDate value="${zbUserDirect.directStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${zbUserDirect.directEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${zbUserDirect.directNumber}
				</td>
				<td>
					${fns:getDictLabel(zbUserDirect.directStatus, 'direct_status', '')}
				</td>
				<td>
					${fns:getDictLabel(zbUserDirect.directExamine, 'direct_type', '')}
				</td>
				<td>
					<fmt:formatDate value="${zbUserDirect.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${zbUserDirect.remarks}
				</td>
				<shiro:hasPermission name="zb:zbUserDirect:edit"><td>
    				<a href="${ctx}/zb/zbUserDirect/form?id=${zbUserDirect.id}">修改</a>
					<a href="${ctx}/zb/zbUserDirect/delete?id=${zbUserDirect.id}" onclick="return confirmx('确认要删除该审查成功吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>