package com.eugene.tc.ctrl;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eugene.common.db.SqlSessionCtrl;
import com.eugene.tc.item.TeacherItem;

import java.util.ArrayList;

public class TeacherCheckControl extends SqlSessionCtrl {
	
	public List<TeacherItem> searchName(TeacherItem teacheritem) {
		List<TeacherItem> teacherItems = new ArrayList<TeacherItem>();
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			teacherItems = session.selectList("Testt.retrieveCheck", teacheritem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return teacherItems;
	}
	
	public TeacherItem teacherInformation(TeacherItem teacheritem) {
		TeacherItem teacherItems = new TeacherItem();
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			teacherItems = session.selectOne("Testt.teacherInformation", teacheritem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return teacherItems;
	}
	
	public int teacherDelete(TeacherItem teacheritem) {
		int success = -1;
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			success = session.delete("Testt.teacherDelete", teacheritem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public TeacherItem teacherUpdate(TeacherItem teacheritem) {
		TeacherItem teacherItems = new TeacherItem();
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			teacherItems = session.selectOne("Testt.teacherUpdate", teacheritem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return teacherItems;
	}
	
	public TeacherCheckControl()
	{
		System.out.println("success");
	}
	
	public List <TeacherItem> retrieveCheck(List<TeacherItem> teacherItem)
	{
		List<TeacherItem> Item = new ArrayList<TeacherItem>();
		
		try(SqlSession session = sqlSessionFactory.openSession()){
			Item = session.selectList("Testt.retrieveCheck");
			  }
		return Item;
	}
	
	public int retrieveMember(TeacherItem teacherItem)
	{
		// StudentBean Bean = new StudentBean();
		int result;
		
		try(SqlSession session = sqlSessionFactory.openSession()){
			result = session.insert("Testt.retrieveCheck", teacherItem);
			  }
		return result;
	}
	
	public List<TeacherItem> retrieveTeacher()	{
		List<TeacherItem> temp = new ArrayList<TeacherItem>();
		
		try(SqlSession session = sqlSessionFactory.openSession())	{
			temp = session.selectList("Testt.retrieveTeacher");
		}
		
		return temp;
	}

}
