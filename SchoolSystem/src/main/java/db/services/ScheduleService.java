package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.ClassStudyBean;
import bean.DayBean;
import bean.ScheduleBean;
import bean.SubjectBean;
import bean.TeacherBean;
import bean.TimeBean;
import db.mysql.MySQL;

public class ScheduleService {
	 //========get schedule =======
	   public static ArrayList<ScheduleBean> getScheduleByClassID(String id){
			ArrayList<ScheduleBean> al = new ArrayList<ScheduleBean>();
			try{
				String sql = "SELECT C.*,SC.*,T.*,D.*,S.*,TE.* FROM t_class_study C,tblschedule SC,tbltime T,tblday D,t_subject S,t_teacher TE WHERE C.class_id = SC.class_id AND T.time_id = SC.time_id AND D.day_id = SC.day_id AND s.subject_id = SC.subject_id AND TE.teacher_id = SC.teacher_id AND SC.class_id = ? ORDER BY SC.day_id";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					ScheduleBean sb = new ScheduleBean();
					sb.setClass_id(rs.getString("class_id"));
					sb.setTime_id(rs.getInt("time_id"));
					sb.setDay_id(rs.getInt("day_id"));
					ClassStudyBean csb = new ClassStudyBean();
					csb.setClass_id(rs.getString("class_id"));
					sb.setClassStudyB(csb);
					
					TimeBean tb = new TimeBean();
					tb.setTime_id(rs.getInt("time_id"));
					tb.setStart_time(rs.getString("start_time"));
					tb.setEnd_time(rs.getString("end_time"));
					sb.setTimeB(tb);
					
					DayBean db = new DayBean();
					db.setDay_id(rs.getInt("day_id"));
					db.setDay_name(rs.getString("day_name"));
					sb.setDayB(db);
					
					SubjectBean sub = new SubjectBean();
					sub.setSubject_id(rs.getString("subject_id"));
					sub.setSubject_name(rs.getString("subject_name"));				
					sb.setSubjectB(sub);
					
					TeacherBean teb = new TeacherBean();
					teb.setT_id(rs.getString("teacher_id"));
					teb.setT_fname(rs.getString("first_name"));
					teb.setT_lname(rs.getString("last_name"));
					teb.setT_gender(rs.getString("gender"));
					sb.setTeacherB(teb);
					al.add(sb);
				}
			}catch(Exception e){
				System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return al;
		}
	 //========get schedule =======
	   public static ScheduleBean getClassScheduleByClassID(String id){
			ScheduleBean sb = null;
			try{
				String sql = "SELECT C.*,SC.*,T.*,D.*,S.*,TE.* FROM t_class_study C,tblschedule SC,tbltime T,tblday D,t_subject S,t_teacher TE WHERE C.class_id = SC.class_id AND T.time_id = SC.time_id AND D.day_id = SC.day_id AND s.subject_id = SC.subject_id AND TE.teacher_id = SC.teacher_id AND SC.class_id = ? ORDER BY SC.day_id";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					sb = new ScheduleBean();
					sb.setClass_id(rs.getString("class_id"));
					sb.setTime_id(rs.getInt("time_id"));
					sb.setDay_id(rs.getInt("day_id"));
					ClassStudyBean csb = new ClassStudyBean();
					csb.setClass_id(rs.getString("class_id"));
					sb.setClassStudyB(csb);
					
					TimeBean tb = new TimeBean();
					tb.setTime_id(rs.getInt("time_id"));
					tb.setStart_time(rs.getString("start_time"));
					tb.setEnd_time(rs.getString("end_time"));
					sb.setTimeB(tb);
					
					DayBean db = new DayBean();
					db.setDay_id(rs.getInt("day_id"));
					db.setDay_name(rs.getString("day_name"));
					sb.setDayB(db);
					
					SubjectBean sub = new SubjectBean();
					sub.setSubject_id(rs.getString("subject_id"));
					sub.setSubject_name(rs.getString("subject_name"));				
					sb.setSubjectB(sub);
					
					TeacherBean teb = new TeacherBean();
					teb.setT_id(rs.getString("teacher_id"));
					teb.setT_fname(rs.getString("first_name"));
					teb.setT_lname(rs.getString("last_name"));
					teb.setT_gender(rs.getString("gender"));
					sb.setTeacherB(teb);
					
				}
			}catch(Exception e){
				System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return sb;
		}
	   
