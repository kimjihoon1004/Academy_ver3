<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<%@ page import = "com.eugene.st_attend.ctrl.StaCtrl" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="../include/sessionCheck.inc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등원</title>
</head>
<body>
<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String date = year + "-" + month + "-" + day;

StaCtrl staCtrl = new StaCtrl();
%>

<%
    StudentCtrl stCtrl = new StudentCtrl();
        List<StudentItem> stBean = new ArrayList<StudentItem>();
        
        
        
        
        request.setCharacterEncoding("utf-8");
        String textSerch = request.getParameter("textSerch");
        
        if(textSerch == null || textSerch == ""){
            stBean = stCtrl.retrieveStudentList();
        }
        else{
            System.out.println("partial serch");
            stBean = stCtrl.PartialRetrieveStudentList(textSerch);
            
            if(stBean.size() == 0){
    %>
                    <script>
                        alert('일치하는 데이터가 없습니다.')
                        location.href='sta_attend.jsp'
                    </script>
                <% 
                
            }
        }
    %>
    
    <center>
    <h1>등원</h1>
	<h3><%=date %></h3>
    <form action="sta_attend.jsp">
     <input type="text" name="textSerch" placeholder="이름을 입력하세요"/>
     <input type="hidden" name = "year" value=<%=year %>>
     <input type="hidden" name = "month" value=<%=month %>>
     <input type="hidden" name = "day" value=<%=day %>>
     
     <input type="submit" value="serch" align="center"/>
    </form>
    <br>
    <table border="1" bordercolor="blue" width="530" height="100">
        <tr>
            <th>번호</th> <th>이름</th> <th>학교</th> <th>전화번호</th> <th>등원</th> <th>보충횟수</th> <th>보충</th>
        </tr>
    <%
        for(int i = 0; i < stBean.size(); i++){
            %>
                <tr>
                    <td>
                    <center>
                        <%=i+1 %>
                        </center>
                    </td>
                    <td>
                    <center>
                     <%=stBean.get(i).getStName()%>
                     </center> 
                    </td>
                    <td >
                        <center>
                        <%=stBean.get(i).getStSchool()%>
                        </center>
                    </td>
                    <td>
                        <center>
                        <%=stBean.get(i).getStPhone() %>
                        </center>
                    </td>
                    <td>
                    <center>
                        <input type="button" value="등원" onclick="location.href='sta_attendCheck.jsp?id=<%=stBean.get(i).getStId()%>&year=<%=year %>&month=<%=month %>&day=<%=day %>&name=<%=stBean.get(i).getStName()%>'">
                        </center>
                    </td>
                    
                    <td>
                        <center>
                            <%=staCtrl.countAbsent(stBean.get(i).getStId()) %>
                        </center>
                    </td>
                    
                    <td>
                            <%
                            if(staCtrl.countAbsent(stBean.get(i).getStId()) > 0)    {
                            %>
                            <center>
                            <button onclick="location.href='sta_supplement.jsp?id=<%=stBean.get(i).getStId()%>&year=<%=year %>&month=<%=month %>&day=<%=day %>&name=<%=stBean.get(i).getStName()%>'">보충</button>                            
                            </center>
                            <%}
                           %>
                    </td>
                </tr>
            <% 
        }
    %>
    </table>  
    <button onclick="window.close();">취소</button>
    </center>    
</body>
</html>