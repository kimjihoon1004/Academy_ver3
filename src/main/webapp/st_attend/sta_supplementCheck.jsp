<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.eugene.st_attend.ctrl.StaCtrl" %>
<%@ page import = "com.eugene.st_attend.item.StaItem" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="../include/sessionCheck.inc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 보충</title>
</head>
<body>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String date = request.getParameter("date");
String time = request.getParameter("time");

String inTime = date + " " + time;

System.out.print(id + "<br>" + name + "<br>" + inTime + "<br>");

StaCtrl staCtrl = new StaCtrl();
StaItem staItem = new StaItem();

List<String> temp = new ArrayList<String>();
temp = staCtrl.findAbsent(id);

staItem.setStaIn(inTime);
staItem.setStaId(id);
staItem.setStaAbsent(temp.get(0));


if(id != null & name != null && inTime != null) {
	staCtrl.supplement(staItem);
	%>
	<script>
	   alert("<%=name%>의 보충을 추가하였습니다.");
	   window.close();
	</script>
	<%
} else {
	%>
	<script>
	   alert("<%=name%>보충 추가에 실패하였습니다.");
	   window.close();
	</script>
	<%
}

%>
</body>
</html>