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
    System.out.println(idid);
    
    
    
    CrsCtrl crsCtrl = new CrsCtrl();
    CrsItem crsItem = new CrsItem();
    
    if(idid == null || idid.equals("")){
        crsItem.setCrsName("");
        crsItem.setCrsMemo("");
    }else{
        int Id = Integer.parseInt(idid);
        System.out.println("Id is " + Id);
        crsItem = crsCtrl.retrieveCrs(Id);
        
    }
    %>
    <br><br><br>
    <center>
    <table border="1" bordercolor="blue" width="400" height="200">
    <tr>
        <td>    
		    <form action="crsAddCheck.jsp">
		        과목 이름 <input type="text" name="name" value="<%=crsItem.getCrsName()%>"required/><br>
		        비고 <input type="text" name="memo" value="<%=crsItem.getCrsMemo()%>"/><br>
		        <input type="hidden" name="id" value="<%= crsItem.getCrsId() %>"/>
		        <input type="submit" value="저장"/>
		        <input type="button" value="취소" onclick="location.href='crsRetrieve.jsp'"/>
		    </form>
	    </td>
    </tr>
    </table>
    </center>
</body>
</html>