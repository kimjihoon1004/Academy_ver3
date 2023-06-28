<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import="com.eugene.st.item.StudentItem" %>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
 <%@ page import="java.util.Calendar" %>
<%@ page import= "java.time.LocalDate" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student delete page</title>
    </head>
    <body>
        <%
        Calendar cal = Calendar.getInstance();
        LocalDate today = LocalDate.now();
        int todayYear = today.getYear();
        int todayMonth = today.getMonthValue();
        int todayDay = today.getDayOfMonth();
        String now = String.valueOf(todayYear) + "-" + String.valueOf(todayMonth) + "-" + String.valueOf(todayDay);
        
        String Id = request.getParameter("id");
        
        int id = Integer.parseInt(Id);
        
                
            StudentCtrl stCtrl = new StudentCtrl();
            StudentItem stBean = new StudentItem();
            System.out.println(id);
            stBean.setStId(id);
            stBean.setStOut(now);
            
            stCtrl.deleteStudent(stBean);
            
            response.sendRedirect("stRetrieve.jsp");
        %>
        
    </body>
</html>