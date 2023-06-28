package com.eugene.crs.ctrl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eugene.common.db.SqlSessionCtrl;
import com.eugene.crs.item.CrsItem;

public class CrsCtrl extends SqlSessionCtrl{
	
	  public List<CrsItem> searchName(CrsItem csItem) {
		    List<CrsItem> crsItem = new ArrayList<CrsItem>();
		    SqlSession session = null;
		    
		    try {
		      session = sqlSessionFactory.openSession();
		      crsItem = session.selectList("CrsInfor.retrieveCheck", csItem);
		    }catch(Exception e){
		      e.printStackTrace();
		    }
		    finally {
		      session.close();
		    }
		    return crsItem;
		  }
	  
	  public List<CrsItem> retrieveCrsList() {
			List<CrsItem> crsItem = new ArrayList<CrsItem>();
			SqlSession session = null;
			
			try {
				session = sqlSessionFactory.openSession();
				crsItem = session.selectList("CrsInfor.retrieveCrsList");
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				session.close();
			}
			return crsItem;
		}
	  
	  public List<CrsItem> retrieveCrsName()	{
			List<CrsItem> crsBean = new ArrayList<CrsItem>();
			
			try(SqlSession session = sqlSessionFactory.openSession())	{
				crsBean = session.selectList("CrsInfor.retrieveCrsName");
			}
			return crsBean;
		}
	  
	  
	public CrsItem retrieveCrs(int x) {
		CrsItem crsItem = new CrsItem();
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			crsItem = session.selectOne("CrsInfor.retrieveCrs",x);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return crsItem;
	}
	
	
	public int insertCrs(CrsItem crsItem) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.insert("CrsInfor.insertCrs",crsItem);
			//System.out.println("\n insert " + crsItem.getCrsName() + " success " + success + "\n");
			
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
	
	
	
	public int updateCrs(CrsItem crsItem) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.insert("CrsInfor.updateCrs",crsItem);
			//System.out.println("\n insert " + crsItem.getCrsName() + " success " + success + "\n");
			
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