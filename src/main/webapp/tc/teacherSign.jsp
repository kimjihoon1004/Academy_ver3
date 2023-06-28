<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 삽입 -->
<%@page import="com.eugene.common.db.SqlSessionCtrl"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.*"%>
<%@ page language ="java" import = "java.sql.*"%>
<%@page import="com.eugene.tc.item.TeacherItem" %>
<%@page import="com.eugene.tc.ctrl.TeacherCheckControl" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ include file="../include/suCheck.inc" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>teacher sign</title>
</head>
<body>
<center>
	<header>
	
	<h1> 교직원 승인 </h1>

<% 
String name = (String)request.getParameter("tc_name");

TeacherItem tItem = new TeacherItem();
List<TeacherItem> items = new ArrayList<TeacherItem>();

tItem.setName(name);

TeacherCheckControl control = new TeacherCheckControl();
items = control.searchName(tItem);

%>
 
        <table border="1" cellspacing="0">
			<tr>
					<th>이름</th>
					<th>메일</th>
					<th>번호</th>
					<th>승인</th>
					<!--  <script>
			        alert("해당 교직원의 가입을 승인하였습니다.");
					</script>
					-->
			</tr>
<%
String a = "";
String b = "";
String c = "";



for(int i = 0; i<items.size(); i++)
{
	a = items.get(i).getName();
	b = items.get(i).getId();
	c = items.get(i).getPhone();
%>
 			<tr>  
 			    <td><a href="teacherInformation.jsp?name=<%=items.get(i).getId() %>"><%=a %></a></td>
 			    <td><%=b %></td>
 			    <td><%=c %></td>
 			     <td><button type = "button" href="teacherSign.jsp" onclick="alert('해당 교직원의 가입을 승인하였습니다.')">승인</button>
 			     <button type = "button" href="teacherSign.jsp" onclick="alert('해당 교직원의 가입을 거부하였습니다.')">거부</button></td>
 			</tr>
<%
}
%>

 </center>

<button type="button" onclick="location.href='teacherCheck.jsp'">뒤로가기</button>
</body>
</html>