<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<%@ page import = "com.eugene.st_attend.ctrl.StaCtrl" %>
<%@ page import = "com.eugene.st_attend.item.StaItem" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="../include/sessionCheck.inc" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하원</title>
</head>
<body>
<%
String month = request.getParameter("month");
if(month.length() == 1) {
	month = "0" + month;
}
String day = request.getParameter("day");
if(day.length() == 1)   {
	day = "0" + day;
}
String year = request.getParameter("year");
String date = year + "-" + month + "-" + day;


StaItem staItem = new StaItem();
StaCtrl staCtrl = new StaCtrl();

StudentItem stItem = new StudentItem();
StudentCtrl stCtrl = new StudentCtrl();

List<StaItem> staList = new ArrayList<StaItem>();
List<StudentItem> stList = new ArrayList<StudentItem>();

staList = staCtrl.checkAttend(date);




if(staList.size() != 0)   {
	%>
	<center>
	<h1>하원</h1>
	<h3><%=date %></h3>
	   <table border="1" bordercolor="blue" width="400" height="100">
            <tr>
                <th>번호</th> <th>이름</th> <th>학교</th> <th>등원시간</th> <th>하원</th>
            </tr>
            <% 
            for(int i = 0; i < staList.size(); i++) {
            	String a = staList.get(i).getStaIn();
                String b = a.substring(a.indexOf(" ")+1, a.indexOf("."));
            %>
            <tr>
                <td>
                    <center>
                    <%=i+1 %>
                    </center>
                </td>
                <td>
                    <center>
                    <%=stCtrl.selectStudent(staList.get(i).getStaId())%>
                    </center>
                </td>
                <td>
                    <center>
                    <%=stCtrl.selectStudentSchool(staList.get(i).getStaId()) %>
                    </center>
                </td>
                <td>
                    <center>
                    <%=b %>
                    </center>
                </td>
                <td>
                    <center>
                    <input type="button" onClick="location.href='sta_goHomeCheck.jsp?id=<%=staList.get(i).getStaId()%>&date=<%=date %>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId())%>&attendTime=<%=b %>'" value="하원">
                    </center>
                </td>
            </tr>
            <%
            }
            %>
            </table>
            <br>
            <button onclick="window.close()">취소</button>
	</center>
	<%
}
else{
	%>
	<center>
	   <br>
	   <br>
	   <h1>등원한 학생이 없습니다.</h1>
	   
	   <br>
	   <button onclick="window.close()">취소</button>
	</center>
	<%
}
%>



</body>
</html>