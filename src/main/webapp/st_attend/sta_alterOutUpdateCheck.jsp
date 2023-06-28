<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.eugene.st_attend.item.StaItem" %>
<%@ page import = "com.eugene.st_attend.ctrl.StaCtrl" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="../include/sessionCheck.inc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하원 시간 Update</title>
</head>
<body>

<%
StaCtrl staCtrl = new StaCtrl();
StaItem staItem = new StaItem();

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String time = request.getParameter("time");
String inTime = request.getParameter("inTime");
String id = request.getParameter("id");

String name = request.getParameter("name");

String date = year + "-" + month + "-" + day + " " + time;

staItem.setStaIn(inTime);
staItem.setStaId(id);
staItem.setStaOut(date);

int temp = staCtrl.studentGoHome(staItem);

if(temp > 0)    {
%>
    <script>
    alert("<%=name%>의 하원 시간을 수정하였습니다.");
    window.close();
    </script>
<%} else    {%>
    <script>
    alert("하원 수정 실패, <%=staItem.getStaOut()%>");
    alert("하원 : <%=date%>, 등원 : <%=inTime%>, id : <%=id%>");
    alert(<%=temp%>);
    window.close();
    </script>

<%} %>
</body>
</html>