package com.eugene.st_attend.ctrl;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.eugene.common.db.SqlSessionCtrl;
import com.eugene.st_attend.item.StaItem;

public class StaCtrl extends SqlSessionCtrl{
	
	public int studentAttend(StaItem staItem)	{
		int success = -1;
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			success = session.insert("StaSql.studentAttend", staItem);	
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public int studentAasent(StaItem staItem)	{
		int success = -1;
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			success = session.insert("StaSql.studentAbsent", staItem);	
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public List<StaItem> checkAttend(String date)	{
		List<StaItem> staList = new ArrayList<StaItem>();
		
		try(SqlSession session = sqlSessionFactory.openSession())	{
			staList = session.selectList("StaSql.checkAttend", date);
		}
		
		return staList;
	}
	
	public List<StaItem> retrieveDate(StaItem staItem)	{
		List<StaItem> staList = new ArrayList<StaItem>();
		
		try(SqlSession session = sqlSessionFactory.openSession())	{
			staList = session.selectList("StaSql.retrieveDate", staItem);
		}
		
		return staList;
	}
	
	public int studentGoHome(StaItem staItem)	{
		int success = -1;
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			success = session.update("StaSql.studentGoHome", staItem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public String selectAttendId(StaItem staItem)	{
		String id = "";
		
		try(SqlSession session = sqlSessionFactory.openSession())	{
			id = session.selectOne("StaSql.selectAttendId", staItem);
		}
		
		return id;
	}
	
	public int updateIn(StaItem staItem)	{
		int success = -1;
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			success = session.update("StaSql.updateIn", staItem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public int updateMemo(StaItem staItem)	{
		int success = -1;
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			success = session.update("StaSql.updateMemo", staItem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success; 
	}

	public int supplement(StaItem staItem)	{
		int success = -1;
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			success = session.update("StaSql.supplement", staItem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public int updateAttend(StaItem staItem)	{
		int success = -1;
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			success = session.update("StaSql.updateAttend", staItem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public List<StaItem> retrieveAttend(String date)	{
		List<StaItem> staList = new ArrayList<StaItem>();
		
		try(SqlSession session = sqlSessionFactory.openSession())	{
			staList = session.selectList("StaSql.retrieveAttend", date);
		}
		
		return staList;
	}
	
	public List<StaItem> retrieve(StaItem staItem)	{
		List<StaItem> staList = new ArrayList<StaItem>();
		
		try(SqlSession session = sqlSessionFactory.openSession())	{
			staList = session.selectList("StaSql.retrieve", staItem);
		}
		
		return staList;
	}
	
	public List<StaItem> retrieveAbsent(String date)	{
		List<StaItem> staList = new ArrayList<StaItem>();
		
		try(SqlSession session = sqlSessionFactory.openSession())	{
			staList = session.selectList("StaSql.retrieveAbsent", date);
		}
		
		return staList;
	}
	
	public List<String> findAbsent(String id)	{
		List<String> temp = new ArrayList<String>();
		
		try(SqlSession session = sqlSessionFactory.openSession())	{
			temp = session.selectList("StaSql.findAbsent", id);
		}
		
		return temp;
	}
	
	public int deleteAbsent(StaItem staItem)	{
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.delete("StaSql.deleteAbsent", staItem);
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
	
	public int deleteAttend(StaItem staItem)	{
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.delete("StaSql.deleteAttend", staItem);
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
	
	public int countAbsent(int id)	{
		int temp = 0;
		
		try(SqlSession session = sqlSessionFactory.openSession())	{
			temp = session.selectOne("StaSql.countAbsent", id);
		}
		
		return temp;
	}
	
}
