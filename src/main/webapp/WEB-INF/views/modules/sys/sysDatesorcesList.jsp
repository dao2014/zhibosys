<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>数据库管理</title>
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
		<li class="active"><a href="${ctx}/sys/sysDatesorces/">数据库列表</a></li>
		<shiro:hasPermission name="sys:sysDatesorces:edit"><li><a href="${ctx}/sys/sysDatesorces/form">数据库添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sysDatesorces" action="${ctx}/sys/sysDatesorces/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>库类型：</label>
				<form:input path="dbsType" htmlEscape="false" maxlength="4" class="input-medium"/>
			</li>
			<li><label>名称：</label>
				<form:input path="dbsName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>连接：</label>
				<form:input path="dbsUrl" htmlEscape="false" maxlength="256" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>库类型</th>
				<th>名称</th>
				<th>数据库驱动</th>
				<th>连接</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sys:sysDatesorces:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysDatesorces">
			<tr>
				<td><a href="${ctx}/sys/sysDatesorces/form?id=${sysDatesorces.id}">
					${sysDatesorces.dbsType}
				</a></td>
				<td>
					${sysDatesorces.dbsName}
				</td>
				<td>
					${sysDatesorces.dbsDriverClassName}
				</td>
				<td>
					${sysDatesorces.dbsUrl}
				</td>
				<td>
					<fmt:formatDate value="${sysDatesorces.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${sysDatesorces.remarks}
				</td>
				<shiro:hasPermission name="sys:sysDatesorces:edit"><td>
    				<a href="${ctx}/sys/sysDatesorces/form?id=${sysDatesorces.id}">修改</a>
					<a href="${ctx}/sys/sysDatesorces/delete?id=${sysDatesorces.id}" onclick="return confirmx('确认要删除该数据库吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>