package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.MonthBean;
import db.mysql.MySQL;

public class MonthService {
	public static ArrayList<MonthBean> p_getMonth(){
		ArrayList<MonthBean> al = new ArrayList<MonthBean>();
		try{
			MonthBean mb =null;
			
			String sql = "SELECT * FROM t_month ";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			   
			while(rs.next()){
				 mb =new  MonthBean();
				mb.setId(rs.getInt("month_id"));
				mb.setMonth_name(rs.getString("month_name"));
				al.add(mb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	
}
