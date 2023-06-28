<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import="com.eugene.crs.ctrl.CrsCtrl" %>
<%@ page import="com.eugene.crs.item.CrsItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <header>
    <center>
    <h1> 과목 조회 </h1>
      <form action = "crsRetrieve.jsp" method="POST">
      <tr><td><input type="button" value="뒤로" onclick="history.back();"/></td></tr> 
        <td>과목 조회
          <input type = "text" name = "crs_name" value = ""> 
        </td>
      </tr>
      <tr><td><button type="submit" >검색</button></td></tr> 
      <tr><td><button type="button" onclick="location.href='courseTime.jsp'">시간표</button></td></tr>
      <tr><td><button type="button" onclick="location.href='crsAdd.jsp'">추가</button></td></tr>
      
      </form>
 <%
    request.setCharacterEncoding("UTF-8");
 String name = (String)request.getParameter("crs_name");
 
 
  CrsCtrl crsCtrl = new CrsCtrl();
  List<CrsItem> crsItems = new ArrayList<CrsItem>();
  
  CrsItem crsItem = new CrsItem();
  
  crsItem.setCrsName(name);
  
  
  if (null != name)
  {
    crsItems = crsCtrl.searchName(crsItem);
    
    
    if(crsItems.size() == 0)
    {
      %>
      <script>
          alert("일치하는 정보가 존재하지 않습니다.");
          location.href='crsRetrieve.jsp';
          </script>
          <%
          crsItem.getCrsName();
        
    }else{
        
    }
    
  }// tcname값 가져오기
  else if(null == name || name == ""){ // 빈칸에 아무것도 입력을 안했을 경우 모든 리스트의 값을 가져오기
      
      crsItems = crsCtrl.retrieveCrsList();
      
  }
 %>
  
 
  <table border="1" bordercolor="blue" width="200" height="100">
  <tr>
   <th>번호</th> <th>이름</th>
  </tr>
  
   <%
   for(int i = 0; i < crsItems.size(); i++){
   %>
    <tr>
	  <td>
	       <center>
	       <%=i+1 %>
	       </center>
	  </td>
    
      <td>
        <a href="crsDetail.jsp?id=<%=crsItems.get(i).getCrsId() %>"><%=crsItems.get(i).getCrsName()%></a>
      </td>
    </tr>
   <% 
  }
 %>
 </table>
</body>
</html>