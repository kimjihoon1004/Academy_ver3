<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import = "com.eugene.login.ctrl.LoginCtrl" %>
<%@ page import = "com.eugene.login.item.LoginItem" %>
<%@ page import = "com.eugene.st_attend.item.StaItem" %>
<%@ page import = "com.eugene.st_attend.ctrl.StaCtrl" %>
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Calendar" %>
<%@ page import= "java.time.LocalDate" %>


<%
// 오늘 날짜 구하는 코드
Calendar cal = Calendar.getInstance();
LocalDate today = LocalDate.now();
int todayYear = today.getYear();
int todayMonth = today.getMonthValue();
int todayDay = today.getDayOfMonth();


// 달력의 년, 월, 일을 구하는 코드
int nowYear = cal.get(Calendar.YEAR);
int nowMonth = cal.get(Calendar.MONTH) + 1;
int nowDay = cal.get(Calendar.DATE);

String fyear = request.getParameter("year");
String fmonth = request.getParameter("month");

int year = nowYear;
int month = nowMonth;
int day = nowDay;
if(fyear != null)   {
    year = Integer.parseInt(fyear);
}
if(fmonth != null)  {
    month = Integer.parseInt(fmonth);
}

cal.set(year, month-1, 1);

year = cal.get(Calendar.YEAR);
month = cal.get(Calendar.MONTH) + 1;


int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
int week = cal.get(Calendar.DAY_OF_WEEK);
request.setCharacterEncoding("UTF-8");
LoginCtrl ctrl = new LoginCtrl();
String ttemp = (String) session.getAttribute("iid");
String name = ctrl.findName(ttemp);

StaCtrl staCtrl = new StaCtrl();
StaItem staItem = new StaItem();
StudentItem stItem = new StudentItem();
StudentCtrl stCtrl = new StudentCtrl();

%>


