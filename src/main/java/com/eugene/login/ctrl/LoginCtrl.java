package com.eugene.login.ctrl;

import com.eugene.common.db.SqlSessionCtrl;
import com.eugene.login.item.LoginItem;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class LoginCtrl extends SqlSessionCtrl{
	
	public String loginTc(String loginMail)	{
		String temp = null;
		SqlSession session = null;
		try{
			session = sqlSessionFactory.openSession();
			temp = session.selectOne("test.loginTc", loginMail);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return temp;
	}
	
	public int isSu(String id)	{
		int su = -1;
		SqlSession session = null;
		try{
			session = sqlSessionFactory.openSession();
			su = session.selectOne("test.isSu", id);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return su;
	}
	
	public int updateLogin(LoginItem loginItem)	{
		int success = -1;
		SqlSession session = null;
		try{
			session = sqlSessionFactory.openSession();
			success = session.update("test.updateLogin", loginItem);	
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	
	public String findName(String loginMail)	{
		String temp = null;
		SqlSession session = null;
		try{
			session = sqlSessionFactory.openSession();
			temp = session.selectOne("test.findName", loginMail);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return temp;
	}
	
	public List<String> selectAllTc()	{
		List<String> temp = null;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			temp = session.selectList("test.selectAllTc");
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return temp;
	}
	
	public String findID(LoginItem loginItem) {
		String temp = null;
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			temp = session.selectOne("test.findID", loginItem);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return temp;
	}
	
	public String findPW(LoginItem loginItem) {
		String temp = null;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			temp = session.selectOne("test.findPW", loginItem);	
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		
		return temp;
	}
	
	public int updateTc(LoginItem loginItem)	{
		int success = -1;
		SqlSession session = null;
		try{
			session = sqlSessionFactory.openSession();
			success = session.update("test.updateTc", loginItem);	
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public List<String> selectAllMail()	{
		List<String> temp = null;
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			temp = session.selectList("test.selectAllMail");
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		
		return temp;
		
	}
	
	public LoginItem selectTc(String loginMail) {
		LoginItem temp = new LoginItem();
		SqlSession session = null;
		try{
			session = sqlSessionFactory.openSession();
			temp = session.selectOne("test.selectTc", loginMail);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return temp;
	}
	
	public int insertUser(LoginItem loginItem)	{
		int success = -1;
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			success = session.insert("test.insertUser", loginItem);	
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public int updatePw(LoginItem loginItem)	{
		int success = -1;
		SqlSession session = null;
		try{
			session = sqlSessionFactory.openSession();
			success = session.update("test.updatePw", loginItem);	
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
}
