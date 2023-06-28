package com.eugene.tc_attend.ctrl;

import com.eugene.common.db.*;
import com.eugene.tc_attend.item.TcAttendItem;

import java.util.List;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;


public class TcAttendCtrl extends SqlSessionCtrl{
	
	public List<TcAttendItem> attendRetrieveList(String name){
		List<TcAttendItem> attendList = new ArrayList<>();
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			
			attendList = session.selectList("tcAttend.retrieveAttendList", name);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return attendList;
	}
	
	public TcAttendItem attendRetrieve(int Id) {
		TcAttendItem item = new TcAttendItem();
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			
			item = session.selectOne("tcAttend.retrieveAttend", Id);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return item;
	}
	
	public int AttendIn(TcAttendItem item) {
		int success = -1;
		
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			
			success = session.insert("tcAttend.AttendIn", item);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public int AttendOut(TcAttendItem item) {
		int success = -1;
		
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			
			success = session.update("tcAttend.AttendOut", item);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public int AttendOff(TcAttendItem item) {
		int success = -1;
		
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			
			success = session.insert("tcAttend.AttendOff", item);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public int AttendUpdate(TcAttendItem item) {
		int success = -1;
		
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			
			success = session.update("tcAttend.AttendUpdate", item);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public int AttendDelete(int Id) {
		int success = -1;
		
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			
			success = session.delete("tcAttend.AttendDelete", Id);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			session.commit();
			session.close();
		}
		return success;
	}
}