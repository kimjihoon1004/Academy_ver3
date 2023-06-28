<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.eugene.st_fee.ctrl.StfCtrl" %>
<%@ page import = "com.eugene.st_fee.item.StfItem" %>
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
	String feeId = request.getParameter("feeId");
	String fee = request.getParameter("fee");
	String feeMemo = request.getParameter("feeMemo");
	if(feeMemo == null) {
		feeMemo = "";
	}
	String feeDate = request.getParameter("feeDate");
	StfItem stfItem = new StfItem();
	StfCtrl stfCtrl = new StfCtrl();
	
	stfItem.setFee(Integer.valueOf(fee));
	stfItem.setFeeMemo(feeMemo);
	stfItem.setFeeCheck(feeDate);
	stfItem.setFeeId(Integer.valueOf(feeId));
	
	int temp = stfCtrl.StFeeUpdate(stfItem);
	
	if(temp > 0)   {
		%>
		<script>
		  alert("<%=name%>의 결제 정보가 수정되었습니다.");
		  window.close();
		</script>
		<%
	} else {
	%>
	   <script>
	    alert("<%=name%>의 결제 정보 수정 실패하였습니다.");
	    window.close();
	   </script>
	<%} %>
</body>
</html>