<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ page import="com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import="com.eugene.st.item.StudentItem" %>
<%@ page import="com.eugene.crs.item.CrsItem" %>
<%@ page import="com.eugene.crs.ctrl.CrsCtrl" %>
<%@ page import="com.eugene.tc.item.TeacherItem" %>
<%@ page import="com.eugene.tc.ctrl.TeacherCheckControl" %>
<%@ page import="com.eugene.sign.item.SignItem" %>
<%@ page import="com.eugene.sign.ctrl.SignCtrl" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student add page</title>
    </head>
    <body>
        <%
        request.setCharacterEncoding("utf-8");
        
        StudentItem stBean = new StudentItem();
        StudentCtrl stCtrl = new StudentCtrl();
        
        TeacherCheckControl tcCtrl = new TeacherCheckControl();
        TeacherItem tcItem = new TeacherItem();
        
        CrsCtrl crsCtrl = new CrsCtrl();
        CrsItem crsItem = new CrsItem();
        List<CrsItem> crsBean = new ArrayList<CrsItem>();
        List<TeacherItem> tcBean = new ArrayList<TeacherItem>();
        
        crsBean = crsCtrl.retrieveCrsList();
        tcBean = tcCtrl.retrieveTeacher();
               
        String Id = request.getParameter("id");
        
        SignCtrl signCtrl = new SignCtrl();
        SignItem signItem = new SignItem();
        List<SignItem> signBean = new ArrayList<SignItem>();
        signItem.setSt_id(Id);
        signBean = signCtrl.selectCrs(signItem);
        String enroll_day = "";
        
        if(Id == null || Id == ""){
                // insert student
            stBean.setStName("");
            stBean.setStPhone("");
            stBean.setStSchool("");
            stBean.setStParents("");
            stBean.setStDate("");
            stBean.setStGender("");
            stBean.setStAddress("");
            stBean.setStMemo("");
            stBean.setStEnroll("");
            stBean.setStFee(0);
            stBean.setStFeeChange(0);
            stBean.setStEnroll("0");
        
        }else{
                // update student
                
                int id = Integer.parseInt(Id);
                stBean.setStId(id);
                stBean = stCtrl.retireveStudent(stBean);
	        System.out.println("idid : " + Id);
	        enroll_day = stBean.getStEnroll();
	        enroll_day = enroll_day.substring(enroll_day.length()-2, enroll_day.length());
	        if(enroll_day.charAt(0) == '0' && enroll_day.length() == 2) {
	        	enroll_day = stBean.getStEnroll().substring(stBean.getStEnroll().length()-2, stBean.getStEnroll().length());
	        	enroll_day = enroll_day.substring(1,2);
	        }
	        System.out.println("enroll_day : " + enroll_day);
	        System.out.println("enroll : " + stBean.getStEnroll());
        }
        
        
        %>
        <br>
        <br>
            <form action="stAddCheck.jsp">
            <center>
            <table border="1" width="800" height="200">
            <tr>
                <td>
                이름
                </td>
                <td>
                   <input type="text" name="name" value="<%= stBean.getStName() %>" required/>
                </td>
            </tr>
            
            <tr>
                <td>
                전화번호
                </td>
                <td>
                    <input type="text" name="phone" value="<%= stBean.getStPhone() %>" required/>
                </td>
            </tr>
            
            <tr>
                <td>
                학부모 전화번호
                </td>
                <td>
                    <input type="text" name="parents" value="<%= stBean.getStParents() %>" required/>
                </td>
            </tr>
            
            <tr>
                <td>
                학교
                </td>
                <td>
                    <input type="text" name="school" value="<%= stBean.getStSchool() %>" required/>
                </td>
            </tr>
            
            <tr>
                <td>
                생년월일
                </td>
                <td>
                <%if(Id == null || Id == "") {%>
                    <input type="date" name="date" required/> 
                <%} else {%>
                    <input type="date" name="date" value="<%= stBean.getStDate() %>" required/> 
                <%} %>
                </td>
            </tr>
            
            <tr>
                <td>
                등록일
                </td>
                <td>
                <% if(stBean.getStEnroll() == null || stBean.getStEnroll() == "" || stBean.getStEnroll() == "0")   {%>
                    <input type="date" name="enroll"/ required>
                <%} else    {%>
                    <input type="date" name="enroll" value="<%=stBean.getStEnroll() %>" required/>
                <%} %>
                </td>
            </tr>
           
           <tr>
                <td>
                납부변경일
                </td>
                <td>
                <%if(stBean.getStEnroll().equals(0) || stBean.getStEnroll() == "0") {%>
                	 <select name="changeDate">
                     <option value="0">변경없음</option>
                     <%for(int k = 1; k < 32; k++)   {%>
                         <option value="<%=k %>"><%=k %>일</option>
                     <%} %>
                 </select>
                
                <%} else if(stBean.getStFeeChange() == 0) {%>
                <select name="changeDate">
                    <option value="0">변경없음</option>
                    <%for(int k = 1; k < 32; k++)   {
                        if(k == Integer.valueOf(enroll_day))    {
                            continue;
                        }%>
                        <option value="<%=k %>"><%=k %>일</option>
                    <%} %>
                </select>
                <%} else {%>
                   <select name = "changeDate" >
                       <option value="0">변경없음</option>
                       <%for(int l = 1; l < 32; l++)    {
                    	   if(l == Integer.valueOf(enroll_day))    {
                    		   continue;
                    	   }
                            if(l == Integer.valueOf(stBean.getStFeeChange()))    {%>
                                <option value="<%=l %>" selected><%=l %>일</option>
                            <%} else {%>
                                <option value="<%=l %>"><%=l %>일</option>
                            <%} %>
                       <%} %>
                   </select>
                <%} %>
                </td>
           </tr>
            
            <tr>
                <td>
                수강료
                </td>
                <td>
                    <input type="text" name="fee" value="<%=stBean.getStFee() %>" required/>
                </td>
            </tr>
            
            <tr>
                <td>
                담당교사
                </td>
                <td>
                <%if(stBean.getTcId() != null) {%> 
                <select id="teacher" name="teacher" value="teacher">
                    <%for(int i = 0; i < tcBean.size(); i++) {
                        String teacherName = tcBean.get(i).getName();
                        String teacherId = tcBean.get(i).getId();
                        if(stBean.getTcId().equals(teacherId)) {%>
                            <option name="teacher" value="<%=teacherId%>" selected><%=teacherName %></option>
                        <%} else    {%>
                            <option name="teacher" value="<%=teacherId %>"><%=teacherName %></option>
                        <%}%>
                        
                    <%    
                    }
                    %>
                    </select> 
                   <% } else {
                   System.out.println("!");%>   
                   <select id="teacher" name="teacher" value="teacher">
                    <%for(int k = 0; k < tcBean.size(); k++)    {
                        String teacherName = tcBean.get(k).getName();
                        String teacherId = tcBean.get(k).getId();%>
                        <option name="teacher" value="<%=teacherId %>"><%=teacherName %></option>
                       
                    <%} %>
                    </select>
                   <% }%>
                
                </td>
            </tr>
            
            <tr>
                <td>
                주소
                </td>
                <td>
                    <input type="text" name="address" value="<%= stBean.getStAddress() %>" style="width:500px;height:50px" required/>
                </td>
            </tr>
            
            <tr>
                <td>
                성별
                </td>
                <td>
                <%if(Id == null || Id == "" || stBean.getStGender() == null || stBean.getStGender() == "") {%>
                    남자 <input type="radio" name="gender" value="남자" /> 
                    여자 <input type="radio" name="gender" value="여자" />
                <%} else {
                    if(stBean.getStGender().equals("남자")) {%>
                        남자 <input type="radio" name="gender" value="남자" checked/>
                        여자 <input type="radio" name="gender" value="여자" />
                    <%} else if(stBean.getStGender().equals("여자")) {%>
                        남자 <input type="radio" name="gender" value="남자" />
                        여자 <input type="radio" name="gender" value="여자" checked/>
                    <%} %> 
                <%} %>
                </td>
            </tr>
            
            <tr>
                <td>
                요일
                </td>
                <td>
                <%if(signBean.size() > 0)   {%>
                    <%if(signBean.get(0).getMonday().equals("1")) {%>
	                   월 <input type="checkbox" id="monday" name="day" value="monday" checked/>&nbsp;
	                <%} else   { %>
	                   월 <input type="checkbox" id="monday" name="day" value="monday" />&nbsp;
	                <%} %>
	                <%if(signBean.get(0).getTuesday().equals("1")) {%>
                       화 <input type="checkbox" id="tuseday" name="day" value="tuesday" checked/>&nbsp;
                    <%} else  { %>
                       화 <input type="checkbox" id="tuseday" name="day" value="tuesday" />&nbsp;
                    <%} %>
                    <%if(signBean.get(0).getWednesday().equals("1")) {%>
                       수 <input type="checkbox" id="wednesday" name="day" value="wednesday" checked/>&nbsp;
                    <%} else   { %>
                       수 <input type="checkbox" id="wednesday" name="day" value="wednesday" />&nbsp;
                    <%} %>
	                <%if(signBean.get(0).getThursday().equals("1")) {%>
                       목 <input type="checkbox" id="thursday" name="day" value="thursday" checked/>&nbsp;
                    <%} else   { %>
                       목 <input type="checkbox" id="thursday" name="day" value="thursday" />&nbsp;
                    <%} %>
	                <%if(signBean.get(0).getFriday().equals("1")) {%>
                       금 <input type="checkbox" id="friday" name="day" value="friday" checked/>&nbsp;
                    <%} else   { %>
                       금 <input type="checkbox" id="friday" name="day" value="friday" />&nbsp;
                    <%} %>
	                
	                
                <%} else {%>
                    월 <input type="checkbox" id="monday" name="day" value="monday" />&nbsp;
	                화 <input type="checkbox" id="tuseday" name="day" value="tuesday" />&nbsp;
	                수 <input type="checkbox" id="wednesday" name="day" value="wednesday" />&nbsp;
	                목 <input type="checkbox" id="thursday" name="day" value="thursday" />&nbsp;
	                금 <input type="checkbox" id="friday" name="day" value="friday" />&nbsp;
                <%} %>
                </td>
            </tr>
            
            <tr>
                <td>
                과목
                </td>
                <td>
                <%
                //crsList에 sign DB에 저장된 st_id의 과목들을 저장시킨다. 
                List<String> crsList = new ArrayList<String>();
                for(int l = 0; l < signBean.size(); l++)    {
                	crsList.add(signBean.get(l).getCrs_id());
                }
                System.out.println("listlist : " + crsList);
                for(int j = 0; j < crsBean.size(); j++) {
                	String crsName = crsBean.get(j).getCrsName();
                	int crsId = crsBean.get(j).getCrsId();
                	if(crsList.contains(Integer.toString(crsId)))    {
                	   System.out.println("correct");%> 
                        <%=crsName%> <input type="checkbox" name="course" value="<%=crsId%>" checked/>&nbsp;
                    <%} else { %>
                        <%=crsName%> <input type="checkbox" name="course" value="<%=crsId%>" />&nbsp;
                    <%} %>
               	<%
	                if(j % 4 == 0 && j != 0)  {
	                    out.print("<br>");
	                }
               	}
                %>
                </td>
            </tr>
            
            <tr>
                <td>
                메모
                </td>
                <td>
                 <input type="text" name="memo" value="<%= stBean.getStMemo() %>" style="width:500px;height:50px;" />
                </td>
            </tr>
                 
                <input type="hidden" name="id" value="<%= stBean.getStId() %>"/>
                
                </table>    
                <br>    
                <input type="button" value="취소" onclick="location.href='stRetrieve.jsp'"/>
                <input type="submit" value="저장"/>
                </center>
            </form>
        
        
    </body>
</html>