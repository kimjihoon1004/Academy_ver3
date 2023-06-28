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
<title>결석삭제</title>
</head>
<body>
<%
String id = request.getParameter("id");
String date = request.getParameter("date");
String name = request.getParameter("name");

StaItem staItem = new StaItem();
StaCtrl staCtrl = new StaCtrl();

staItem.setStaId(id);
staItem.setStaAbsent(date);

int temp = staCtrl.deleteAbsent(staItem);

if(temp > 0)    {
	%>
	<script>
	   alert("<%=name%>의 결석이 삭제되었습니다.");
	   window.close();
	</script>
	<%
} else  {
%>
    <script>
    alert("결석 삭제 실패");
    window.colse();
    </script>
<%} %>
</body>
</html>