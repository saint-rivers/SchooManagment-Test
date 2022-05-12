package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bean.ClassScheduleBean;
import bean.DayBean;
import db.mysql.MySQL;

public class DayService {
	public static ArrayList<DayBean> getListDays(){
		ArrayList<DayBean> al = new ArrayList<DayBean>();
		try{
			String sql = "SELECT * FROM tblday";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				DayBean db = new DayBean();
				db.setDay_id(rs.getInt("day_id"));
				db.setDay_name(rs.getString("day_name"));
				al.add(db);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	//======== Insert ClassSchedule ==========
	   public static String insertClassSchedule(ArrayList<ClassScheduleBean> list){
		   String msg ="";
		   try{
		   		for(int i=0;i<list.size();i++){
		   			String sql = "INSERT INTO tblclass_schedule VALUES(?,?)";
		   			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
		   			ClassScheduleBean csb = (ClassScheduleBean) list.get(i);
		   			ps.setString(1, csb.getClass_id());
		   			ps.setInt(2, csb.getDay_id());
		   			int state = ps.executeUpdate();
		   			if(state > 0){
		   				msg = "Success";
		   			}
		   		}
		   }catch(Exception e){
			   msg = "Error";
			   System.out.println("DayService::insertClassSchedule => " + e.toString());
		   }finally{
			   MySQL.P_getClose();
		   }
		   return msg;
	   }
	   
	   //========get day by class id =======
	   public static ArrayList<DayBean> getDaysByClassID(String id){
			ArrayList<DayBean> al = new ArrayList<DayBean>();
			try{
				String sql = "SELECT DISTINCT(d.day_name) AS DayName,d.day_id FROM tblschedule s INNER JOIN tblday d ON d.day_id = s.day_id WHERE s.class_id = ?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					DayBean db = new DayBean();
					db.setDay_id(rs.getInt("day_id"));
					db.setDay_name(rs.getString("DayName"));
					al.add(db);
				}
			}catch(Exception e){
				System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return al;
		}
}
