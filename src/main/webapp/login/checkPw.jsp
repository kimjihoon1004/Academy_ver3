<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import="com.eugene.login.ctrl.LoginCtrl"%>
<%@ page import="com.eugene.login.item.LoginItem" %>

<%@ page import="org.apache.ibatis.session.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% String name = request.getParameter("name");
if(request.getMethod().equalsIgnoreCase("GET")){
    String a = request.getParameter("user_pw");
    String b = request.getParameter("user_pwcheck");
    String c = request.getParameter("rename");
    
    if(a.length() >= 4 && b.length() >= 4 && a.equals(b))   {
        request.setCharacterEncoding("UTF-8");
        LoginCtrl ctrl = new LoginCtrl();
        LoginItem item = new LoginItem();
        item.setLoginName(c);
        item.setLoginPw(a);
        ctrl.updatePw(item);
    }
}
%>
</head>
<body>
    <script type="text/javascript">
        function pwcheck(a, b){
            if(a.value != b.value)  {
                alert("비밀번호가 일치하지 않습니다!");
            }
            else if(a.value.length < 4 || b.value.length < 4)   {
                alert("비밀번호는 4자리 이상이어야 합니다.");
            }
            else if(a.value == b.value)    {
                alert("비밀번호가 일치합니다!");
            }
        }
    </script>
    <h1>비밀번호 재설정</h1>
    
    <form action="reCheckPw.jsp" method="get">
        <input type = "hidden" name="rename" value=<%=name%>>
        비밀번호 : <input type="password" placeholder="4글자 이상 입력하세요." name="user_pw" size = "20" maxlength = "20" class = "input_style1" /><br>
        비밀번호 확인 : <input type="password" placeholder="4글자 이상 입력하세요." name="user_pwcheck" size = "20" maxlength = "20" class = "input_style1" />&nbsp;&nbsp;
        <input type="submit" style="WIDTH: 80pt; HEIGHT: 20pt" onclick="pwcheck(user_pw, user_pwcheck)" value="비밀번호 확인"/>
        <input type="button" onclick="location.href='Tc_findID.jsp'" value="뒤로가기">
    </form>
</body>
</html>