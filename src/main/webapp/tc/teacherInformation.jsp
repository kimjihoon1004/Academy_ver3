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
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>teacher information</title>
</head>
<body>

	<header>
	
	

<% 
String id = request.getParameter("id");

System.out.print("teacher information : "+ id);
TeacherItem tItem = new TeacherItem();

//List<TeacherItem> items = new ArrayList<TeacherItem>();
TeacherCheckControl control = new TeacherCheckControl();

tItem.setId(id);

tItem = control.teacherInformation(tItem);


%>
<br><br><br>
<center> 
<h1> 교직원 정보 </h1>
<table border="1" width="400" height="200">
    <tr>
        <td>
		     이름 : <%= tItem.getName() %><br>
		     아이디(메일) : <%= tItem.getId() %><br>
		     생년월일 : <%= tItem.getDate() %><br>
		     성별 : <%= tItem.getGender() %><br>
		     휴대폰번호 : <%= tItem.getPhone() %><br>
		     메모사항 : <%= tItem.getMemo() %><br>
		     비밀번호 : <%= tItem.getPw() %><br>
	     </td>
     </tr>
</table>
<br>
<button onclick="location.href='teacherUpdate.jsp?id=<%=tItem.getId() %>'">수정하기</button>
<button onclick="location.href='teacherDelete.jsp?id=<%=tItem.getId() %>'">탈퇴하기</button>
<button type="button" onclick="location.href='teacherCheck.jsp'">뒤로가기</button>
</center>
</body>
</html>