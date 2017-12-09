<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>同步分页</title>
  </head>
  <body>
	
	<!-- 输入区 -->
	<form action="${pageContext.request.contextPath}/ArticleServlet" method="POST">
		<input type="hidden" name="currPageNO" value="1"/>
		<table border="2" align="center">
			<tr>
				<th>输入关键字</th>
				<td><input type="text" name="keywords" value="${requestScope.KEYWORDS}" maxlength="10"/></td>
				<td><input id="search" type="button" value="站内搜索"/></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		//去空格
		function trim(str){//"  培训      "
			//先去左边空格
			str = str.replace(/^\s*/,"");//"培训      ""
			//后去右边空格
			str = str.replace(/\s*$/,"");//"培训"
			//返回str
			return str;
		}
		//定位"站内搜索"按钮，同时提供单击事件
		document.getElementById("search").onclick = function(){
			//定位表单
			var formElement = document.forms[0];
			//获取关键字
			var keywords = formElement.keywords.value;
			//去空格
			keywords = trim(keywords);
			//判断长度
			if(keywords.length == 0){
				//提示
				alert("你没有填关键字!!!");
			}else{
				//提交表单
				formElement.submit();
			}
		}
	</script>
	
	
	
	
	
	
	<!-- 显示区 -->
	<table border="2" align="center" width="70%">
		<tr>
			<th>编号</th>
			<th>标题</th>
			<th>内容</th>
		</tr>
		<c:forEach var="article" items="${requestScope.PAGE.articleList}">
			<tr>
				<td>${article.id}</td>
				<td>${article.title}</td>
				<td>${article.content}</td>
			</tr>
		</c:forEach>
		<tr>
			<th colspan="3" align="center">
			
				<a onclick="fy(1)" style="cursor:hand;color:blue;text-decoration:underline">首页</a>
				
				<c:choose>
					<c:when test="${requestScope.PAGE.currPageNO+1<=requestScope.PAGE.allPageNO}">
						<a onclick="fy(${requestScope.PAGE.currPageNO+1})" style="cursor:hand;color:blue;text-decoration:underline">下一页</a>
					</c:when>
					<c:otherwise>
						下一页				
					</c:otherwise>
				</c:choose>
				
				
				<a onclick="fy()" style="cursor:hand;color:blue;text-decoration:underline">上一页</a>
				
				<a onclick="fy(${requestScope.PAGE.allPageNO})" style="cursor:hand;color:blue;text-decoration:underline">未页</a>
				
			</th>
		</tr>
	</table>
	<script type="text/javascript">
		function fy(currPageNO){
			//定位表单
			var formElement = document.forms[0];
			//修改当前页号
			formElement.currPageNO.value = currPageNO;
			//提交表单
			formElement.submit();
		}
	</script>
	
		
		
  </body>
</html>