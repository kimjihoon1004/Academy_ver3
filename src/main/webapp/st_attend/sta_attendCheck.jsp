<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<%@ page import = "com.eugene.st_attend.item.StaItem" %>
<%@ page import = "com.eugene.st_attend.ctrl.StaCtrl" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="../include/sessionCheck.inc" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등원 시간 입력</title>
</head>
<body>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String year = request.getParameter("year");
String month = request.getParameter("month");
if(month.length() < 2)  {
	month = "0" + month;
}
String day = request.getParameter("day");
if(day.length() < 2)    {
	day = "0" + day;
}
String date = year + "-" + month + "-" + day;

LocalTime now = LocalTime.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
String formatedNow = now.format(formatter);

String time = date + " " + formatedNow;
%>

<center>
    <form action="sta_attendConfirm.jsp" method="post">
    <h1>등원 시간 입력</h1><br>
    <input type="time" name="time" size="40">
    <input type="hidden" name="date" value=<%=date%>>
    <input type="hidden" name="id" value=<%=id %>>
    <input type="hidden" name="name" value=<%=name %>>
    <input type="submit" vlaue="제출">                
    </form>
    <form action="sta_attendConfirm.jsp" method="post">      
    <br>
    <h1>OR</h1>
    <br>
    <input type="hidden" name="date" value=<%=date %>>
    <input type="hidden" name="time" value=<%=formatedNow %>>
    <input type="hidden" name="id" value=<%=id %>>
    <input type="hidden" name="name" value=<%=name %>>
    
    <input type="submit" value="현재시간">
    </form>
    <br>
    <br>
    <br>
    <button onclick="window.close();">취소</button>
</center>



</body>
</html>