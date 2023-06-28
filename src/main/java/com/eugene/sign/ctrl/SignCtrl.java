package com.eugene.sign.ctrl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eugene.common.db.SqlSessionCtrl;
import com.eugene.sign.item.SignItem;

public class SignCtrl extends SqlSessionCtrl{
	public List<SignItem> selectCrs(SignItem signItem)	{
		List<SignItem> signList = new ArrayList<SignItem>();
		
		try(SqlSession session = sqlSessionFactory.openSession())	{
			signList = session.selectList("SignMap.selectCrs", signItem);
		}
		
		return signList;
	}
	
	public int insertCrs(SignItem signItem)	{
		int success = -1;
		SqlSession session = null;
		try{
			session = sqlSessionFactory.openSession();
			success = session.insert("SignMap.insertCrs", signItem);
		}catch(Exception e)	{
			e.printStackTrace();
		}
		finally	{
			session.commit();
			session.close();
		}
		
		return success;
	}
	
	public int sameCrsUpdate(SignItem signItem)	{
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.insert("SignMap.sameCrsUpdate",signItem);
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
	
	public int signOutUpdate(SignItem signItem)	{
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.insert("SignMap.signOutUpdate",signItem);
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
}