	 //========get schedule =======
	   public static ArrayList<ScheduleBean> ScheduleByClassID(String id){
		   ArrayList<ScheduleBean> list = new ArrayList<ScheduleBean>();
			try{
				String sql = "SELECT C.*,SC.*,T.*,D.*,S.*,TE.* FROM t_class_study C,tblschedule SC,tbltime T,tblday D,t_subject S,t_teacher TE WHERE C.class_id = SC.class_id AND T.time_id = SC.time_id AND D.day_id = SC.day_id AND s.subject_id = SC.subject_id AND TE.teacher_id = SC.teacher_id AND SC.class_id = ? ORDER BY SC.day_id";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					ScheduleBean sb = new ScheduleBean();
					sb.setClass_id(rs.getString("class_id"));
					sb.setTeacher_id(rs.getString("teacher_id"));
					sb.setTime_id(rs.getInt("time_id"));
					sb.setDay_id(rs.getInt("day_id"));
					ClassStudyBean csb = new ClassStudyBean();
					csb.setClass_id(rs.getString("class_id"));
					sb.setClassStudyB(csb);
					
					TimeBean tb = new TimeBean();
					tb.setTime_id(rs.getInt("time_id"));
					tb.setStart_time(rs.getString("start_time"));
					tb.setEnd_time(rs.getString("end_time"));
					sb.setTimeB(tb);
					
					DayBean db = new DayBean();
					db.setDay_id(rs.getInt("day_id"));
					db.setDay_name(rs.getString("day_name"));
					sb.setDayB(db);
					
					SubjectBean sub = new SubjectBean();
					sub.setSubject_id(rs.getString("subject_id"));
					sub.setSubject_name(rs.getString("subject_name"));				
					sb.setSubjectB(sub);
					
					TeacherBean teb = new TeacherBean();
					teb.setT_id(rs.getString("teacher_id"));
					teb.setT_fname(rs.getString("first_name"));
					teb.setT_lname(rs.getString("last_name"));
					teb.setT_gender(rs.getString("gender"));
					sb.setTeacherB(teb);
					list.add(sb);
				}
			}catch(Exception e){
				System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return list;
		} 
		
	 //========get schedule for a teacher =======
	   public static ArrayList<ScheduleBean> ScheduleByTeacherID(String id){
		   ArrayList<ScheduleBean> list = new ArrayList<ScheduleBean>();
			try{
				String sql = "SELECT C.*,SC.*,T.*,D.*,S.*,TE.* FROM t_class_study C,tblschedule SC,tbltime T,tblday D,t_subject S,t_teacher TE WHERE C.class_id = SC.class_id AND T.time_id = SC.time_id AND D.day_id = SC.day_id AND s.subject_id = SC.subject_id AND TE.teacher_id = SC.teacher_id AND SC.teacher_id = ? ORDER BY SC.day_id";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					ScheduleBean sb = new ScheduleBean();
					sb.setClass_id(rs.getString("class_id"));
					sb.setTime_id(rs.getInt("time_id"));
					sb.setDay_id(rs.getInt("day_id"));
					ClassStudyBean csb = new ClassStudyBean();
					csb.setClass_id(rs.getString("class_id"));
					sb.setClassStudyB(csb);
					
					TimeBean tb = new TimeBean();
					tb.setTime_id(rs.getInt("time_id"));
					tb.setStart_time(rs.getString("start_time"));
					tb.setEnd_time(rs.getString("end_time"));
					sb.setTimeB(tb);
					
					DayBean db = new DayBean();
					db.setDay_id(rs.getInt("day_id"));
					db.setDay_name(rs.getString("day_name"));
					sb.setDayB(db);
					
					SubjectBean sub = new SubjectBean();
					sub.setSubject_id(rs.getString("subject_id"));
					sub.setSubject_name(rs.getString("subject_name"));				
					sb.setSubjectB(sub);
					
					TeacherBean teb = new TeacherBean();
					teb.setT_id(rs.getString("teacher_id"));
					teb.setT_fname(rs.getString("first_name"));
					teb.setT_lname(rs.getString("last_name"));
					teb.setT_gender(rs.getString("gender"));
					sb.setTeacherB(teb);
					list.add(sb);
				}
			}catch(Exception e){
				System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return list;
		} 
		public static String updateSchedule(ScheduleBean sb){
			String message = "";
			try{
	        	String sql = "UPDATE tblschedule SET time_id = ?,day_id=?,teacher_id=? WHERE class_id=?";
	        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	        	
	        	TimeBean tb = sb.getTimeB();
	        	ps.setInt(1, tb.getTime_id());
	        	DayBean db = sb.getDayB();
				ps.setInt(2, db.getDay_id());
				SubjectBean subB = sb.getSubjectB();
				ps.setString(3, subB.getSubject_id());
				TeacherBean teb = sb.getTeacherB();
				ps.setString(4, teb.getT_id());
				
	        	ps.setString(5,sb.getClass_id());
	        	
	        	int state = ps.executeUpdate();
	        	if(state > 0)
	        		message = "success";
	        		
			}catch(Exception e){
				message = "error";
	        	System.out.println("ScheduleService::updateSchedule() => " + e.toString());
	        }finally{
	        	MySQL.P_getClose();
	        }
			return message;
		}		
		
