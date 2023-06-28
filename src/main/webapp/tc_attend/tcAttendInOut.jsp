<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.tc.ctrl.TeacherCheckControl" %>
<%@ page import="com.eugene.tc.item.TeacherItem" %>
<%@ page import="com.eugene.tc_attend.ctrl.TcAttendCtrl" %>
<%@ page import="com.eugene.tc_attend.item.TcAttendItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Theacher Attend</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        String flag = request.getParameter("flag");
        String id = (String) session.getAttribute("id");
        
        TcAttendCtrl tcAtCtrl = new TcAttendCtrl();
        TcAttendItem tcAtItem = new TcAttendItem();
        
        System.out.println("id is " + id + " flag is " + flag);
        
        if(id == null){
            id = "2";
        }
        
        int i = Integer.parseInt(id);
        
        tcAtItem.setAttendTcId(i);
        if(flag.equals("1")){
            tcAtCtrl.AttendIn(tcAtItem);
        }else if(flag.equals("2")){
            tcAtCtrl.AttendOut(tcAtItem);
        }else if(flag.equals("3")){
            tcAtCtrl.AttendOff(tcAtItem);
        }
        
        response.sendRedirect("tcAttendRetrieve.jsp");
        
    %>
</body>
</html>