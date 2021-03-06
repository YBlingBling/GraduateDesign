<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/sys/querySimpleUser.do">
	<input type="hidden" name="pageNum" value="" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/querySimpleUser.do" method="post">
	<div class="searchBar">
		<table>
			<tr>
			<td><span style="margin-left: 5px">姓名:</span><input  type="text" name="s_user.userName" value=""/></td>
			<td>
			<div class="buttonActive" style="margin-left: 10px"><div class="buttonContent"><button type="submit"><i class="fa fa-search"></i>  搜索</button></div></div>
			</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/sys/add2SimpleUser.do" target="navTab"  rel="baseAdd" title="添加信息"> <span>添加</span></a></li>
			<li><a class="edit" href="${ctx}/sys/getSimpleUser.do?uid={sid_select}" target="navTab" rel="baseAdd" warn="请选择一条信息,点击需要修改的行" title="修改信息"><span>修改</span></a></li>
			<li><a title="确实要删除这些信息吗?" target="selectedTodo" rel="ids" postType="string" href="${ctx}/sys/deleteSimpleUser.do" class="delete" warn="请选择需要删除的信息"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="112">
		<thead>
			<tr>
				<th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="100">账号</th>
				<th width="100">姓名</th>
				<th width="100">性别</th>
				<th width="100">联系电话</th>
				<th width="100">邮箱</th>
				<th width="100">出生日期</th>
				<th width="100">联系地址</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
			<tr target="sid_select" rel="${item.id }">
				<td><input name="ids" value="${item.id }" type="checkbox"></td>
				<td>${item.user.uname}</td>
				<td>${item.user.userName}</td>
				<td>
					${item.user.userGender}
				</td>
				<td>${item.user.userPhone}</td>
				<td>${item.user.userEmail}</td>
				<td>${item.user.userBirth}</td>
				<td>${item.user.userAddress}</td>
				<td width="70">
					<a title="详细信息"  href="${ctx}/sys/getSimpleUser.do?uid=${item.id}" class="btnEdit" target="navTab" rel="baseAdd">详细信息</a>
					<a title="确实要删除这条记录吗?" target="ajaxTodo" href="${ctx}/sys/deleteSimpleUser.do?ids=${item.id}" class="btnDel" style="margin-left: 10px">删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>共${SESSION_PAGE.totalNumber}条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${SESSION_PAGE.totalNumber}" numPerPage="${SESSION_PAGE.itemsPerPage}" pageNumShown="10" currentPage="${SESSION_PAGE.currentPageNumber}"></div>
	</div>
</div>
<%@ include file="../common/clear.jsp"%>
