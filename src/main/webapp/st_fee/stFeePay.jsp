<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Calendar" %>
<%@ page import= "java.time.LocalDate" %>
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<%@ page import = "com.eugene.st_fee.ctrl.StfCtrl" %>
<%@ page import = "com.eugene.st_fee.item.StfItem" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String fee = request.getParameter("fee");
fee = fee.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
String name = request.getParameter("name");
String id = request.getParameter("id");
String date = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
String mmonth = request.getParameter("mmonth");
String yyear = request.getParameter("yyear");
String payDay = request.getParameter("day");

%>

<script>
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
</script>

<center>
<h1><%=yyear%>년 <%=mmonth %>월</h1>
<table border="1" bordercolor="blue" width="500" height="150">
<tr>
    
	<td width="200">
    	<center>이름</center>
	</td>
	
    <td width="300">
	   <center><%=name %></center>
    </td>
</tr>
<tr>
    
    <td width="200">
        <center>납부일(매달)</center>
    </td>
    
    <td width="300">
       <center><%=payDay %>일</center>
    </td>
    
</tr>
<tr>
    
    <td width="200">
        <center>수강료</center>
    </td>
    <td width="300">
       <center><%=fee %>원</center>
    </td>
</tr>

</table>
<br><br>
<h1>수강료 납부</h1>
<form action = "stPay.jsp">
<input type="hidden" value="<%=id %>" name="id"/>
<input type="hidden" value="<%=name %>" name="name"/>
<table border="1" bordercolor="blue" width="500" height="150">
    <tr>
        <td width="200">
        <center>금액</center>
        </td>
        <td width="300">
        <center><input type="text" name="payMoney" onkeyup="inputNumberFormat(this)"/></center>
        </td>
    </tr>
    <tr>
        <td width="200">
            <center>납부날짜</center>
        </td>
        <td width="300">
            <center><input type="date" name="payMoneyDate"/></center>
        </td>
    </tr>
    <tr>
        <td width="200">
            <Center>납부메모</Center>
        </td>
        <td width="300">
            <Center><input type="text" name="payMoneyMemo"/></Center>
        </td>
    </tr>
</table>
<br>
<input type="submit" value="납부"/>
<input type="button" value="취소" onclick="window.close();"/>
</center>
</form>
</body>
</html>