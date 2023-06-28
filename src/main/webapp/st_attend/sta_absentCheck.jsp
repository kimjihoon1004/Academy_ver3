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
<title>결석 진행</title>
</head>
<body>
    <%
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String date = request.getParameter("date");
    
    StaItem staItem = new StaItem();
    StaCtrl staCtrl = new StaCtrl();
    
    if(name != null && id != null && date != null)    {
        staItem.setStaId(id);
        staItem.setStaAbsent(date);
        
        int temp = staCtrl.studentAasent(staItem);
        
        if(temp > 0)    {
        	%>
        	<script>
        	   alert("<%=name%>이/가 결석하였습니다.");
        	   window.close();
        	</script>
        	<%
        }else{
        %>
            <script>
            alert("결석 처리에 실패하였습니다.");
            window.close();
            </script>
        <%
        }
    }else{
    	%>
        <script>
        alert("형식에 맞지 않습니다.");
        window.close();
        </script>
        
    <%
    }
    %>
    
    
    
</body>
</html>