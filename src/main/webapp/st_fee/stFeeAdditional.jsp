<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="../include/sessionCheck.inc" %>
<%@ page import = "com.eugene.st_fee.ctrl.StfCtrl" %>
<%@ page import = "com.eugene.st_fee.item.StfItem" %>
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강료 추가 납부</title>
</head>
<body>
<% 
StudentItem stItem = new StudentItem();
StudentCtrl stCtrl = new StudentCtrl();
List<StudentItem> stList = new ArrayList<StudentItem>();
stList = stCtrl.retrieveStudentList();
%>

<center>
    <h1>추가 납부</h1>
    <table border="1" bordercolor="blue" width="400">
        <tr>
            <th>이름</th> <th>납부일</th> <th>수강료</th> <th>추가납부</th>
        </tr>
	    <%for(int i = 0; i < stList.size(); i++)   {
	       int stId = stList.get(i).getStId();
	       String name = stList.get(i).getStName();
	       String enroll = stList.get(i).getStEnroll();
	       enroll = enroll.substring(enroll.length()-2, enroll.length());
	       if(enroll.charAt(0) == '0')    {
	    	   enroll = enroll.substring(1,2);
	       }
	       int fee = stList.get(i).getStFee();%>
	        <tr>
	            <td>	            
	               <center><%=name %></center>
	            </td>
	            <td>
	               <center><%=enroll %>일</center>
	            </td>
	            <td>
	               <center><%=fee %>원</center>
	            </td>
	            <td>
	               <center><input type="button" value="추가납부" onclick="location.href='stFeeAdditionalPay.jsp?stId=<%=stId%>&name=<%=name%>'"/></center>
	            </td>
	        </tr>
	    <%} %>
    </table>
    <br>
    <input type="button" value="취소" onclick="window.close();"/>
</center>
</body>
</html>