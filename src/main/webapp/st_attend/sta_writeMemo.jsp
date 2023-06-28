<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<%@ page import = "com.eugene.st_attend.item.StaItem" %>
<%@ page import = "com.eugene.st_attend.ctrl.StaCtrl" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="../include/sessionCheck.inc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write memo</title>
<%
String sta_id = request.getParameter("sta_id");
String st_id = request.getParameter("st_id");
String name = request.getParameter("name");
String date = request.getParameter("date");
String memo = request.getParameter("sta_memo");
if(memo == "" || memo == null || memo.equals("null"))  {
	memo = "";
}

System.out.println("메모 : " + memo);
%>
</head>
<body>
	<center>
	<form action="sta_writeMemoCheck.jsp">
        <h1><%=name %> 메모</h1>	
        <h3><%=date %></h3>
        <textarea rows="10" cols="30" style="resize:none;font-size:30px;" name="memoWrite" placeholder="메모가 없습니다."><%=memo %></textarea>
        <input type="hidden" name="sta_id" value="<%=sta_id %>">
        <input type="hidden" name="st_id" value="<%=st_id %>">
        <input type="hidden" name="name" value="<%=name %>">
        <input type="hidden" name="date" value="<%=date %>">
        <br>
        <input type="submit" value="저장">
        <input type="button" value="취소" onclick="window.close();">
    </form>
	</center>
    
</body>
</html>