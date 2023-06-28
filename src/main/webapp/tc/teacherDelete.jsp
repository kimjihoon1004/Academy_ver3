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
<title>teacher delete</title>
</head>
<body>

	
<% 
String mail = request.getParameter("id");

TeacherItem tItem = new TeacherItem();
TeacherCheckControl control = new TeacherCheckControl();

tItem.setId(mail);
int temp = 0;
temp = control.teacherDelete(tItem);

if(temp > 0)    {
%>
	<script>
	alert("교직원 탈퇴가 완료되었습니다.");
	location.href='teacherCheck.jsp';
	</script>
 <%} else { %>
    <script>
	alert("교직원 탈퇴가 실패하였습니다.");
	location.href='teacherCheck.jsp';
	</script>
 <%} %>
</body>
</html>