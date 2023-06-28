<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Calendar" %>
<%@ page import= "java.time.LocalDate" %>
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<%@ page import = "com.eugene.st_fee.ctrl.StfCtrl" %>
<%@ page import = "com.eugene.st_fee.item.StfItem" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
	<%
	//오늘 날짜 구하는 코드
	Calendar cal = Calendar.getInstance();
	LocalDate today = LocalDate.now();
	int todayYear = today.getYear();
	int todayMonth = today.getMonthValue();
	int todayDay = today.getDayOfMonth();
	
	//달력의 년, 월, 일을 구하는 코드
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
	

	StudentItem stItem = new StudentItem();
    StudentCtrl stCtrl = new StudentCtrl();
    StfCtrl stfCtrl = new StfCtrl();
    StfItem stfItem = new StfItem();
	%>
	<br><br><br>
	<center>
	    <button type="button" onClick="location.href='stfRetrieve.jsp?year=<%=year%>&month=<%=month-1%>'">←</button>
	    &nbsp;<b><font size="6"><%=year%>년&nbsp;&nbsp;<%=month%>월</font></b>&nbsp;
	    <button type="button" onClick="location.href='stfRetrieve.jsp?year=<%=year%>&month=<%=month+1%>'">→</button>       
	</center>
	
	<%
	String temp = null;
	if(month < 10) {
	    temp = "0" + Integer.toString(month);	   
	} else {
		temp = Integer.toString(month);
	}
	//년도와 월
	temp = year + "-" + temp;
	stfItem.setFeeCheck(temp);
	String sumFee = stfCtrl.sumFee(stfItem);
	if(sumFee != null) {
		   sumFee = sumFee.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
		   
	} else {
		sumFee = "0";
	}
	%>
	<br>
	<center>
	<table border="1" bordercolor="blue" width="800">
	   <tr>
	       <td width="400">
	           <center><%=month %>월 총 금액</center>
	       </td>
	       <td width="400">
	           <center><%=sumFee %>원</center>
	       </td>
	   </tr>
	</table>
	<br>
	<table border="1" bordercolor="blue" width="1000">
       <tr>
	       <th style="width:100px">이름</th> <th style="width:100px">수강료</th> <th style="width:100px">납부일</th> <th style="width:100px">납부변경일</th> <th style="width:150px">결제금액</th> <th style="width:100px">결제일</th> <th style="width:300px">메모</th> <th style="width:100px">납부편집</th>
	   </tr>
	
	<%
	List<String> st_id = new ArrayList<String>();
	List<String> st_enroll_day = new ArrayList<String>();
    List<String> st_enroll_month = new ArrayList<String>();
    List<String> st_enroll_year = new ArrayList<String>();
	List<StudentItem> stBean = new ArrayList<StudentItem>(); 
	stBean = stCtrl.retrieveStudentList();
	for(int i = 0; i < stBean.size(); i++) {
		String id = Integer.toString(stBean.get(i).getStId());
		// st_id리스트에 모든 학생 id 추가 시킨다.
		st_id.add(id);
		String name = stBean.get(i).getStName();
		
		String enroll = stBean.get(i).getStEnroll();
		String enroll_year = enroll.substring(0,4);
		String enroll_month = enroll.substring(5,7);
		 if(enroll_month.charAt(0) == '0')  {
	          enroll_month = enroll_month.substring(1,2);
	        }
		String enroll_day = enroll.substring(enroll.length()-2 ,enroll.length());
        if(enroll_day.charAt(0) == '0')  {
      	  enroll_day = enroll_day.substring(1,2);
        }
        st_enroll_day.add(enroll_day);
        st_enroll_month.add(enroll_month);
        st_enroll_year.add(enroll_year);
		List<StfItem> stfList = new ArrayList<StfItem>();
        stfItem.setStId(Integer.valueOf(id));
        stfItem.setFeeCheck(temp);
        stfItem.setFeePrePay(temp);
        
        //stfList에 있는 학생들은 수강료를 이미 납부한 학생들
        stfList = stfCtrl.retrieveStFee(stfItem);
        for(int j = 0; j < stfList.size(); j++) {
        	if(stfList.get(j).getFeePrePay() != null)  {
        	    String[] feePrePay = stfList.get(j).getFeePrePay().split("-");
	        	String tempA = feePrePay[1];
	        	String[] feeCheck = stfList.get(j).getFeeCheck().split("-");
	        	String tempB = feeCheck[1];
	        	if(!tempA.equals(tempB))   {
	        		if(st_id.contains(id)) {
	                    st_id.remove(id);
	                    if(st_enroll_day.contains(enroll_day))    {
	                     st_enroll_day.remove(enroll_day);
	                    }
	                    if(st_enroll_month.contains(enroll_day))    {
	                        st_enroll_month.remove(enroll_month);
	                    }
	                    if(st_enroll_year.contains(enroll_year))    {
	                        st_enroll_year.remove(enroll_year);
	                    }
	                }
	        		continue;
	        	}
        	}
		%>
		<tr>
		  <td>
		      <center>
		      <%//이름 %>
		      <%=name %>
		      </center>
		  </td>
		  
		  <td>
            <center>
                <%
                //결제금액
                //금액을 3자리마다 쉼표 찍어주기
                int stfee = stBean.get(i).getStFee();  
                String strStFee = Integer.toString(stfee);
                strStFee = strStFee.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
                out.print(strStFee + "원");%>
            </center>
          </td>
          
		  <td>
              <center>
              <%
              //납부일
              out.print(enroll_day + "일");
              %>
              </center>
          </td>
          
          <td>
            <center>
                <%
                //납부변경일
                String feeChangeDate = Integer.toString(stBean.get(i).getStFeeChange()); 
                if(feeChangeDate == "0" || feeChangeDate.equals("0")) {
                    %>
                    <input type="button" value="변경" onclick="location.href='../st/stDetail.jsp?id=<%=id %>'"/>
                    <%
                } else {
                    out.print(feeChangeDate + "일");
                }%>
            </center>
          </td>
          
          <td>
            <center>
                <%
                //결제금액
                int fee = 0;        
                if(stfList.size() > 0)  {
	                fee = stfList.get(j).getFee();
	                String strFee = Integer.toString(fee);
	                strFee = strFee.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
	                if(fee == 0)   {
	                	out.print("미납");
	                }
	                out.print(strFee + "원");
                } else {
                	out.print("미납");
                }
                %>
            </center>
          </td>
          
          
          <td>
            <center>
                <%
                //결제일
                if(stfList.size() > 0)    {
                	if(stfList.get(j).getFeeCheck() != null) {
                	    out.print(stfList.get(j).getFeeCheck());
	                } else {
	                	out.print("미납");
	                }
                } else {
                	out.print("미납");
                }
                %>
            </center>
          </td>
          
          
           <td>
            <center>
                <%
                //메모
                if(stfList.get(j).getFeeMemo() == null || stfList.get(j).getFeeMemo().equals("")) {%>
                    X
                <%} else { %>
                    <%=stfList.get(j).getFeeMemo() %>
                <%} %>
            </center>
          </td>
          
          <td>
            <center>
                <input type="button" value="납부편집" onclick="window.open('stPayChange.jsp?feeId=<%=stfList.get(j).getFeeId()%>&name=<%=name %>&fee=<%=fee %>&feeDate=<%=stfList.get(j).getFeeCheck() %>&feeMemo=<%=stfList.get(j).getFeeMemo() %>', 'newWindow1', 'width=200, heigth=500, top=20, left=20');"/>
            </center>
          </td>
          
		</tr>
		<%
		  // st_id 리스트에 id가 포함되어 있다면 삭제한다.
		  // 포함이 됐다는건 해당 월에 수강료를 납부했다는 뜻이다.
			if(st_id.contains(id)) {
				st_id.remove(id);
				if(st_enroll_day.contains(enroll_day))    {
		    	 st_enroll_day.remove(enroll_day);
		    	}
				if(st_enroll_month.contains(enroll_day))    {
					st_enroll_month.remove(enroll_month);
				}
				if(st_enroll_year.contains(enroll_year))    {
					st_enroll_year.remove(enroll_year);
				}
			}
        }
	}
	%>
	</table>
	<br>
	<input type="button" value="추가 납부" onclick="window.open('stFeeAdditional.jsp', 'newWindow1', 'width=200, heigth=500, top=20, left=20');"/>   
	<br><br>
	<h1>미납 인원</h1>
	<table border="1" bordercolor="blue" width="500" height="100">
	   <tr>
	       <th>이름</th> <th>납부일</th> <th>납부</th>
       </tr>
       
       <%for(int k = 0; k < st_id.size(); k++)  {
    	    StudentItem tempStItem = new StudentItem();
    	    StudentCtrl tempStCtrl = new StudentCtrl();
    	    tempStItem.setStId(Integer.valueOf(st_id.get(k)));
    	    tempStItem = tempStCtrl.retireveStudent(tempStItem);
    	    int local = 0;
            if(Integer.valueOf(st_enroll_day.get(k)) <= todayDay || month < todayMonth)   {
                local = 1;
            }
            if(month > todayMonth)  {
                local = 0;
            }
            if(year < todayYear)    {
            	local = 1;
            }
            %>
	       <%if(local == 0) {%>
		       <tr>
		        <td>
		            <center><%=stCtrl.selectStudent(st_id.get(k))%></center>
		        </td>
		        
		        <td>
		          <center><%=st_enroll_day.get(k) %>일</center>
		        </td>
		        
		        <td>
		            <center><input type="button" value="납부" onclick="window.open('stFeePay.jsp?id=<%=st_id.get(k)%>&todayDay=<%=todayDay%>&year=<%=st_enroll_year.get(k) %>&fee=<%=tempStItem.getStFee() %>&day=<%=st_enroll_day.get(k) %>&month=<%=st_enroll_month.get(k) %>&name=<%=stCtrl.selectStudent(st_id.get(k))%>&todayMonth=<%=todayMonth%>&todayYear=<%=todayYear%>&yyear=<%=year %>&mmonth=<%=month %>', 'newWindow', 'width=300, heigth=200, top=50, left=50'); return false;"/></center>
		        </td>
			   </tr>
	       <%} else { %>
		       <tr bgcolor=#FFFF00>
		        <td>
		            <center><%=stCtrl.selectStudent(st_id.get(k))%></center>
		        </td>
		        <td>
		            <center><%=st_enroll_day.get(k) %>일</center>
		        </td>
		        
		        <td>
		            <center><input type="button" value="납부" onclick="window.open('stFeePay.jsp?id=<%=st_id.get(k)%>&todayDay=<%=todayDay%>&year=<%=st_enroll_year.get(k) %>&fee=<%=tempStItem.getStFee() %>&day=<%=st_enroll_day.get(k) %>&month=<%=st_enroll_month.get(k) %>&name=<%=stCtrl.selectStudent(st_id.get(k))%>&todayMonth=<%=todayMonth%>&todayYear=<%=todayYear%>&yyear=<%=year %>&mmonth=<%=month %>', 'newWindow', 'width=300, heigth=200, top=50, left=50'); return false;"/></center>
		        </td>
		       </tr>
	       <%} %>
    <%} %>
	</table>
	</center>
</body>
</html>