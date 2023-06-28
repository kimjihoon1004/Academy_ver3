<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/sessionCheck.inc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
String stId = request.getParameter("stId");
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
    <form action="stFeeAdditionalPayCheck.jsp">
    <input type="hidden" name="stId" value="<%=stId %>"/>
    <input type="hidden" name="name" value="<%=name %>"/>
    <h1>추가 납부</h1>
    <table border="1" bordercolor="blue" width="400">
        <tr>
            <td width="100">
                <center>이름</center>
            </td>
            <td width="300">
                <center><%=name %></center>                
            </td>
        </tr>
        <tr>
            <td width="100">
                <center>금액</center>
            </td>
            <td width="300">
                <center><input type="text" id="price" name="fee" onkeyup="inputNumberFormat(this)"/>원</center>                
            </td>
        </tr>
        <tr>
            <td width="100">
                <center>결제일</center>
            </td>
            <td width="300">
                <center><input type="date" name="feeDate"/></center>
            </td>
        </tr>
        <tr>
            <td width="100">
                <center>대납일자</center>
            </td>        
            <td width="300">
                <center><input type="month" name="feeMonth1"/> ~ <input type="month" name="feeMonth2"/></center> 
            </td>
        </tr>
        <tr>
            <td width="100">
                <center>메모</center>
            </td>
            <td width="300">
                <center><input type="text" size="35" name="feeMemo"/></center>
            </td>
        </tr>
    </table>
    <br>
    <input type="submit" value="납부">
    <input type="button" value="뒤로" onclick="history.back()"/>
    </form>
</center>
</body>
</html>