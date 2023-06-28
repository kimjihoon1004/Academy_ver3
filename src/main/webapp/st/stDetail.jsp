<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<%@ page import="com.eugene.tc.item.TeacherItem" %>
<%@ page import="com.eugene.tc.ctrl.TeacherCheckControl" %>
<%@ page import="com.eugene.sign.item.SignItem" %>
<%@ page import="com.eugene.sign.ctrl.SignCtrl" %>
<%@ page import="com.eugene.crs.ctrl.CrsCtrl" %>
<%@ page import="com.eugene.crs.item.CrsItem" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">  
        <title>Student detail page</title>
    </head>
    <body>
    
    <%
        request.setCharacterEncoding("utf-8");
            String Id = request.getParameter("id");
            
            int id = Integer.parseInt(Id);
            
            CrsCtrl crsCtrl = new CrsCtrl();
            CrsItem crsItem = new CrsItem();
            SignItem signItem = new SignItem();
            SignCtrl signCtrl = new SignCtrl();
            signItem.setSt_id(Id);
            List<SignItem> signList = new ArrayList<SignItem>();
            signList = signCtrl.selectCrs(signItem);
            
            TeacherItem tcItem = new TeacherItem();
            TeacherCheckControl tcCtrl = new TeacherCheckControl();
            
            StudentItem student = new StudentItem();
            StudentCtrl stCtrl = new StudentCtrl();
            
            student.setStId(id);
            student = stCtrl.retireveStudent(student);
            
            tcItem.setId(student.getTcId());
            tcItem = tcCtrl.teacherInformation(tcItem);
            
    %>
    <br>
    <br>
    <br>
    <center>
    <table border="1" width="400" height="150"> 
	    <tr>
	       <td width="150">
           이름 
           </td>
	       <td>
           <%= student.getStName() %>
           </td>
	    </tr>
	     <tr>
	       <td>
           전화번호 
           </td>
           <td>
           <%= student.getStPhone() %>
           </td>
        </tr>
	    <tr>
	       <td>
           학부모 전화번호 
           </td>
           <td>
           <%= student.getStParents() %>
           </td>
        </tr>
	    <tr>
           <td>
           학교
           </td>
           <td>
           <%= student.getStSchool() %>
           </td>
        </tr>
	    <tr>
	       <td>
           생년월일
           </td>
           <td>
           <%= student.getStDate() %>
           </td>
        </tr>
        <tr>
           <td>
           등록일 
           </td> 
           <td>
           <%= student.getStEnroll() %>
           </td>
        </tr>
        
        <tr>
            <td>
            납부변경일
            </td>
            <td>
            <%if(student.getStFeeChange() == 0)  {
                out.print("변경없음");
            } else {
                out.print(student.getStFeeChange() + "일");
            }%>
            </td>
        </tr>
        <tr>
            <td>
            수강료
            </td>
            <td><%
            String stFee = Integer.toString(student.getStFee());
            stFee= stFee.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
            %>
            <%=stFee%>원
            </td>
        </tr>
        
        <tr>
            <td>
            담당교사
            </td>
            <td>
                <%if(student.getTcId() == null || student.getTcId().equals("null")) {
                    out.print("");
                } else {%>
                    <%=tcItem.getName() %>
                <%} %>
            </td>
        </tr>
        
        <tr>
            <td>
            수강과목
            </td>
            <td>
            <%
            if(signList.size() > 0) {
	            for(int i = 0; i < signList.size(); i++)  {
	                String crsId = signList.get(i).getCrs_id();
	                crsItem = crsCtrl.retrieveCrs(Integer.valueOf(crsId));
	                out.print(crsItem.getCrsName() + " ");
	            } 
            } else{
            	out.print("");
            }
            %>
            </td>
        </tr>
        
        <tr>
            <td>
            주소
            </td>
           <td>
            <%= student.getStAddress() %>
           </td>
        </tr>
        <tr>
           <td>
           성별
           </td>
           <td>
           <%= student.getStGender() %>
           </td>
        </tr>
        
        
	    <tr>
	       <td>
           메모
           </td>
           <td> 
           <%= student.getStMemo() %>
           </td>
        </tr>
    </table>
    <br>
    <button onclick="location.href='stRetrieve.jsp'">뒤로</button>
    <button onclick="location.href='stDelete.jsp?id=<%= student.getStId() %>'">삭제</button>
    <button onclick="location.href='stAdd.jsp?id=<%= student.getStId() %>'">편집</button>
    </center>
    </body>
</html>