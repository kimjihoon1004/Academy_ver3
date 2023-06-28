<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Student retrieve page</title>
	</head>
	<body>
		<%
		StudentCtrl stCtrl = new StudentCtrl();
			List<StudentItem> stBean = new ArrayList<StudentItem>();
			
			
			
			request.setCharacterEncoding("utf-8");
			String textSerch = request.getParameter("textSerch");
			
			if(textSerch == null || textSerch == ""){
				stBean = stCtrl.retrieveStudentList();
			}
			else{
				stBean = stCtrl.PartialRetrieveStudentList(textSerch);
				
				if(stBean.size() == 0){
		%>
						<script>
							alert('일치하는 데이터가 없습니다.')
							location.href='stRetrieve.jsp'
						</script>
					<% 
					
				}
			}
		%>
		
		
		<br>
		<br>
		 <center>
		<h1>학생 조회</h1>
		<form action="stRetrieve.jsp">
		 <input type="text" name="textSerch" placeholder="이름을 입력하세요"/>
		 
		 <input type="submit" value="serch" align="center"/>
		 <input type="button" value="추가" onclick="location.href='stAdd.jsp'"/>
		</form>
		<br>
		<table border="1" bordercolor="blue" width="300" height="100">
			<tr>
				<th>번호</th> <th>이름</th> <th>학교</th>
			</tr>
		<%
			for(int i = 0; i < stBean.size(); i++){
				%>
					<tr>
						<td>
							<%=i+1 %>
						</td>
						<td>
						<a href="stDetail.jsp?id=<%=stBean.get(i).getStId()%>" > <%=stBean.get(i).getStName()%> </a>
						</td>
						<td>
							<%=stBean.get(i).getStSchool()%>
						</td>
					</tr>
				<% 
			}
		%>
		</table>
		</center>
		
	</body>
</html>