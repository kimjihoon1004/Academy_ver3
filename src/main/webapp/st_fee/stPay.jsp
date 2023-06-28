<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import="java.util.*" %>
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
String st_id = request.getParameter("id");
String name = request.getParameter("name");
String payMoney = request.getParameter("payMoney");
payMoney = payMoney.replaceAll(",","");
String payMoneyDate = request.getParameter("payMoneyDate");
String payMoneyMemo = request.getParameter("payMoneyMemo");

StfCtrl stfCtrl = new StfCtrl();
StfItem stfItem = new StfItem();

stfItem.setStId(Integer.valueOf(st_id));
stfItem.setFee(Integer.valueOf(payMoney));
stfItem.setFeeCheck(payMoneyDate);
stfItem.setFeeMemo(payMoneyMemo);

int temp = stfCtrl.StFeeInsert(stfItem);

if(temp > 0)    {
	%>
	<script>
	alert("<%=name%>의 결제가 완료되었습니다.");
    window.close();
    </script>
	<%
} else {
	%>
	<script>
	   alert("<%=name%>의 결제가 실패되었습니다.");
	   window.close();
	</script>
	<%
}
%>



</body>
</html>