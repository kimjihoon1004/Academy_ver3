<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<%@ page import = "com.eugene.st_attend.item.StaItem" %>
<%@ page import = "com.eugene.st_attend.ctrl.StaCtrl" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="../include/sessionCheck.inc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석부 수정</title>
</head>
<body>
<%
StaItem staItem = new StaItem();
StaCtrl staCtrl = new StaCtrl();
StudentItem stItem = new StudentItem();
StudentCtrl stCtrl = new StudentCtrl();

String day = request.getParameter("day");
if(day.length() < 2)    {
	day = "0" + day;
}
String year = request.getParameter("year");
String month = request.getParameter("month");
if(month.length() < 2)  {
	month = "0" + month;
}
String date = year + "-" + month + "-" + day;

staItem.setStaIn(date);
staItem.setStaAbsent(date);

List<StaItem> staList = new ArrayList<StaItem>();
List<StaItem> staAbsentList = new ArrayList<StaItem>();

staList = staCtrl.retrieveDate(staItem);
staAbsentList = staCtrl.retrieveAbsent(date);
int p = 0;
%>
<center>
<h1>출석부 수정</h1>
<h3><%=date%></h3>
<table border="1" bordercolor="blue" width="700" height="100">
    <tr>
        <th>번호</th> <th>이름</th> <th>학교</th> <th>등원 시간</th> <th>등원 수정</th> <th>하원 시간</th> <th>하원 수정</th> <th>삭제</th>  
    </tr>
    <%
    for(int j = 0; j < staAbsentList.size(); j++)   {
    %>	
        <tr>
            <td>
	            <center>
	                <%=j+1 %>
	            </center>
            </td>
            
            <td>
                <center>
                    <%         
                    String stname = stCtrl.selectStudent(staAbsentList.get(j).getStaId());
                    out.print(stname);
                    %>
                   
                </center>
            </td>
            
            <td>
                <center>
                <%=stCtrl.selectStudentSchool(staAbsentList.get(j).getStaId()) %>
                </center>
            </td>
            
            <td colspan='4'>
            <center>
                <span style="color:red">
                결석
                </span>
            </center>
            </td>
            
            <td>
            <center>
                <button onclick="location.href='sta_alterAbsentDelete.jsp?id=<%=staAbsentList.get(j).getStaId()%>&date=<%=date %>&name=<%=stCtrl.selectStudent(staAbsentList.get(j).getStaId()) %>'">삭제</button>
            </center>
            </td>
        
            
        </tr>
    <%
    p = j+1;
    }
    %>
    
    <%
    for(int i = 0; i < staList.size(); i++) {
    %>
    	<tr>
    	   <td>
    	       <!-- 번호 -->
    	       <center>
    	           <%=p+1+i %>
    	       </center>
    	   </td>
    	   
    	   <td>
    	       <!-- 이름 -->
    	       <center>
    	           <%=stCtrl.selectStudent(staList.get(i).getStaId()) %>
    	       </center>
    	   </td>
    	   
    	   <td>
    	       <!-- 학교 -->
    	       <center>
    	           <%=stCtrl.selectStudentSchool(staList.get(i).getStaId()) %>
    	       </center>
    	   </td>
    	   
    	 
    	   <td>
    	       <!-- 등원시간 -->
    	       <center>
    	       <%
    	       if(staList.get(i).getStaIn() == null)   {
    	    	   out.print("X");
    	       } else  {
    	    	   String temp = staList.get(i).getStaIn();
    	    	   out.print(temp.substring(temp.indexOf(" "), temp.indexOf(".")));
    	       }
    	       %>
    	       </center>
    	   </td>
    	   
    	   <td>
    	       <!-- 등원 수정 -->
    	        <center>
    	       
    	          <button onclick="location.href='sta_alterInUpdate.jsp?name=<%=stCtrl.selectStudentSchool(staList.get(i).getStaId()) %>&id=<%=staList.get(i).getStaId()%>&date=<%=date %>&inTime=<%=staList.get(i).getStaIn()%>'">등원 수정</button>
    	       
    	       </center>
    	   </td>
    	   
    	   
    	   <td>
    	       <!-- 하원시간 -->
    	       <center>
    	       <%
    	       if(staList.get(i).getStaOut() == null)  {
    	    	   out.print("X");
    	       } else  {
    	    	   String temp = staList.get(i).getStaOut(); 
    	    	   out.print(temp.substring(temp.indexOf(" "), temp.indexOf(".")));
    	       }
    	       %>
    	       </center>
    	   </td>
            
            <td>
                <!-- 하원 수정 -->
                <center>
                
                    <button onclick="location.href='sta_alterOutUpdate.jsp?id=<%=staList.get(i).getStaId()%>&inTime=<%=staList.get(i).getStaIn()%>&date=<%=date%>&outTime=<%=staList.get(i).getStaOut() %>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>'">하원 수정</button>
               
                                        
                </center>
            </td>
            
            <td>
                <center>
                    <button onclick="location.href='sta_alterDelete.jsp?id=<%=staList.get(i).getStaId()%>&inTime=<%=staList.get(i).getStaIn()%>&outTime=<%=staList.get(i).getStaOut() %>&date=<%=date%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>'">삭제</button>
                </center>
            </td>
    	       
    	</tr>
    <%
    }
    %>
</table>
<br><br>
<button onclick="window.close();">취소</button>
</center>
</body>
</html>