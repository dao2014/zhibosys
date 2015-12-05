<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>获取用户成功管理</title>
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
		<li class="active"><a href="${ctx}/zb/zbUser/">获取用户成功列表</a></li>
		<shiro:hasPermission name="zb:zbUser:edit"><li><a href="${ctx}/zb/zbUser/form">获取用户成功添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="zbUser" action="${ctx}/zb/zbUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名字</th>
				<th>微信Id</th>
				<th>点赞数</th>
				<th>职称</th>
				<th>电话号码</th>
				<th>创建时间</th>
				<th>用户昵称</th>
				<shiro:hasPermission name="zb:zbUser:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="zbUser">
			<tr>
				<td><a href="${ctx}/zb/zbUser/form?id=${zbUser.id}">
					${zbUser.userName}
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
				<shiro:hasPermission name="zb:zbUser:edit"><td>
    				<a href="${ctx}/zb/zbUser/form?id=${zbUser.id}">修改</a>
					<a href="${ctx}/zb/zbUser/delete?id=${zbUser.id}" onclick="return confirmx('确认要删除该获取用户成功吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>