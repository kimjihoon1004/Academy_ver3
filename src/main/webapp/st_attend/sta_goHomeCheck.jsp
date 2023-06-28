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
<title>하원 시간 입력</title>
</head>
<body>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String date = request.getParameter("date");
String attendTime = request.getParameter("attendTime");

LocalTime now = LocalTime.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
String formatedNow = now.format(formatter);

%>


<center>
    <form action="sta_goHomeConfirm.jsp" method="post">
    <h1>하원 시간 입력</h1><br>
    <input type="time" name="time" size="40">
    <input type="hidden" name="date" value=<%=date%>>
    <input type="hidden" name="id" value=<%=id %>>
    <input type="hidden" name="name" value=<%=name %>>
    <input type="hidden" name="attendTime" value=<%=attendTime %>>
    <input type="submit" vlaue="제출">                
    
    </form>
    <form action="sta_goHomeConfirm.jsp" method="post">      
    <br>
    <h1>OR</h1>
    <br>
    <input type="hidden" name="date" value=<%=date %>>
    <input type="hidden" name="time" value=<%=formatedNow %>>
    <input type="hidden" name="id" value=<%=id %>>
    <input type="hidden" name="name" value=<%=name %>>
    <input type="hidden" name="attendTime" value=<%=attendTime %>>
    <input type="submit" value="현재시간">
    </form>
    <br>
    <br>
    <br>
    <button onclick="window.close();">취소</button>
</center>



</body>
</html>