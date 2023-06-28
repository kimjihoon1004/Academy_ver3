package com.eugene.st.ctrl;

import com.eugene.common.db.SqlSessionCtrl;
import com.eugene.st.item.StudentItem;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class StudentCtrl extends SqlSessionCtrl{

	public List<StudentItem> retrieveStudentList() {
		List<StudentItem> stBean = new ArrayList<StudentItem>();
		
		try(SqlSession session = sqlSessionFactory.openSession()){
			stBean = session.selectList("StudentInfor.retrieveStudentList");
		}
		
		return stBean;
	}
	
	public List<StudentItem> PartialRetrieveStudentList(String stName) {
		List<StudentItem> stBean = new ArrayList<StudentItem>();
		
		try(SqlSession session = sqlSessionFactory.openSession()){
			stBean = session.selectList("StudentInfor.PartialRetrieveStudentList", stName);
		}
		
		return stBean;
	}
	
	public StudentItem retireveStudent(StudentItem stBean) {
		StudentItem st = new StudentItem();
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			st = session.selectOne("retrieveStudent", stBean);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		
		return st;
	}

	public int maxStId() {
		int temp = 0;
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			temp = session.selectOne("maxStId");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		
		return temp;
	}

	
	public String selectStudent(String stId)	{
		String temp = "";
		try(SqlSession session = sqlSessionFactory.openSession())	{
			temp = session.selectOne("StudentInfor.selectStudent", stId);
		}
		return temp;
	}
	
	public String selectStudentSchool(String stId)	{
		String temp = "";
		try(SqlSession session = sqlSessionFactory.openSession())	{
			temp = session.selectOne("StudentInfor.selectStudentSchool", stId);
		}
		return temp;
	}
	
	public int insertStudent(StudentItem stBean) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.insert("StudentInfor.insertStudent",stBean);
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public int deleteStudent(StudentItem stBean) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.update("StudentInfor.deleteStudent",stBean);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	
	public int updateStudent(StudentItem stBean) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.update("StudentInfor.updateStudent",stBean);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	
}