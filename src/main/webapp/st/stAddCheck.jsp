<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.eugene.st.item.StudentItem" %>
    <%@ page import="com.eugene.st.ctrl.StudentCtrl" %>
    <%@ page import="com.eugene.sign.item.SignItem" %>
    <%@ page import="com.eugene.sign.ctrl.SignCtrl" %>
    <%@ include file="../include/sessionCheck.inc" %>
    <%@ page import="java.util.Calendar" %>
    <%@ page import= "java.time.LocalDate" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student add check</title>
    </head>
    <body>
        <%
        Calendar cal = Calendar.getInstance();
        LocalDate today = LocalDate.now();
        int todayYear = today.getYear();
        int todayMonth = today.getMonthValue();
        int todayDay = today.getDayOfMonth();
        String now = String.valueOf(todayYear) + "-" + String.valueOf(todayMonth) + "-" + String.valueOf(todayDay);
        System.out.println("today : " + now);
        
        SignItem sign = new SignItem();
        SignCtrl signCtrl = new SignCtrl();
        
        StudentItem student = new StudentItem();
        StudentCtrl stCtrl = new StudentCtrl();
        
        
	        request.setCharacterEncoding("utf-8");
	        String id = request.getParameter("id");
	        System.out.println("String id : " + id);
	        /*if(id.equals("0")) {
	        	id = Integer.toString(stCtrl.maxStId()+1);
	        }*/
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String parents = request.getParameter("parents");
            String school = request.getParameter("school");
            String date = request.getParameter("date");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String memo = request.getParameter("memo");
            String enroll = request.getParameter("enroll");
            //stAdd.jsp에서 내가 선택한 과목, 요일
            String[] course = request.getParameterValues("course");
            String[] day = request.getParameterValues("day");
            String fee = request.getParameter("fee");
            String tcId = request.getParameter("teacher");
            String changeDate = request.getParameter("changeDate");
            if(changeDate == "" || changeDate == null)  {
            	changeDate = "0";
            }
            System.out.println("--------------------------------");
            System.out.print("날짜 : ");
            for(int i = 0; i < day.length; i++)  {
            	System.out.print(day[i] + " ");
            }
            System.out.println();
            System.out.println("ididid : " + id);
            System.out.println("feeChange : " + changeDate);
            
            student.setStName(name);
            student.setStPhone(phone);
            student.setStParents(parents);
            student.setStSchool(school);
            student.setStDate(date);
            student.setStGender(gender);
            student.setStAddress(address);
            student.setStMemo(memo);
            student.setStEnroll(enroll);
            student.setStFee(Integer.parseInt(fee));
            student.setTcId(tcId);
            
            student.setStFeeChange(Integer.valueOf(changeDate));
            
            int update = -1;
            if(id == null || id.equals("0")){
            	System.out.println("!!");
                update = stCtrl.insertStudent(student);
            }else{
            	System.out.println("@@");
                int success = -1;
                int Id = Integer.parseInt(id);
                
                student.setStId(Id);
                success = stCtrl.updateStudent(student);
            }
            
            System.out.println("id : " + id);
            System.out.println("enroll : " + enroll);
            
            System.out.println("maxStId() : " + stCtrl.maxStId());
            
            //insert error check
            if(update != 1){
                System.out.println("error! update is " + update);
                %>
                <script type="text/javascript">
                alert("추가 오류!");
                location.href="stAdd.jsp?phone="<%=phone%>;
                </script>
                <%
            }
            
            
            if(id.equals("0"))  {
            	id = Integer.toString(stCtrl.maxStId());
            } 
            
            List<SignItem> signList = new ArrayList<SignItem>(); 
            sign.setSt_id(id);
            sign.setTc_id(tcId);
            
            //stAdd.jsp에서 선택한 요일 값들을 리스트로 변환한 후 signItem에 설정.
            List<String> weekday = new ArrayList<String>(Arrays.asList(day));
            if(weekday.contains("monday"))   {
                sign.setMonday("1");
            } else  {
                sign.setMonday("0");
            }
            if(weekday.contains("tuesday")) {
                sign.setTuesday("1");
            } else  {
                sign.setTuesday("0");
            }
            if(weekday.contains("wednesday"))   {
                sign.setWednesday("1");
            } else  {
                sign.setWednesday("0");
            }
            if(weekday.contains("thursday"))    {
                sign.setThursday("1");
            } else  {
                sign.setThursday("0");
            }
            if(weekday.contains("friday"))  {
                sign.setFriday("1");
            } else{
                sign.setFriday("0");
            }
            
            String a = sign.getSt_id();
            System.out.println("a : " + a);
            signList = signCtrl.selectCrs(sign);
            
            // 수강중이던 과목들을 리스트로 만든다.
            List<String> signCrs = new ArrayList<String>();
            for(int i = 0; i < signList.size(); i++)    {
                signCrs.add(signList.get(i).getCrs_id());
            }
            // stDetail.jsp 화면에서 체크한 과목들을 리스트로 만든다.
            List<String> jspCrs = new ArrayList<String>(Arrays.asList(course));
            
            
            System.out.println("id가 수강 중 이던 과목들 : " + signCrs);
            System.out.println("id가 수강 선택한 과목들 : " + jspCrs);
            
            System.out.println("signList.size() : " + signList.size());
            
            
            //sign DB에 st_id = st_id and sign_out is null인 값이 하나라도 있는 경우
            if(signList.size() > 0) {
                // 기존에 듣던 과목을 계속해서 듣는 경우 따라서 업데이트만 하고 삭제하지 않는다.
                // signCrs, jspCrs에서 삭제
                // signCrs와 jspCrs에 공통으로 있는 값, 즉 그대로 듣는 과목은 st_id, sign_in를 제외한 나머지들은 업데이트 될 수 있다.
                List<String> tempList = new ArrayList<String>();
                for(int i = 0; i < signCrs.size(); i++) {
                    if(jspCrs.contains(signCrs.get(i)))    {
                        tempList.add(signCrs.get(i));
                    }
                }
                
                for(int l = 0; l < tempList.size(); l++)  {
                    sign.setTc_id(tcId);
                    sign.setSt_id(id);
                    sign.setCrs_id(tempList.get(l));
                    signCtrl.sameCrsUpdate(sign);
                    String temp = tempList.get(l);
                    signCrs.remove(signCrs.indexOf(temp));
                    jspCrs.remove(jspCrs.indexOf(temp));
                }
                System.out.println("update후의 signCrs리스트 : " + signCrs);
                System.out.println("update후의 jspCrs리스트 : " + jspCrs);   
             
                // 위의 반복문을 통해 기존에 계속 듣는 과목은 처리하였다.
                // 이제 jspCrs에 남은 과목은 새로 insert, signCrs에 남은 과목은 sign_out에 오늘 날짜를 추가하여 그만 수강하는 것으로 처리
                if(signCrs.size() > 0)  {
                    for(int j = 0; j < signCrs.size(); j++) {
                        sign.setTc_id(tcId);
                        sign.setSt_id(id);
                        sign.setCrs_id(signCrs.get(j));
                        sign.setSignOut(now);
                        signCtrl.signOutUpdate(sign);
                    }
                }
                
                if(jspCrs.size() > 0)   {
                    sign.setTc_id(tcId);
                    sign.setSt_id(id);
                    sign.setSignIn(now);
                    for(int k = 0; k < jspCrs.size(); k++) {
                        sign.setCrs_id(jspCrs.get(k));
                        signCtrl.insertCrs(sign);
                    }
                }
                
            }
            else    {
                //sign DB에 아예 정보가 없는 상황
                //바로 값 추가해도 된다.
                //위에서 st_id, tc_id, 요일 모두 item에 설정했다.
                //stDetail에서 과목을 선택한 개수만큼 반복문을 진행하며, 그때마다 item에 과목을 설정하고 update를 반복
                for(int i = 0; i < course.length; i++) {
                    System.out.println("⌜-------------------------⌝");
                    sign.setCrs_id(course[i]);
                    sign.setSignIn(now);
                    System.out.println("sign DB에 " + a + "의 값이 없다.");
                    System.out.println("st_id : " + sign.getSt_id());
                    System.out.println("tc_id : " + sign.getTc_id());
                    System.out.println("crs_id : " + sign.getCrs_id());
                    System.out.println("월요일 : " + sign.getMonday());
                    System.out.println("화요일 : " + sign.getTuesday());
                    System.out.println("수요일 : " + sign.getWednesday());
                    System.out.println("목요일 : " + sign.getThursday());
                    System.out.println("금요일 : " + sign.getFriday());
                    System.out.println("오늘 날짜 : " + sign.getSignIn());
                    System.out.println("⌞-------------------------⌟");
                    int success = signCtrl.insertCrs(sign);
                    if(success > 0)   {
                        System.out.println("값 추가 성공");
                    }
                    else{
                        System.out.println("값 추가 실패");
                    }
                }
            }
            
            
            response.sendRedirect("stRetrieve.jsp");
        %>
    </body>
</html>