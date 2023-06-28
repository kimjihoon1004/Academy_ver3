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
<title>teacher check</title>
</head>
<body>


    <header>
    <center>
    <h1> 교직원 조회 </h1>
      <form action = "teacherCheck.jsp" method="POST">
      <tr><td><input type="button" value="뒤로" onclick="history.back();"/></td></tr> 
        <td>조회
          <input type = "text" name = "tc_name" value = ""> 
        </td>
      </tr>
      <tr><td><button type="submit" >검색</button></td></tr> 
      <tr><td><button type="button" onclick="location.href='teacherSign.jsp'">승인</button></td></tr>
      </form>
<%
String name = (String)request.getParameter("tc_name"); //tc_name 값을 가져와서 name에 저장

TeacherItem tItem = new TeacherItem(); // item 가져오기
List<TeacherItem> items = new ArrayList<TeacherItem>();  // 변수 선언 연결

tItem.setName(name);

TeacherCheckControl control = new TeacherCheckControl(); // 쿼리문 연결
items = control.searchName(tItem); // 쿼리문 연결


if (null != name)
{
	
	if(items.size() == 0)
	{
		%>
		<script>
        alert("일치하는 정보가 존재하지 않습니다.");
        location.href='teacherCheck.jsp';
        </script>
        <%
		tItem.getName();
		tItem.getId();
		tItem.getPhone();
			
	}
	
}// tcname값 가져오기
else if(null == name || name == ""){ // 빈칸에 아무것도 입력을 안했을 경우 모든 리스트의 값을 가져오기

	    tItem.getName();
		tItem.getId();
		tItem.getPhone();
		
}
//tItem.setName(name); // tcname값 가져오기



%>
 		<center>
        <table border="1" cellspacing="0">
			<tr>
					<th>이름</th>
					<th>메일</th>
					<th>번호</th>
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
 			    <td><a href="teacherInformation.jsp?id=<%=items.get(i).getId() %>"><%=a %></a></td>
 			    <td><%=b %></td>
 			    <td><%=c %></td>
 			</tr>
<%
}
%>

 </center>

</body>
     
</html>