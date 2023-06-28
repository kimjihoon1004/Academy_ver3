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
<title>하원 실행</title>
</head>
<body>
<% 
String time = request.getParameter("time");
String date = request.getParameter("date");
String id = request.getParameter("id");
String name = request.getParameter("name");
String attendTime = request.getParameter("attendTime");
String checkInTime = date + " " + attendTime;
String checkOutTime = date + " " + time;

System.out.println("id : " + id);
System.out.println("time : " + time);
System.out.println("date : " + date);
System.out.println("name : " + name);
System.out.println("attendTime : " + attendTime);
System.out.println("checkInTime : " + checkInTime);
System.out.println("checkOutTime : " + checkOutTime);

%>


<%
if(name==null || name=="" || name=="null")  {
    %>
    <script>
    alert("하원 형식이 올바르지 않습니다.");
    window.close();
    </script>
    <%
}else{

	StaItem staItem = new StaItem();
	StaCtrl staCtrl = new StaCtrl();
	
	staItem.setStaId(id);
	staItem.setStaIn(checkInTime);
	staItem.setStaOut(checkOutTime);
	
	System.out.println(staItem.getStaId());
	System.out.println(staItem.getStaIn());
	System.out.println(staItem.getStaOut());
	
	int temp = staCtrl.studentGoHome(staItem);
	
	if(temp > 0)    {
		%>
		<script>
		   alert("<%=name%>이/가 하원하였습니다.");
		   window.close();
		</script>
		<%
	}else{
	    %>
	    <script>
	       alert("하원 실패");
	       window.close();
	    </script>
	    <%
	}
}
%>
</body>
</html>