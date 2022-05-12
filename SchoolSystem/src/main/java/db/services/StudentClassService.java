package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.StudentBean;
import bean.StudentClassBean;
import db.mysql.MySQL;

public class StudentClassService {
	   //=========== Insert Multi Rows of Student into Class ===============
	   public static String addStudentClass(ArrayList<StudentClassBean> list){
		   String msg ="";
		   try{			   
		   		for(int i=0;i<list.size();i++){
		   			String sql = "INSERT INTO t_student_class VALUES(?,?)";
		   			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
		   			StudentClassBean scb = (StudentClassBean) list.get(i);
		   			ps.setString(1, scb.getClass_id());
		   			ps.setString(2, scb.getStudent_id());
		   			
		   			int state = ps.executeUpdate();
		   			if(state > 0){
		   				msg = "Success";
		   			}
		   		}
		   }catch(Exception e){
			   msg = "Error";
			   System.out.println("StudentClassService::addStudentClass() => " + e.toString());
		   }finally{
			   MySQL.P_getClose();
		   }
		   return msg;
	   }
	   
	   //================= list Students by Class id ================
	   public static ArrayList<StudentBean> getStudentByClassID(String id){
			ArrayList<StudentBean> al = new ArrayList<StudentBean>();
			try{
				String sql = "SELECT s.*,sc.* FROM t_student s INNER JOIN t_student_class sc ON s.student_id = sc.student_id WHERE sc.class_id = ?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					StudentBean sb = new StudentBean();
					sb.setStudent_id(rs.getString("student_id"));
					sb.setFirst_name(rs.getString("first_name"));
					sb.setLast_name(rs.getString("last_name"));
					sb.setGender(rs.getString("gender"));
					sb.setPhone(rs.getString("phone"));
					sb.setPhoto_name(rs.getString("photo_name"));				
				
					al.add(sb);
				}
			}catch(Exception e){
				System.out.println("StudentClassService::getStudentByClassID() => " + e.toString());System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return al;
		}
	   
	   //============== change student class study ========================
	   public static String changeStudentClass(StudentClassBean scb){
			String message = "";
			try{
	        	String sql = "UPDATE t_student_class SET class_id=? WHERE student_id=?";
	        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	        	
	        	ps.setString(1, scb.getClass_id());
	        	ps.setString(2, scb.getStudent_id());
	        	
	        	int state = ps.executeUpdate();
	        	if(state > 0)
	        		message = "success";
	        		
			}catch(Exception e){
				message = "error";
	        	System.out.println("StudentClassService::changeStudentClass() => " + e.toString());
	        }finally{
	        	MySQL.P_getClose();
	        }
			return message;
		}
}
