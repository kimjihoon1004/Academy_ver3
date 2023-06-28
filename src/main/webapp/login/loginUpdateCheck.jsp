<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import="com.eugene.login.ctrl.LoginCtrl" %>
<%@ page import="com.eugene.login.item.LoginItem" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String userName = request.getParameter("userName");
String userMail = (String) session.getAttribute("iid");
String userPw = request.getParameter("userPw");
String userDate = request.getParameter("userDate");
String userPhone = request.getParameter("userPhone");
String userMemo = request.getParameter("userMemo");


LoginCtrl ctrl = new LoginCtrl();
LoginItem item = new LoginItem();
item.setLoginName(userName);
item.setLoginMail(userMail);
item.setLoginPw(userPw);
item.setLoginDate(userDate);
item.setLoginPhone(userPhone);
item.setLoginMemo(userMemo);



ctrl.updateLogin(item);

%>
<script>
location.href="loginInfo.jsp";
</script>

</body>
</html>