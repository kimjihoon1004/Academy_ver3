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
<title>Insert title here</title>
</head>
<body>
<%

String time = request.getParameter("time");
String date = request.getParameter("date");
String id = request.getParameter("id");
String name = request.getParameter("name");

StaItem staItem = new StaItem();
StaCtrl staCtrl = new StaCtrl();

List<StaItem> staList = new ArrayList<StaItem>();

staList = staCtrl.retrieveAbsent(date);
// 결석하였는데 등원하면 결석을 삭제하는 코드
for(int i = 0; i < staList.size(); i++) {
	String absentId = staList.get(i).getStaId();
	if(absentId.equals(id)){
		staItem.setStaId(id);
		staItem.setStaAbsent(date);
		
		staCtrl.deleteAbsent(staItem);
	}
}

//출석 했으므로 st_attend에 값 저장
if(name==null || date==null || id == null || time == null)  {
	%>
	<script>
	alert("등원 형식이 올바르지 않습니다.");
	window.close();
	</script>
	<%
}else{
    
	String now = date + " " + time;
	
	staItem.setStaId(id);
	staItem.setStaIn(now);
	
	int temp = staCtrl.studentAttend(staItem);
	
	if(temp > 0)    {
		%>
		<script>
		   alert("<%=name%>이/가 등원하였습니다.");
		   window.close();
		</script>
		<%
	}
	else{
		%>
		<script>
		   alert("등원 실패");
		   window.close();
		</script>
		<%
	}
}
	%>

</body>
</html>