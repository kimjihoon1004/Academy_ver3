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
    String In = request.getParameter("in");
    String Out = request.getParameter("out");
    String Off = request.getParameter("off");
    String Id = request.getParameter("id");
    
    TcAttendCtrl tcAtCtrl = new TcAttendCtrl();
    TcAttendItem tcAtItem = new TcAttendItem();
    
    int atId = Integer.parseInt(Id);
    
    tcAtItem.setAttendIn(In);
    tcAtItem.setAttendOut(Out);
    tcAtItem.setAttendOff(Off);
    tcAtItem.setAttendId(atId);
    
    System.out.println("in: " + tcAtItem.getAttendIn());
    System.out.println("out: " + tcAtItem.getAttendOut());
    System.out.println("off: " + tcAtItem.getAttendOff());
    System.out.println("id: " + tcAtItem.getAttendId());
    
    tcAtCtrl.AttendUpdate(tcAtItem);
    response.sendRedirect("tcAttendRetrieve.jsp");
    %>
</body>
</html>