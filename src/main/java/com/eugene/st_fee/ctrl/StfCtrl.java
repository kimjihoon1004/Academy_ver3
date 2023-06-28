package com.eugene.st_fee.ctrl;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.eugene.common.db.SqlSessionCtrl;
import com.eugene.st.item.StudentItem;
import com.eugene.st_fee.item.StfItem;
import com.eugene.tc.item.TeacherItem;

public class StfCtrl extends SqlSessionCtrl{
	public List<StfItem> retrieveStFee(StfItem stfItem)	{
		List<StfItem> stfBean = new ArrayList<StfItem>();
		
		try(SqlSession session = sqlSessionFactory.openSession()){
			stfBean = session.selectList("StfSql.retrieveStFee", stfItem);
		}
		
		return stfBean;
	}
	
	public String sumFee(StfItem stfItem)	{
		String temp = "";
		
		try(SqlSession session = sqlSessionFactory.openSession()){
			temp = session.selectOne("StfSql.sumFee", stfItem);
		}
		
		return temp;
	}
	
	public int StFeeInsert(StfItem stfItem) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.insert("StfSql.StFeeInsert", stfItem);
			
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
	
	public int PrePay(StfItem stfItem) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.insert("StfSql.PrePay", stfItem);
			
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
	
	public int StFeeUpdate(StfItem stfItem) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.update("StfSql.StFeeUpdate",stfItem);
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
	
	public int StFeeDelete(StfItem stfItem) {
		int success = -1;
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			success = session.delete("StfSql.StFeeDelete", stfItem);
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
