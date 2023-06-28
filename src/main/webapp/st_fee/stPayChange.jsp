<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/sessionCheck.inc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강료 납부 편집</title>
</head>
<body>
<%
String name = request.getParameter("name");
String feeId = request.getParameter("feeId");
String fee = request.getParameter("fee");
String feeDate = request.getParameter("feeDate");
String feeMemo = request.getParameter("feeMemo");
if(feeMemo.equals("null"))    {
	feeMemo = "";
}
%>

<center>
<h1>납부편집</h1>
<form action = "stPayChangeCheck.jsp">
<input type="hidden" value="<%=feeId %>" name="feeId"/>
<input type="hidden" value="<%=name %>" name="name"/>
<table border="1" bordercolor="blue" width="300">
    <tr>
        <td>
            <center>결제금액</center>
        </td>
        <td>
            <center><input type="text" name="fee" value=<%=fee %> required>원</center>
        </td>
    </tr>
    <tr>
        <td>
            <center>결제일</center>
        </td>
        <td>
            <center><input type="date" name="feeDate" value='<%=feeDate %>'></center>
        </td>
    </tr>
    <tr>
        <td>
            <center>메모</center>
        </td>
        <td>
            <center><input type="text" value="<%=feeMemo %>" name="feeMemo"/></center>
        </td>
    </tr>
</table>
<br>
<input type="submit" value="저장"/>
<input type="button" value="삭제" onclick="location.href='stPayDelete.jsp?feeId=<%=feeId%>&name=<%=name %>&fee=<%=fee%>&feeDate=<%=feeDate%>'"/>
<input type="button" value="취소" onclick="window.close();"/>
</center>
</form>
</body>
</html>