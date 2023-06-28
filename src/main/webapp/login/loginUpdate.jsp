<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import="com.eugene.login.ctrl.LoginCtrl" %>
<%@ page import="com.eugene.login.item.LoginItem" %>
<!DOCTYPE html>
<html>
<head>
<!-- 내 정보 수정하는 jsp -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String userId = request.getParameter("mail");
LoginCtrl ctrl = new LoginCtrl();
LoginItem item = new LoginItem();
item = ctrl.selectTc(userId);
if(item == null)    {
	System.out.println("item is null");
}else{
	System.out.println("item is not null");
}

System.out.println(item.getLoginName());

%>

<br>
<br>
<br>
<br>
<form action="loginUpdateCheck.jsp">
<fieldset>
    <center>
         <table border="2" width = "800" cellspacing = "0" cellpadding = "2">
            <tr>
               <td colspan = "2" bgcolor = "lightgray" height = "30" class = "style1"><h2><center>내 정보</center></h2></td>                   
            </tr>
            <tr>
               <td width = "130" bgcolor = "lightgray" class = "style2"><center>이름</center></td>
               <td  width = "500">
                   <input type="text" name="userName" size = "40" maxlength = "50" value="<%=item.getLoginName() %>" class = "input_style1" />
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
                   <input type="text" name="userPw" size = "40" maxlength = "50" value="<%=item.getLoginPw() %>" class = "input_style1" />
               </td>
            </tr>
            <tr>
               <td width = "130" bgcolor = "lightgray" class = "style2"><center>생년월일</center></td>
               <td  width = "500">
                   <input type="text" name="userDate" size = "40" maxlength = "50" value="<%=item.getLoginDate() %>" class = "input_style1" />
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
                   <input type="text" name="userPhone" size = 40 maxlength = "50" value="<%=item.getLoginPhone() %>" class = "input_style1" />
               </td>
            </tr>
            <tr>
               <td width = "130" bgcolor = "lightgray" class = "style2"><center>메모</center></td>
               <td  width = "500" height="100">
                   <input type="text" name="userMemo" size=40 value="<%=item.getLoginMemo() %>" class = "input_style1" />
               </td>
            </tr>
            
         </table>
         <br>
        <input type="submit" value="수정">
        <button onclick="location.href='loginInfo.jsp'">뒤로가기</button>
        </form>
    </center>
    
</fieldset>
</body>
</html>