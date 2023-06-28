<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import="com.eugene.login.ctrl.LoginCtrl" %>
<%@ page import="com.eugene.login.item.LoginItem" %>
<%@page import="com.eugene.tc.item.TeacherItem" %>
<%@page import="com.eugene.tc.ctrl.TeacherCheckControl" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <title>Child</title>
    
</head>
<body>
    
    <script type="text/javascript">
	    var result = 0;
	    var iiid = window.opener.document.getElementById("id").value;
	    var mmmail = window.opener.document.getElementById("mail").value;
	    if(iiid == "") {
	    	alert("아이디가 공백입니다. 다시 입력하세요.");
	    	window.close();
	    }
	    if(mmmail == "") {
            alert("이메일이 공백입니다. 다시 입력하세요.");
            window.close();
        }
	    var tcId = iiid + "@" + mmmail;
    </script>
    <%
    TeacherItem tcItem = new TeacherItem();
    TeacherCheckControl tcCtrl = new TeacherCheckControl();
    List<TeacherItem> tcList = new ArrayList<TeacherItem>();
    tcList = tcCtrl.retrieveTeacher();
    out.println(tcList.get(0).getTcMail());
    String a = "asdfasdf";
    String b= request.getParameter("mail");
   
    for(int k = 0; k < tcList.size(); k++)  {
    	String temp = tcList.get(k).getTcMail();
    	out.println(k);
    %>
	    <script>
	    document.write(tcId);
	    if(tcId == "<%=temp%>")    {
	    	document.write("correct");
	    	result += 1;
	    }
	    </script>
    <%} %>
    <br>
    
    <script type="text/javascript">
    if(result > 0)  {
    	alert("중복입니다. 다시 입력하세요.");
    	opener.document.getElementById("id").value = "";
    	opener.document.getElementById("mail").value = "";
    	window.close();
    } else{
    	alert("아이디 사용 가능");
        window.close();
    }
    </script>
    
</body>
</html>
