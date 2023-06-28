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
<title>Theacher Attend Update</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        String atId = request.getParameter("id");
        
        TcAttendCtrl tcAtCtrl = new TcAttendCtrl();
        TcAttendItem tcAtItem = new TcAttendItem();
        
        int Id = Integer.parseInt(atId);
        
        tcAtItem = tcAtCtrl.attendRetrieve(Id);
        
    %>
    <form action = "attendUpdateCheck.jsp">
        <input type="text" name="in" value="<%=tcAtItem.getAttendIn()%>"/>
        <input type="text" name="out" value="<%=tcAtItem.getAttendOut()%>"/>
        <input type="text" name="off" value="<%=tcAtItem.getAttendOff()%>"/>
        <input type="hidden" name="id" value="<%=Id%>"/>
        <input type="submit" value="저장" />
    </form>
    <button onClick="location.href='tcAttendDelete.jsp?Id=<%=Id %>'">삭제</button>
</body>
</html>