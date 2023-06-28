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
<title>teacher update</title>
</head>
<body>

	<header>
	
	<h1> 교직원 정보 </h1>
	 <form action = "teacherUpdateform.jsp">
     
<% 
String id = request.getParameter("id");
System.out.print("teacher information2 : "+ id);
TeacherItem tItem = new TeacherItem();

TeacherCheckControl control = new TeacherCheckControl();

tItem.setId(id);
tItem = control.teacherInformation(tItem);

%> 
     이름 : 
     <input type="text" name="name" value= <%= tItem.getName() %>><br>
     아이디(메일) :
      <input type="text" name="id" value= <%= tItem.getId() %>><br>
     생년월일 : 
      <input type="text" name="date" value= <%= tItem.getDate() %>><br>
     성별 :
      <input type="text" name="gender" value= <%= tItem.getGender() %>><br>
     휴대폰번호 : 
      <input type="text" name="phone" value= <%= tItem.getPhone() %>><br>
     메모사항 : 
      <input type="text" name="memo" value= <%= tItem.getMemo() %>><br>
     비밀번호 : 
      <input type="text" name="pw" value= <%= tItem.getPw() %>><br>
		    
	
<input type="submit" value="확인">
<button type="button" onclick="history.back();">뒤로가기</button>
</form>
</body>
</html>