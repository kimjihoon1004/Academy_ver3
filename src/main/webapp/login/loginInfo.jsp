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
String userId = (String) session.getAttribute("iid");
System.out.print("userId : " + userId);
LoginItem item = new LoginItem();
LoginCtrl control = new LoginCtrl();    

item = control.selectTc(userId);
System.out.println(item);

String pwCount = "";
for(int i = 0; i < item.getLoginPw().length(); i++)  {
	String star = "*";
	pwCount += star;
}
%>

<br>
<br>
<br>
<br>
<fieldset>
	<center>
	     <table border="2" width = "800" cellspacing = "0" cellpadding = "2">
	        <tr>
		       <td colspan = "2" bgcolor = "lightgray" height = "30" class = "style1"><h2><center>내 정보</center></h2></td>                   
		    </tr>
		    <tr>
	           <td width = "130" bgcolor = "lightgray" class = "style2"><center>이름</center></td>
	           <td  width = "500">
	               <%=item.getLoginName() %>
	           </td>
	        </tr>
	        <tr>
	           <td width = "130" bgcolor = "lightgray" class = "style2"><center>아이디(메일)</center></td>
	           <td  width = "500">
	               <%=item.getLoginMail() %>
	           </td>
	        </tr>
	        <tr>
	           <td width = "130" bgcolor = "lightgray" class = "style2"><center>비밀번호</center></td>
	           <td  width = "500">
	               <%=pwCount%>
	           </td>
	        </tr>
	        <tr>
	           <td width = "130" bgcolor = "lightgray" class = "style2"><center>생년월일</center></td>
	           <td  width = "500">
	               <%=item.getLoginDate() %>
	           </td>
	        </tr>
	        <tr>
	           <td width = "130" bgcolor = "lightgray" class = "style2"><center>성별</center></td>
	           <td  width = "500">
	               <%=item.getLoginGender() %>    
	           </td>
	        </tr>
	        <tr>
	           <td width = "130" bgcolor = "lightgray" class = "style2"><center>전화번호</center></td>
	           <td  width = "500">
	               <%=item.getLoginPhone() %>
	           </td>
	        </tr>
	        <tr>
	           <td width = "130" bgcolor = "lightgray" class = "style2"><center>메모</center></td>
	           <td  width = "500" height="100">
	               <%=item.getLoginMemo() %>
	           </td>
	        </tr>
	        
		 </table>
		 <br>
        <button onclick="location.href='loginUpdate.jsp?mail=<%=item.getLoginMail()%>'">수정하기</button>
        <button onclick="location.href='signup.jsp'">뒤로가기</button>
	</center>
	
</fieldset>

</body>
</html>