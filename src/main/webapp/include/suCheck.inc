<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>JavaScript in HTML Example</title>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");
    int ssuCheck = (int) session.getAttribute("ssu");
    
    if(ssuCheck != 1)  {
        %>
        <script>
        alert("permission denied!!");
        history.back();
        </script>
        <%
    }
 %>
    
</body>
</html>