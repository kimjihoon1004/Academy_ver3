<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
StfItem stfItem = new StfItem();
StfCtrl stfCtrl = new StfCtrl();
String stId = request.getParameter("stId");
String fee = request.getParameter("fee");//넘겨받은 결제금액의 값
String temp = fee.replaceAll(",", "");//쉼표를 삭제하여 실제 db에 들어갈 값
int intFee = Integer.valueOf(temp);
String name = request.getParameter("name");
String feeMemo = request.getParameter("feeMemo");
//결제일
String feeDate = request.getParameter("feeDate");
String aMonth = request.getParameter("feeMonth1");
String bMonth = request.getParameter("feeMonth2");
int feeCount = 0;
int success = 0;

stfItem.setStId(Integer.valueOf(stId));
stfItem.setFeeMemo(feeMemo);
stfItem.setFeeCheck(feeDate);
if(aMonth.equals("") || bMonth.equals(""))  {
	//달이 하나만 있는 경우
	String date = "";
	if(aMonth.equals("") && !bMonth.equals(""))   {
		date = bMonth;
	}
	else if(!aMonth.equals("") && bMonth.equals("")){
		date = aMonth;
	}
	stfItem.setFee(intFee);
	String tempDate = date + "-01";
	//여기서 db에 insert한다.
	stfItem.setFeePrePay(tempDate);
	success = stfCtrl.PrePay(stfItem);
	if(success < 0)   {
		System.out.println("!");
        %>
        <script>
         alert("<%=name%>의 추가 수납 실패");
         window.close();
        </script>
        <%
    }
} else {
	//달에 모두 값이 있는 경우
   int year1 = Integer.valueOf(aMonth.substring(0,4));
	int month1 = Integer.valueOf(aMonth.substring(6,aMonth.length()));
	int year2 = Integer.valueOf(bMonth.substring(0,4));
	int month2 = Integer.valueOf(bMonth.substring(6,bMonth.length()));
	int tempMonth1 = month1;
	int tempMonth2 = month2;
	int tempYear1 = year1;
	int tempYear2 = year2;
	while(true)    {
		feeCount++;
		tempMonth1++;
		if(tempMonth1 == 13){
			tempMonth1 = 1;
			tempYear1++;
		}
		if(tempYear1 == tempYear2 && tempMonth1 == tempMonth2)    {
			feeCount++;
			break;
		}
	}
	stfItem.setFee(intFee);
	
	while(true)    {
		//stFee 테이블에 insert 대신 시험삼아 출력으로 대체한다.
		String tempDate = year1 + "-" + month1 + "-01";
		stfItem.setFeePrePay(tempDate);
		success = stfCtrl.PrePay(stfItem);
		month1++;
		if(month1 == 13)  {
			month1 = 1;
			year1++;
		}
		if(year1 == year2 && month1 == month2)    {
			System.out.println(year1 + "-" + month1 + "-01");
			tempDate = year1 + "-" + month1 + "-01";
	        stfItem.setFeePrePay(tempDate);
	        success = stfCtrl.PrePay(stfItem);
	        if(success < 0)   {
	        	System.out.println("@");
	            %>
	            <script>
	             alert("<%=name%>의 추가 수납 실패");
	             window.close();
	            </script>
	            <%
	        }
			break;
		}
		
		if(success < 0)   {
			System.out.println("#");
			%>
			<script>
			 alert("<%=name%>의 추가 수납 실패");
			 window.close();
			</script>
			<%
		}
	}
}
if(success > 0)    {
		System.out.println("$");
		%>
        <script>
         alert("<%=name%>의 추가 수납 성공");
         window.close();
        </script>
        <%
}
%>
</body>
</html>