		//========get time =======
		   public static ArrayList<TimeBean> getTimeList(){
				ArrayList<TimeBean> al = new ArrayList<TimeBean>();
				try{
					String sql = "SELECT * FROM tbltime";
					PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
					
					while(rs.next()){
						TimeBean tb = new TimeBean();
						tb.setTime_id(rs.getInt("time_id"));
						tb.setStart_time(rs.getString("start_time"));
						tb.setEnd_time(rs.getString("end_time"));
						
						al.add(tb);
					}
				}catch(Exception e){
					System.out.println("ScheduleService.getTimeList() => " + e.toString());
				}finally{
					MySQL.P_getClose();
				}
				return al;
			}
		 //========get time By ClassID =======
		   public static ArrayList<TimeBean> getTimeByClassID(String id){
				ArrayList<TimeBean> al = new ArrayList<TimeBean>();
				try{
					String sql = "SELECT DISTINCT(t.start_time) AS StartTime,t.time_id,t.end_time FROM tbltime t INNER JOIN tblschedule s ON s.time_id = t.time_id WHERE s.class_id = ?";
					PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
					ps.setString(1, id);
					ResultSet rs = ps.executeQuery();
					
					while(rs.next()){
						TimeBean tb = new TimeBean();
						tb.setTime_id(rs.getInt("time_id"));
						tb.setStart_time(rs.getString("StartTime"));
						tb.setEnd_time(rs.getString("end_time"));
						
						al.add(tb);
					}
				}catch(Exception e){
					System.out.println("ScheduleService.getTimeByClassID() => " + e.toString());
				}finally{
					MySQL.P_getClose();
				}
				return al;
			}
		   public static int getNewId(){
				int code = 0;
		        try{
		        	String sql = "SELECT MAX(time_id) AS timeID FROM tbltime";
		        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
		        	ResultSet rs = ps.executeQuery();
		        	if(rs.next()){
		        		int tCode = rs.getInt("timeID");
		        		
		        		tCode += 1;
		        		code = tCode;
		        	}
		        	
		        }catch(Exception e){
		        	code = 0;
		        	System.out.println("ScheduleService::getNewId() => " + e.toString());
		        }finally{
		        	MySQL.P_getClose();
		        }
		        return code;
		   }
		        
		        
		 //============== Add New Time ===============
			public static String addTime(TimeBean tb){
				String message = "";
				try{
		        	String sql = "INSERT INTO tbltime VALUES(?,?,?)";
		        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);	
		        	ps.setInt(1, getNewId());
		        	ps.setString(2, tb.getStart_time());
		        	ps.setString(3, tb.getEnd_time());
					System.out.print("Time Study " + tb.getStart_time() + tb.getEnd_time());
		        	int state = ps.executeUpdate();
		        	if(state > 0 ){		
						message = "success";
					}		        	
				}catch(Exception e){
					message = "error";
		        	System.out.println("ScheduleService::addTime() => " + e.toString());
		        }finally{
		        	MySQL.P_getClose();;
		        }
				return message;
			}
			
			//============== Add New Schedule ===============
			public static String addNewSchedule(ScheduleBean sb){
				String message = "";
				try{
		        	String sql = "INSERT INTO tblschedule VALUES(?,?,?,?,?)";
		        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);	
		        	ps.setString(1, sb.getClass_id());
		        	ps.setInt(2, sb.getTime_id());
		        	ps.setInt(3, sb.getDay_id());
		        	ps.setString(4, sb.getSubject_id());
		        	ps.setString(5, sb.getTeacher_id());
					
		        	int state = ps.executeUpdate();
		        	if(state > 0 ){		
						message = "success";
					}		        	
				}catch(Exception e){
					message = "error";
		        	System.out.println("ScheduleService::addNewSchedule() => " + e.toString());
		        }finally{
		        	MySQL.P_getClose();;
		        }
				return message;
			}
		   
   		//Delete Schedule
 		public static String deleteSchedule(String id){  
 	        String msg = ""; 
 	        try{  
 	        	String sql = "DELETE FROM tblschudule WHERE class_id = ? ";
 				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
 	            ps.setString(1,id);
 	            
 	            int state = ps.executeUpdate(); 
 	            if(state > 0){msg = "Success";} 
 	        }catch(Exception e){
 	        		msg = "Error";
 	        		System.out.print("ScheduleService ==>deleteSchedule()" + e.toString());
 	        }finally{MySQL.P_getClose();}
 	        return msg;  
 	    }
   
}
