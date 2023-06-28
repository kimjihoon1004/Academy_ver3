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
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String staAttendId = request.getParameter("staAttendId");
String name = request.getParameter("name");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String time = request.getParameter("time");


String date = year + "-" + month + "-" + day + " " + time;

StaItem staItem = new StaItem();
StaCtrl staCtrl = new StaCtrl();

staItem.setStaId(id);
staItem.setStaAttendId(staAttendId);
staItem.setStaIn(date);

int temp = staCtrl.updateIn(staItem);

if(temp > 0)    {
	%>
	<script>
	   alert("<%=name%>의 등원 시간이 수정되었습니다.");
	   window.close();
	</script>
	<%
} else  {
	%>
	<script>
	alert("<%=name%>의 등원 시간 수정 실패하였습니다.");
	window.close();
	</script>
	<%
	
}

%>





</body>
</html>