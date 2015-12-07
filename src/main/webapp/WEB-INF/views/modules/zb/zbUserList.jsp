<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
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
		<li class="active"><a href="${ctx}/zb/zbUser/">用户列表</a></li>
		<shiro:hasPermission name="zb:zbUser:edit"><li><a href="${ctx}/zb/zbUser/form">用户添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="zbUser" action="${ctx}/zb/zbUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>昵称：</label>
				<form:input path="wachtName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>微信Id：</label>
				<form:input path="wachtOpenId" htmlEscape="false" maxlength="128" class="input-medium"/>
			</li>
			<li><label>点赞数：</label>
				<form:input path="userPraise" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>职称：</label>
				<form:input path="userTitle" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>电话号码：</label>
				<form:input path="userPone" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>用户昵称：</label>
				<form:input path="nickName" htmlEscape="false" maxlength="40" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>昵称</th>
				<th>微信Id</th>
				<th>点赞数</th>
				<th>职称</th>
				<th>电话号码</th>
				<th>创建时间</th>
				<th>用户昵称</th>
				<th>城市</th>
				<th>省份</th>
				<th>国家</th>
				<shiro:hasPermission name="zb:zbUser:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="zbUser">
			<tr>
				<td><a href="${ctx}/zb/zbUser/form?id=${zbUser.id}">
					${zbUser.wachtName}
				</a></td>
				<td>
					${zbUser.wachtOpenId}
				</td>
				<td>
					${zbUser.userPraise}
				</td>
				<td>
					${zbUser.userTitle}
				</td>
				<td>
					${zbUser.userPone}
				</td>
				<td>
					<fmt:formatDate value="${zbUser.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${zbUser.nickName}
				</td>
				<td>
					${zbUser.wachatCity}
				</td>
				<td>
					${zbUser.wachatProvince}
				</td>
				<td>
					${zbUser.wachatCountry}
				</td>
				<shiro:hasPermission name="zb:zbUser:edit"><td>
    				<a href="${ctx}/zb/zbUser/form?id=${zbUser.id}">修改</a>
					<a href="${ctx}/zb/zbUser/delete?id=${zbUser.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>