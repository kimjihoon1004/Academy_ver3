<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.eugene.st_attend.item.StaItem" %>
<%@ page import = "com.eugene.st_attend.ctrl.StaCtrl" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="../include/sessionCheck.inc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등원 시간 수정</title>
</head>
<body>
<script>
function checkTime()    {
    if(input.time.value == "") {
        input.time.focus();
        alert("시간을 입력하세요");
        return false;
    }else  {
        return true;
    }
}
</script>
    <%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String inTime = request.getParameter("inTime");
    inTime = inTime.substring(0, inTime.indexOf("."));
    String date = request.getParameter("date");
    
    StaItem staItem = new StaItem();
    StaCtrl staCtrl = new StaCtrl();
    
    staItem.setStaIn(inTime);
    staItem.setStaId(id);
    
    String staAttendId = staCtrl.selectAttendId(staItem);
    staItem.setStaAttendId(staAttendId);
    
    %>
    <form name="input" onSubmit="return checkTime();" action="sta_alterInUpdateCheck.jsp" method="post">
<center>
    <h1>등원 시간 수정</h1>
    <h3>등원시간 : <%=inTime %></h3>
    <table border="1" bordercolor="blue" width="700" height="100">
        <tr>
            <td colspan='6'>
                <center>            
                    <h3>날짜, 시간 수정</h3>
                                       
                </center>
            </td>
        </tr>
        <input type="hidden" name="id" value="<%=id %>">
        <input type="hidden" name="name" value="<%=name%>">
        <input type="hidden" name="staAttendId" value="<%=staAttendId %>">
        <tr>
            <th width="100">
                이름
            </th>
            
            <th width="100">
                년도
            </th>
            <th width="100">
                월
            </th>
            <th width="100">
                일
            </th>
            <th width="100">
                시간
            </th>
            <th width="100">
                수정
            </th>
        </tr>
     <tr>
        <td>
            <center>
                <%=name %>
            </center>
        </td>
     
        <td>
        <center>
             <select id="year" name="year" value="년도" style="width:100px;">
                    <%
                    for (int i = 2023; i >= 1950; i--)
                    {
                    %>
                       <option value="<%=i%>"><%=i%></option>
                    <%
                    } 
                    %>
                </select>
           </center>
        </td>
        
        <td>
        <center>
            <select id="month" name="month" value="월" style="width:100px;">
                    <option value="01">1</option>
                    <option value="02">2</option>
                    <option value="03">3</option>
                    <option value="04">4</option>
                    <option value="05">5</option>
                    <option value="06">6</option>
                    <option value="07">7</option>
                    <option value="08">8</option>
                    <option value="09">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
               </select>
           </center>
        </td>
        
        <td>
            <center>
                <select id="day" name="day" value="일" style="width:100px;">
                         <option value="01">1</option>
                         <option value="02">2</option>
                         <option value="03">3</option>
                         <option value="04">4</option>
                         <option value="05">5</option>
                         <option value="06">6</option>
                         <option value="07">7</option>
                         <option value="08">8</option>
                         <option value="09">9</option>
                         <option value="10">10</option>
                         <option value="11">11</option>
                         <option value="12">12</option>
                         <option value="13">13</option>
                         <option value="14">14</option>
                         <option value="15">15</option>
                         <option value="16">16</option>
                         <option value="17">17</option>
                         <option value="18">18</option>
                         <option value="19">19</option>
                         <option value="20">20</option>
                         <option value="21">21</option>
                         <option value="22">22</option>
                         <option value="23">23</option>
                         <option value="24">24</option>
                         <option value="25">25</option>
                         <option value="26">26</option>
                         <option value="27">27</option>
                         <option value="28">28</option>
                         <option value="29">29</option>
                         <option value="30">30</option>
                         <option value="31">31</option>
                   </select>
            </center>
        </td>
        
        <td>
            <input name="time" type="time">
        </td>
        
        <td>
            <center>           
                <input type="submit" value="등원 시간 수정">           
            </center>
        </td>
     </tr>
</center>
</table>    

</form>
<br>
<button onclick="window.close();">취소</button>

</body>
</html>