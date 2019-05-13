<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<% 
	String path = request.getContextPath();
	String path2 = path.substring(1);
%>
<script type="text/javascript" src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" ></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.table2excel.js"></script>
<%
	System.out.print(path+"===============");
%>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

.admin {
	height: 200px;
	background: rgb(251, 186, 49);
	font-size: 100px;
}

.top {
	background: rgb(251, 186, 49);
}

.down {
	background: rgb(35, 35, 35);
}
</style>
<script type="text/javascript">
	$(function() {
		$(".btn").click(function(){
			alert("导出成功 "),
            $(".table2excel").table2excel({
                // 导出的Excel文档的名称
                name: "Excel Document Name",
                // Excel文件的名称
                filename: "学生信息表",
                //文件后缀名
                fileext: ".xls"
            });
        }); 
		$(".delete").click(function() {
			var name = $(this).next(":hidden").val();
			var flag = confirm("确定要删除" + name + "的信息吗?");
			if (flag) {
				var $tr = $(this).parent().parent();
				var url = this.href;
				var args = {
					"time" : new Date()
				};
				$.post(url, args, function(data) {
					if (data == "1") {
						alert("删除成功!");
						$tr.remove();
					} else {
						alert("删除失败!");
					}
				});
			}
			return false;
		});
	});
</script>


</head>
<body>
	<div class="jumbotron text-center top" style="margin-bottom: 0">
		<h1>华软自来水管理系统</h1>
		<p>Water Management System in Colleges and Universities</p>
	</div>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="https://www.sise.com.cn/">华软首页</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">主页</a></li>
					<li><a href="http://home.sise.cn/">华软首页</a></li>
					<li><a href="http://class.sise.com.cn:7001/sise/">MySise</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<h1>学生信息管理平台</h1>
		<hr>
		<a href="student-input">添加学生</a> 
		<input class="btn" type="button" value="点击导出"> 
		<br>
		<div class="table2excel">
			<table id="testTable" class="table table-striped table-bordered table-hover">
				<tr class="danger">
					<td>姓名</td>
					<td>宿舍号</td>
					<td>学号</td>
					<td>年级</td>
					<td>系别</td>
					<td>操作</td>
				</tr>
				<s:iterator value="#request.student">
					<tr>
						<td>${name }</td>
						<td>${tbRoom.room }</td>
						<td>${studentNumber }</td>
						<td>${grade }</td>
						<td>${part }</td>
						<td><a href="student-delete?id=${id }" class="delete">删除</a>
							<input type="hidden" value="${name }" /></td>
					</tr>
				</s:iterator>
			</table>
		</div>
	</div>
	<div class="jumbotron text-center down" style="margin-bottom: 0">
		<p class="link">
			<span style="color: white;">Copyright &copy; 9102.Company name
				All rights reserved.by__<a target="_blank" href="test1"
				style="color: darkorange;">&nbsp;Seashell Huang</a>
			</span>
		</p>
	</div>
</body>
</html>