package db.services;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.AttendantBean;
import bean.StudentBean;
import bean.SubjectTeacherBean;
import db.mysql.MySQL;
public class AttendanceService {
	// Auto ID
	public static int getNewId(){
		int code = 0;
        try{
        	String sql = "SELECT MAX(attendance_id) AS aID FROM t_attendance";
        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
        	ResultSet rs = ps.executeQuery();
        	if(rs.next()){
        		int tCode = rs.getInt("aID");
        		
        		tCode += 1;
        		code = tCode;
        	}
        	
        }catch(Exception e){
        	code = 0;
        	System.out.println("AttendanceService::getNewId() => " + e.toString());
        }finally{
        	MySQL.P_getClose();
        }
        return code;
   }
	//===== list Attendance by Class id =====
   public static ArrayList<AttendantBean> getAttendanceByClassID(String id){
		ArrayList<AttendantBean> al = new ArrayList<AttendantBean>();
		try{
			String sql = "SELECT s.student_id,s.first_name,s.last_name,s.gender,att.attendance_id,att.status,att.date FROM t_attendance att INNER JOIN (t_student s INNER JOIN t_student_class sc ON sc.student_id = s.student_id) ON s.student_id=att.student_id WHERE sc.class_id = ?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();				
			while(rs.next()){
				AttendantBean atb = new AttendantBean();
				atb.setAttendace_id(rs.getInt("attendance_id"));
				StudentBean sb = new StudentBean();
				sb.setStudent_id(rs.getString("student_id"));
				sb.setFirst_name(rs.getString("first_name"));
				sb.setLast_name(rs.getString("last_name"));
				sb.setGender(rs.getString("gender"));
				atb.setStudentB(sb);
				atb.setStatus(rs.getInt("status"));
				atb.setDate(rs.getString("date"));
				al.add(atb);
			}
		}catch(Exception e){
			System.out.println("AttendanceService::getAttendanceByClassID => " + e.toString());
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
   
 //===== Insert Multi Row of Student Attendance ========
   public static String insertMultiStudentAttendance(ArrayList<AttendantBean> list){
	   String msg ="";
	   
	   try{
		   
	   		for(int i=0;i<list.size();i++){
	   			String sql = "INSERT INTO t_attendance VALUES(?,?,?,?)";
	   			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	   			AttendantBean atb = (AttendantBean) list.get(i);
	   			ps.setInt(1, getNewId());
	   			ps.setString(2, atb.getStudent_id());
	   			ps.setInt(3, atb.getStatus());
	   			ps.setString(4, atb.getDate());
	   			int state = ps.executeUpdate();
	   			if(state > 0){
	   				msg = "Success";
	   			}
	   		}
	   }catch(Exception e){
		   msg = "Error";
		   System.out.println("AttendanceService::insertMultiStudentAttendance() => " + e.toString());
	   }finally{
		   MySQL.P_getClose();
	   }
	   return msg;
   }
}
