<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import="com.eugene.crs.ctrl.CrsCtrl" %>
<%@ page import="com.eugene.crs.item.CrsItem" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    request.setCharacterEncoding("utf-8");
    String idid = request.getParameter("id");
    
    int Id = Integer.parseInt(idid);
    
    CrsItem crsItem = new CrsItem();
    CrsCtrl crsCtrl = new CrsCtrl();
    
    crsItem = crsCtrl.retrieveCrs(Id);
    %>
    <br><br><br>
    <center>
    <table border="1" bordercolor="blue" width="200" height="100">
	    <tr>
	       <td>
			    이름: <%= crsItem.getCrsName() %> <br>
			    비고: <%= crsItem.getCrsMemo() %> <br>
		    </td>
	    </tr>   
    </table>

    <button onclick="location.href='crsRetrieve.jsp'">뒤로</button>
    <button onclick="location.href='crsAdd.jsp?id=<%= crsItem.getCrsId() %>'">편집</button>
    
    </center>
</body>
</html>