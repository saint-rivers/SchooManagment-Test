package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.TeacherBean;
import bean.TeacherClassBean;
import db.mysql.MySQL;

public class TeacherClassService {
	//=================================== Insert Multi Row of TeacherClass ============================
	   public static String addTeacherClass(ArrayList<TeacherClassBean> list){
		   String msg ="";
		   try{			   
		   		for(int i=0;i<list.size();i++){
		   			String sql = "INSERT INTO t_teacher_class VALUES(?,?)";
		   			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
		   			TeacherClassBean tcb = (TeacherClassBean) list.get(i);
		   			ps.setString(1, tcb.getClass_id());
		   			ps.setString(2, tcb.getTeacher_id());
		   			
		   			int state = ps.executeUpdate();
		   			if(state > 0){
		   				msg = "Success";
		   			}
		   		}
		   }catch(Exception e){
			   msg = "Error";
			   System.out.println("TeacherClassService::addTeacherClass() => " + e.toString());
		   }finally{
			   MySQL.P_getClose();
		   }
		   return msg;
	   }
	   
	   //================= list Teachers by Class id ================
	   public static ArrayList<TeacherBean> getTeacherByClassID(String id){
			ArrayList<TeacherBean> al = new ArrayList<TeacherBean>();
			try{
				String sql = "SELECT t.*,tc.* FROM t_teacher t INNER JOIN t_teacher_class tc ON t.teacher_id = tc.teacher_id WHERE tc.class_id = ?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					TeacherBean tb = new TeacherBean();
					tb.setT_id(rs.getString("teacher_id"));
					tb.setT_fname(rs.getString("first_name"));
					tb.setT_lname(rs.getString("last_name"));
					tb.setT_gender(rs.getString("gender"));
					tb.setT_phone(rs.getString("phone"));
					tb.setT_photo(rs.getString("photo"));					
					
					al.add(tb);
				}
			}catch(Exception e){
				System.out.println("TeacherClassService::getTeacherByClassID() => " + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return al;
		}
}
