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
String memo = request.getParameter("memoWrite");
String st_id = request.getParameter("st_id");
String sta_id = request.getParameter("sta_id");
String name = request.getParameter("name");
System.out.println(st_id);
System.out.println(sta_id);
System.out.println(memo);
StaItem staItem = new StaItem();
StaCtrl staCtrl = new StaCtrl();

staItem.setStaAttendId(sta_id);
staItem.setStaId(st_id);
staItem.setStaMemo(memo);

int temp = staCtrl.updateMemo(staItem);
System.out.println(temp);
if(temp > 0)    {
	%>
	<script>
	alert("<%=name %>의 메모를 저장하였습니다.");
	window.close();
	</script>
	<%
} else  {
%>
    <script>
    alert("메모 저장 실패");
    window.close();
    </script>
<%} %>
</body>
</html>