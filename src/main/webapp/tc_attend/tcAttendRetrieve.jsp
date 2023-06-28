<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.tc_attend.ctrl.TcAttendCtrl" %>
<%@ page import="com.eugene.tc_attend.item.TcAttendItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Theacher Attend In Out Off</title>
</head>
<body>
    <%
    request.setCharacterEncoding("utf-8");
    String textSerch = request.getParameter("textSerch");
    
    TcAttendCtrl tcAtCtrl = new TcAttendCtrl();
    List<TcAttendItem> tcAtItems = new ArrayList<TcAttendItem>();
    
    
    if(textSerch == null || textSerch == "\0"){
        textSerch = "";
    }
    tcAtItems = tcAtCtrl.attendRetrieveList(textSerch);
%>
    <script type="text/javascript">
        function new_window(flag){
            if(flag == 1){
                location.href="tcAttendInOut.jsp?flag=1","attend", "width=300, height=400";
            }else if(flag == 2){
                location.href="tcAttendInOut.jsp?flag=2","attend", "width=300, height=400";
            }else if(flag == 3){
                location.href="tcAttendInOut.jsp?flag=3","attend", "width=300, height=400";
            }
            
            
        }
    </script>
 
    <center>
    <h1>교직원 출결 조회 </h1>
    
      <form action = "tcAttendRetrieve.jsp" method="POST">
     
            <input type="button" value="뒤로" onclick="history.back();"/>
       
        출결 조회
          <input type = "text" name = "textSerch" value = ""> 
        
     
            <button type="submit" >검색</button>
       
            <button type="button" onclick="new_window(1)">
                등원
            </button>
            <button type="button" onclick="new_window(2)">
                하원
            </button>
            <button type="button" onclick="new_window(3)">
                결근
            </button>
      
      </form>
      

 <table border="1" bordercolor="blue" width="600" height="100">
  <tr>
   <th>번호</th> <th>이름</th> <th>등원</th> <th>하원</th> <th>결근</th>
  </tr>
 <%
  for(int i = 0; i < tcAtItems.size(); i++){
     if(tcAtItems.get(i).getAttendOff() != null){
         tcAtItems.get(i).setAttendIn("미등원");
         tcAtItems.get(i).setAttendOut("미하원");
     }else if(tcAtItems.get(i).getAttendIn() != null){
         tcAtItems.get(i).setAttendOff("");
     }
     
     if(tcAtItems.get(i).getAttendIn() != null && tcAtItems.get(i).getAttendOut() == null){
         tcAtItems.get(i).setAttendOut("미하원");
     }
   %>
    <tr>
         <td>
            <%= i + 1 %>
         </td>
         <td>
            <a href="attendUpdate.jsp?id=<%=tcAtItems.get(i).getAttendId()%>"><%=tcAtItems.get(i).getTcName()%></a>
         </td>
         <td>
            <%= tcAtItems.get(i).getAttendIn() %>
         </td>
         <td>
            <%= tcAtItems.get(i).getAttendOut() %>
         </td>
         <td>
            <%= tcAtItems.get(i).getAttendOff() %>
         </td>
   <% 
  }
 %>
 </table>
</center>
</body>
</html>