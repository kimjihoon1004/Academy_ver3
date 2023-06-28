<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import="com.eugene.login.ctrl.LoginCtrl" %>
<%@ page import="com.eugene.login.item.LoginItem" %>

<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
   
    <title>로그인</title>
    <meta charset="UTF-8">
    <header>
       <center>
        <h1>Eugene Programming Attendance</h1><hr>
        </center>
    </header>
    </head>
    <body>
         <%
         LoginCtrl loginControl = new LoginCtrl();
         request.setCharacterEncoding("UTF-8");
         if(request.getMethod().equalsIgnoreCase("POST"))    {
        	    String subtype = request.getParameter("subtype");
        	    if(subtype.equals("login"))   {
		            String id = request.getParameter("uID");
		            String pw = request.getParameter("uPW");
		            String checkpw = loginControl.loginTc(id);
		            if(pw.equals(checkpw))   {
		            	int su = -1;// 추가한 부분입니다.
                        su = loginControl.isSu(id);
                        session.setAttribute("ssu", su);
		            	  session.setAttribute("iid", id);
                          %>
		                  <script type = "text/javascript">
		                 
		                  location.href="signup.jsp";
		                  </script>
		                  <%
		            } else {
                %>
                <script type = "text/javascript">
                   alert("로그인 실패...")
                </script>
                <%
                }
            }
     	}
    %>
    
        <script>
            function checkValue()
            {
                var form = document.login;

                if(!form.uID.value){
                    alert("아이디를 입력하세요!");
                    document.login.uID.focus();
                    return false;
                }

                if(!form.uPW.value){
                    alert("비밀번호를 입력하세요!");
                    document.login.uPW.focus();
                    return false;
                }
            }
        </script>
        <fieldset>
            <center>
                <form name="login" onSubmit="return checkValue();" method="post">
                <input type="hidden" name="subtype" value="login"/>
                    <table border="2" width = "800" cellspacing = "0" cellpadding = "2">
                        
                        <tr>
                            <td colspan = "2" bgcolor = "lightgray" height = "30" class = "style1"><h2><center>로그인</center></h2></td>                   
                        </tr>
                        
                        <tr>
                            <td width = "130" bgcolor = "lightgray" class = "style2"><center>아이디</center></td>
                            <td  width = "500">
                                <input type="text" name="uID" size = "40" maxlength = "50" class = "input_style1" />
                            </td>
                        </tr>
                        
                        
                        
                        <tr>
                            <td width = "130" bgcolor = "lightgray" class = "style2"><center>비밀번호</center></td>
                            <td  width = "500">
                                <input type="password" name="uPW" size = "40" maxlength = "50" class = "input_style1" />
                            </td>
                        </tr>
                    </table>
                
                    
                    <br><br>
                    <center>
                        <input type = "submit" style="WIDTH: 80pt; HEIGHT: 20pt" value="로그인">&nbsp;&nbsp;
                        <input type = "button" style="WIDTH: 80pt; HEIGHT: 20pt" onclick = "location.href='createUser.jsp'" value="교직원 가입"/>&nbsp;&nbsp;
                        <input type = "button" style="WIDTH: 130pt; HEIGHT: 20pt" onclick = "location.href='findUser.jsp'" value="아이디/비밀번호 찾기"/>&nbsp;&nbsp;
                    </center>
                </form>
            </center>
        </fieldset>
    </body>
</html>