<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.tc_attend.ctrl.TcAttendCtrl" %>
<%@ page import="com.eugene.tc_attend.item.TcAttendItem" %>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ include file="../include/suCheck.inc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String Id = request.getParameter("Id");
    
    int tcAtId = Integer.parseInt(Id);
    
    TcAttendCtrl tcAtCtrl = new TcAttendCtrl();
    
    tcAtCtrl.AttendDelete(tcAtId);
    
    response.sendRedirect("tcAttendRetrieve.jsp");
%>
</body>
</html>