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
<title>출석부 학생 삭제</title>
</head>
<body>
<%
String name = request.getParameter("name");
String inTime = request.getParameter("inTime");
String id = request.getParameter("id");


StaItem staItem = new StaItem();
StaCtrl staCtrl = new StaCtrl();

staItem.setStaIn(inTime);
staItem.setStaId(id);
List<StaItem> tempList = new ArrayList<StaItem>();

tempList = staCtrl.retrieve(staItem);
int temp = -1;
//특정 학생의 출석부가 결석이 공백이면 보충이 아닌 삭제이기 때문에 그냥 삭제
if(tempList.get(0).getStaAbsent() == null)   {
	System.out.println("!!!");
	System.out.println(tempList.get(0).getStaAbsent());
    temp = staCtrl.deleteAttend(staItem);
    
} 
//특정 학생의 출석부가 결석에 값이 있다면 보충이므로 해당 값을 삭제가 아닌 등원값만 삭제한다
else  {
	System.out.println("@@@");
	System.out.println(tempList.get(0).getStaAbsent());
	temp = staCtrl.updateAttend(staItem);
}

if(name != null && id != null && inTime != null && temp > 0)    {
		
		%>
		<script>
 		   alert("<%=name %>이/가 출석부에서 삭제되었습니다.");   
		   window.close();
		</script>
		<%
} else  {
    %>
    <script>
    alert("출석부에서 <%=name %> 삭제 실패");
    window.close();
    </script>
<%}%>

</body>
</html>