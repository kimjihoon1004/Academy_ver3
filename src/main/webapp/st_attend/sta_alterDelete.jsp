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
<title>출석부 정보 삭제</title>
</head>
<body>
<%
String date = request.getParameter("date");
String name = request.getParameter("name");
String inTime = request.getParameter("inTime");
String outTime = request.getParameter("outTime");
System.out.println(outTime.length());
if(!outTime.equals("null")) {
	outTime = outTime.substring(0, outTime.indexOf("."));
}
inTime = inTime.substring(0, inTime.indexOf("."));
String id = request.getParameter("id");


%>
<br><br><br><br><br><br>
<center>
<table border="1" bordercolor="blue" width="400" height="100">
    <tr>
        <td colspan = '4'>
            <center>
                <h3>삭제 확인 절차</h3>
            </center>
        </td>
    </tr>
    
    <tr>
        <th width="100">
            이름
        </th>
        
        <th width="100">
            날짜
        </th>
            
        <th width="100">
            등원 시간
        </th>
        
        <th width="100">
            하원 시간
        </th>
        
    </tr>
    <tr>
       <td>
           <center>
               <%=name %>
           </center>
       </td>
   
   
   
       <td>
           <center>
               <%=date %>
           </center>
       </td>
  
   
    
       <td>
           <center>
               <%if(inTime != null) {%>
                   <%=inTime.substring(inTime.indexOf(" "), inTime.length()) %>
               <%} else    {%>
                   X
               <%} %>
           </center>
       </td>
   
   
    
       <td>
           <center>
               <%if(!outTime.equals("null"))   {%>
                   <%=outTime.substring(outTime.indexOf(" "), outTime.length()) %>
               <%} else    { %>
                   X
               <%} %>
           </center>
       </td>
    </tr>
</table>
<br>
<button onclick="location.href='sta_alterDeleteCheck.jsp?id=<%=id%>&name=<%=name %>&inTime=<%=inTime%>&date=<%=date%>'">삭제</button>
<button onclick="window.close();">취소</button>
</center>
</body>
</html>