<!DOCTYPE html>
<html>
    <head>
    
        <meta charset="UTF-8">
        <title>Sign Up</title>
        <header>
          <center>
              <h1><%=name%> 강사 로그인 페이지</h1>
          </center>
        </header>
    </head>
    <body>
        <script>
        function attendWindow(a, b, c) {
        	window.open("../st_attend/sta_attend.jsp?day=" + a + "&month=" + b + "&year=" + c + "", "attendWindow1", "width=800, height=700, top=50, left=50");
        }
        
        function goHomeWindow(a, b, c) {
        	window.open("../st_attend/sta_goHome.jsp?day=" + a + "&month=" + b + "&year=" + c + "", "attendWindow2", "width=800, height=700, top=50, left=50");
        }
        
        function absentWindow(a, b, c){
        	window.open("../st_attend/sta_absent.jsp?day=" + a + "&month=" + b + "&year=" + c + "", "attendWindow3", "width=800, height=700, top=50, left=50");
        }
        
        function alterWindow(a, b, c)   {
        	window.open("../st_attend/sta_alter.jsp?day=" + a + "&month=" + b + "&year=" + c +"", "attendWindow4", "width=800, height=700, top=50, left=50");
        }
        
       
        </script>
    
      <center>
        
            <button type="button" onClick="location.href='signup.jsp?year=<%=year%>&month=<%=month-1%>'">←</button>
            &nbsp;<b><font size="6"><%=year%>년&nbsp;&nbsp;<%=month%>월</font></b>&nbsp;
            <button type="button" onClick="location.href='signup.jsp?year=<%=year%>&month=<%=month+1%>'">→</button>
            
            <table border="1">
                <tr>
                    <td style = color:red;>일</td>
                    <td>월</td>
                    <td>화</td>
                    <td>수</td>
                    <td>목</td>
                    <td>금</td>
                    <td style = color:blue;>토</td>
                </tr>
                
                <tr>
                <%
                // 달력에서 벗어난 날짜
                for(int i = 1; i < week; i++)   {
                %>
                <td hegiht="20">&nbsp;</td>
                <%
                }
                %>
                <%
                // 달력에 포함되는 날짜
                for(int j = 1; j <= endDay; j++)    {
                    week++;
                    if(week % 7 == 2)  {
                    	// 행을 만들어 주를 늘린다.
                        %>
                        </tr>
                        <tr>
                        <%
                    }
                    // 일요일
                    if(week % 7 == 2)  {%>
                    <td width="200" height="400">
                      <table width="100%" height="100%" border="1" cellspacing="0" cellborder="0">
                        <%
                        // 오늘 날짜에만 한 셀이 노란색으로 바뀌게 한다.   
                        if(j == todayDay && month == todayMonth && year == todayYear) {
                        %>
                        	<tr height="10" bgcolor=#FFFF00>
	                            <td>                                       
	                            <span style="color:red"><%=j %></span>                          
	                            </td>
                            </tr>
                        <%
                        } else{
                        %>
                            <tr height="10">
                                <td>
                                    <span style="color:red"><%=j %></span>
                                </td>
                            </tr>
                        <%
                        }
                        %>
                        
                        <tr>
                         <%
                         String z = new Integer(j).toString();
                         String x = new Integer(month).toString();
                         if(j < 10){
                        	 z = "0" + z;
                         }
                         if(month < 10){
                        	 x = "0" + x;
                         }
                         
                                                 
                         String date = year + "-" + x + "-" + z;

                         List<StaItem> staList = new ArrayList<StaItem>();
                         List<StaItem> absentList = new ArrayList<StaItem>();
                         
                         staList = staCtrl.retrieveAttend(date);
                         absentList = staCtrl.retrieveAbsent(date);
                         
                          %>
                            <td valign="top">
                            <%
                            // 결석한 학생 먼저 이름과 (결) 출력
                            for(int i = 0; i < absentList.size(); i++)  {
                                %>      
                                   <span style="color:red"><a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=absentList.get(i).getStaMemo()%>&sta_id=<%=absentList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=absentList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(absentList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(absentList.get(i).getStaId())%></a>(결)</span>
                                   <br>
                                <%
                                
                            }
                            
                            // 출석한 학생들 이름과 시간 출력
                            for(int i = 0; i < staList.size(); i++) {   
                                if(staList.get(i).getStaAbsent() == null)  {
                                    String a = staList.get(i).getStaIn();
                                    String inTime = a.substring(a.indexOf(" ") + 1, a.indexOf("."));
                                     String b = staList.get(i).getStaOut();
                                    String outTime = "";
                                    if(b != null)   {
                                       outTime = b.substring(b.indexOf(" ") + 1, b.indexOf("."));
                                    }
                                    if(outTime.length() > 6)   {
                                    	%>
                                        <a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=staList.get(i).getStaMemo() %>&sta_id=<%=staList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=staList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(staList.get(i).getStaId())%></a>
                                        <%
                                        out.print("(" + inTime.substring(0,inTime.length()-3) + "~" + outTime.substring(0,outTime.length()-3) + ")<br>" );
                                    }
                                    else{
                                    	%>
                                        <a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=staList.get(i).getStaMemo() %>&sta_id=<%=staList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=staList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(staList.get(i).getStaId())%></a>
                                        <%
                                        out.print("(" + inTime.substring(0,inTime.length()-3) + "~" + outTime + ")<br>" );
                                    }
                                } else {
                                    %>
                                    <span style="color:blue">
                                    <% 
                                    String a = staList.get(i).getStaIn();
                                    String inTime = a.substring(a.indexOf(" ") + 1, a.indexOf("."));
                                    String b = staList.get(i).getStaOut();
                                    String outTime = "";
                                    if(b != null)   {
                                       outTime = b.substring(b.indexOf(" ") + 1, b.indexOf("."));
                                    }
                                    if(outTime.length() > 6)   {
                                    	%>
                                        <a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=staList.get(i).getStaMemo() %>&sta_id=<%=staList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=staList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(staList.get(i).getStaId())%></a>
                                        <%
                                        out.print("(보" + inTime.substring(0,inTime.length()-3) + "~" + outTime.substring(0,outTime.length()-3) + ")<br>" );
                                    }
                                    else{
                                    	%>
                                        <a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=staList.get(i).getStaMemo() %>&sta_id=<%=staList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=staList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(staList.get(i).getStaId())%></a>
                                        <%
                                        out.print("(보" + inTime.substring(0,inTime.length()-3) + "~" + outTime + ")<br>" );
                                    }
                                    %>
                                    </span>
                                    <%
                                }
                            }
                            %>
                            </td>
                        </tr>
                        <tr height="15">
                          <td>
                            <center>
                            <button onclick="attendWindow(<%=j%>, <%=month%>, <%=year%>);">등원</button>
                            <button onclick="goHomeWindow(<%=j%>, <%=month%>, <%=year%>);">하원</button>
                            <button onclick="absentWindow(<%=j%>, <%=month %>, <%=year %>);">결석</button>
                            <button onclick="alterWindow(<%=j%>, <%=month%>, <%=year%>);">수정</button>
                            </center>
                          </td>
                        </tr>
                      </table>
                    </td>
                    <%
                    // 토요일
                    } else if(week % 7 == 1) {%>
                    <td width="200" height="400">
                    <table width="100%" height="100%" border="1" cellspacing="0" cellborder="0">
                        <%
                        if(j == todayDay && month == todayMonth && year == todayYear) {
                        %>
                            <tr height="10" bgcolor=#FFFF00>
                                <td>                                       
                                <span style="color:blue"><%=j %></span>                          
                                </td>
                            </tr>
                        <%
                        } else{
                        %>
                            <tr height="10">
                                <td>
                                    <span style="color:blue"><%=j %></span>
                                </td>
                            </tr>
                        <%
                        }
                        %>
                        <tr>
                             <%
                         String z = new Integer(j).toString();
                         String x = new Integer(month).toString();
                         if(j < 10){
                             z = "0" + z;
                         }
                         if(month < 10){
                             x = "0" + x;
                         }
                         
                                                 
                         String date = year + "-" + x + "-" + z;                        
                          
                         List<StaItem> staList = new ArrayList<StaItem>();
                         List<StaItem> absentList = new ArrayList<StaItem>();
                         
                         staList = staCtrl.retrieveAttend(date);
                         absentList = staCtrl.retrieveAbsent(date);
                          
                          
                          %>
                            <td valign="top">
                            <%
                            
                            // 결석한 학생 먼저 이름과 (결) 출력
                           for(int i = 0; i < absentList.size(); i++)  {
                                %>      
                                   <span style="color:red"><a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=absentList.get(i).getStaMemo()%>&sta_id=<%=absentList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=absentList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(absentList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(absentList.get(i).getStaId())%></a>(결)</span>
                                   <br>
                                <%
                                
                            }
                            
                            
                            // 출석한 학생들 이름과 시간 같이 출력
                            for(int i = 0; i < staList.size(); i++) {   
                            	if(staList.get(i).getStaAbsent() == null)  {
	                                String a = staList.get(i).getStaIn();
	                                String inTime = a.substring(a.indexOf(" ") + 1, a.indexOf("."));
	                                String b = staList.get(i).getStaOut();
	                                String outTime = "";
	                                if(b != null)   {
	                                   outTime = b.substring(b.indexOf(" ") + 1, b.indexOf("."));
	                                }
	                                if(outTime.length() > 6)   {
	                                	%>
	                                	<a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=staList.get(i).getStaMemo() %>&sta_id=<%=staList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=staList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(staList.get(i).getStaId())%></a>
	                                	<%
                                        out.print("(" + inTime.substring(0,inTime.length()-3) + "~" + outTime.substring(0,outTime.length()-3) + ")<br>" );
	                                }
	                                else{
	                                	%>
                                        <a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=staList.get(i).getStaMemo() %>&sta_id=<%=staList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=staList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(staList.get(i).getStaId())%></a>
                                        <%
	                                    out.print("(" + inTime.substring(0,inTime.length()-3) + "~" + outTime + ")<br>" );
	                                }
                            	} else {
                            		%>
                            		<span style="color:blue">
                            		<% 
                            		String a = staList.get(i).getStaIn();
                                    String inTime = a.substring(a.indexOf(" ") + 1, a.indexOf("."));
                                    String b = staList.get(i).getStaOut();
                                    String outTime = "";
                                    if(b != null)   {
                                       outTime = b.substring(b.indexOf(" ") + 1, b.indexOf("."));
                                    }
                                    if(outTime.length() > 6)   {
                                    	%>
                                        <a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=staList.get(i).getStaMemo() %>&sta_id=<%=staList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=staList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(staList.get(i).getStaId())%></a>
                                    	<%
                                        out.print("(보" + inTime.substring(0,inTime.length()-3) + "~" + outTime.substring(0,outTime.length()-3) + ")<br>" );
                                    }
                                    else{
                                    	%>
                                        <a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=staList.get(i).getStaMemo() %>&sta_id=<%=staList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=staList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(staList.get(i).getStaId())%></a>
                                        <%
                                        out.print("(보" + inTime.substring(0,inTime.length()-3) + "~" + outTime + ")<br>" );
                                    }
                                    %>
                                    </span>
                                    <%
                            	}
                            }
                            %>
                            </td>
                        </tr>
                        <tr height="15">
                          <td>
                            <center>
                            <button onclick="attendWindow(<%=j%>, <%=month%>, <%=year%>);">등원</button>
                            <button onclick="goHomeWindow(<%=j%>, <%=month%>, <%=year%>);">하원</button>
                            <button onclick="absentWindow(<%=j%>, <%=month %>, <%=year %>);">결석</button>
                            <button onclick="alterWindow(<%=j%>, <%=month%>, <%=year%>);">수정</button>
                            </center>
                          </td>
                        </tr>
                      </table>
                    </td>
                    <%
                    // 주중
                    } else {%>
                    <td width="200" height="400" >
                    <table width="100%" height="100%" border="1" cellspacing="0" cellborder="0">
                        <%
                        if(j == todayDay && month == todayMonth && year == todayYear) {
                        %>
                            <tr height="10" bgcolor=#FFFF00>
                                <td>                                       
                                <span style="color:black"><%=j %></span>                          
                                </td>
                            </tr>
                        <%
                        } else{
                        %>
                            <tr height="10">
                                <td>
                                    <span style="color:black"><%=j %></span>
                                </td>
                            </tr>
                        <%
                        }
                        %>
                        <tr>
                            <%
                         String z = new Integer(j).toString();
                         String x = new Integer(month).toString();
                         if(j < 10){
                             z = "0" + z;
                         }
                         if(month < 10){
                             x = "0" + x;
                         }
                         
                                                 
                         String date = year + "-" + x + "-" + z;
                         
                          List<StaItem> staList = new ArrayList<StaItem>();
                          List<StaItem> absentList = new ArrayList<StaItem>();
                          
                          staList = staCtrl.retrieveAttend(date);
                          absentList = staCtrl.retrieveAbsent(date);
                          
                          %>
                            <td valign="top">                                                       
                            <%
                            
	                         // 결석한 학생 먼저 이름과 (결) 출력
                            for(int i = 0; i < absentList.size(); i++)  {
                                %>      
                                   <span style="color:red"><a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=absentList.get(i).getStaMemo()%>&sta_id=<%=absentList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=absentList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(absentList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(absentList.get(i).getStaId())%></a>(결)</span>
                                   <br>
                                <%
                                
                            }
                            
                            // 출석한 학생들 이름과 시간 입력
                           for(int i = 0; i < staList.size(); i++) {   
                                if(staList.get(i).getStaAbsent() == null)  {
                                    String a = staList.get(i).getStaIn();
                                    String inTime = a.substring(a.indexOf(" ") + 1, a.indexOf("."));
                                    String b = staList.get(i).getStaOut();
                                    String outTime = "";
                                    if(b != null)   {
                                       outTime = b.substring(b.indexOf(" ") + 1, b.indexOf("."));
                                    }
                                    if(outTime.length() > 6)   {
                                    	%>
                                        <a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=staList.get(i).getStaMemo() %>&sta_id=<%=staList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=staList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(staList.get(i).getStaId())%></a>
                                        <%
                                        out.print("(" + inTime.substring(0,inTime.length()-3) + "~" + outTime.substring(0,outTime.length()-3) + ")<br>" );
                                    }
                                    else{
                                    	%>
                                        <a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=staList.get(i).getStaMemo() %>&sta_id=<%=staList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=staList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(staList.get(i).getStaId())%></a>
                                        <%
                                        out.print("(" + inTime.substring(0,inTime.length()-3) + "~" + outTime + ")<br>" );
                                    }
                                } else {
                                    %>
                                    <span style="color:blue">
                                    <% 
                                    String a = staList.get(i).getStaIn();
                                    String inTime = a.substring(a.indexOf(" ") + 1, a.indexOf("."));
                                    String b = staList.get(i).getStaOut();
                                    String outTime = "";
                                    if(b != null)   {
                                       outTime = b.substring(b.indexOf(" ") + 1, b.indexOf("."));
                                    }
                                    if(outTime.length() > 6)   {
                                    	%>
                                        <a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=staList.get(i).getStaMemo() %>&sta_id=<%=staList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=staList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(staList.get(i).getStaId())%></a>
                                        <%
                                        out.print("(보" + inTime.substring(0,inTime.length()-3) + "~" + outTime.substring(0,outTime.length()-3) + ")<br>" );
                                    }
                                    else{
                                    	%>
                                        <a href="#" style="text-decoration:none; color:black" target="_blank" onclick="window.open('../st_attend/sta_writeMemo.jsp?sta_memo=<%=staList.get(i).getStaMemo() %>&sta_id=<%=staList.get(i).getStaAttendId()%>&date=<%=date %>&st_id=<%=staList.get(i).getStaId()%>&name=<%=stCtrl.selectStudent(staList.get(i).getStaId()) %>', 'newWindow', 'width=550, height=550, top=50, left=50'); return false;"><%=stCtrl.selectStudent(staList.get(i).getStaId())%></a>
                                        <%
                                        out.print("(보" + inTime.substring(0,inTime.length()-3) + "~" + outTime + ")<br>" );
                                    }
                                    %>
                                    </span>
                                    <%
                                }
                            }
                            %>
                        </tr>
                        <tr height="15">
                          <td>
                            <center>
                            <button onclick="attendWindow(<%=j%>, <%=month%>, <%=year%>);">등원</button>
                            <button onclick="goHomeWindow(<%=j%>, <%=month%>, <%=year%>);">하원</button>
                            <button onclick="absentWindow(<%=j%>, <%=month %>, <%=year %>);">결석</button>
                            <button onclick="alterWindow(<%=j%>, <%=month%>, <%=year%>);">수정</button>
                            </center>
                          </td>
                        </tr>
                      </table>
                    </td>
                    <% }%>
                    
                <%  
                }
                %>
                
                </tr>                
            </table>
        </center>
    </body>
</html>