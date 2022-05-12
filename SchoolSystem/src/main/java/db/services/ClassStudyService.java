package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bean.ClassStudyBean;
import bean.ClassStudyDetailBean;
import bean.RoomBean;
import bean.SubjectCategoryBean;
import bean.TeacherBean;
import db.mysql.MySQL;
public class ClassStudyService {
	public static String getNewId(){
		String code = null;
        try{
        	String sql = "SELECT MAX(class_id) AS classID FROM t_class_study";
        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
        	ResultSet rs = ps.executeQuery();
        	if(rs.next()){
        		String sCode = rs.getString("classID");
        		String l_code = l_cutePrefix(sCode, "cls");
        		int tmpCode = Integer.parseInt(l_code);
        		tmpCode ++;
        		
        		code = "cls";
        		code += String.format("%03d", tmpCode);
        	}
        	
        }catch(Exception e){
        	code = "cls";
        	code += String.format("%03d", 1);
        	System.out.println("ClassStudyService::getNewId() => " + e.toString());
        }finally{
        	MySQL.P_getClose();
        }
		return code;
	}
	//=========================================================================
		private static String l_cutePrefix(String str, String pref){
			if(str != null && pref != null && str.startsWith(pref)){
				return str.substring(pref.length());
			}
			return str;
		}
		
		public static ArrayList<ClassStudyBean> p_listAllClassStudies(){
			ArrayList<ClassStudyBean> al = new ArrayList<ClassStudyBean>();
			try{
				String sql = "SELECT cs.*,r.room_id,r.room_name FROM t_class_study cs INNER JOIN t_rooms r ON cs.room_id = r.room_id";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					ClassStudyBean csb = new ClassStudyBean();
					csb.setClass_id(rs.getString("class_id"));					
					RoomBean rb = new RoomBean();
					rb.setRoom_id(rs.getString("room_id"));
					rb.setRoom(rs.getString("room_name"));
					csb.setRoomb(rb);
					csb.setStart_date(rs.getString("start_date"));
					csb.setEnd_date(rs.getString("end_date"));
					csb.setTime_study(rs.getString("time_study"));
					csb.setStatus(rs.getString("status"));
					
					al.add(csb);
				}
			}catch(Exception e){
				System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return al;
		}
		
		public static ArrayList<ClassStudyBean> getClassStudyStatus(){
			ArrayList<ClassStudyBean> al = new ArrayList<ClassStudyBean>();
			try{
				String sql = "SELECT DISTINCT status FROM t_class_study";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					ClassStudyBean csb = new ClassStudyBean();
					csb.setStatus(rs.getString("status"));
					
					al.add(csb);
				}
			}catch(Exception e){
				System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return al;
		}
		
		public static ClassStudyBean getAClassStudy(String id){
			ClassStudyBean csb = null;
			try{
				String sql = "SELECT cs.*,r.room_id,r.room_name FROM t_class_study cs INNER JOIN t_rooms r ON cs.room_id = r.room_id WHERE class_id=?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					csb = new ClassStudyBean();
					csb.setClass_id(rs.getString("class_id"));
					RoomBean rb = new RoomBean();
					rb.setRoom_id(rs.getString("room_id"));
					rb.setRoom(rs.getString("room_name"));
					csb.setRoomb(rb);
					
					csb.setStart_date(rs.getString("start_date"));
					csb.setEnd_date(rs.getString("end_date"));
					
					csb.setTime_study(rs.getString("time_study"));
					csb.setStatus(rs.getString("status"));
				}
			}catch(Exception e){
				System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return csb;
		}
		
		public static String updateClassStudy(ClassStudyBean csb){
			String message = "";
			try{
	        	String sql = "UPDATE t_class_study SET room_id=?,start_date=?,end_date=?,time_study=?,status=? WHERE class_id=? ";
	        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	        	RoomBean rb = csb.getRoomb();
				ps.setString(1, rb.getRoom_id());
				
				ps.setString(2, csb.getStart_date());
				ps.setString(3, csb.getEnd_date());
				ps.setString(4, csb.getTime_study());
				ps.setString(5, csb.getStatus());
				ps.setString(6, csb.getClass_id());
	        	int state = ps.executeUpdate();
	        	if(state > 0 ){		
					message = "success";
				}
			}catch(Exception e){
				message = "error";
	        	System.out.println("ClassStudyService::updateClassStudy() => " + e.toString());
	        }finally{
	        	MySQL.P_getClose();;
	        }
			return message;
		}
		
		public static String addNewClassStudy(ClassStudyBean csb){
			String message = "";
			try{
	        	String sql = "INSERT INTO t_class_study VALUES(?,?,?,?,?,?)";
	        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	        	ps.setString(1, csb.getClass_id());
	        	RoomBean rb = csb.getRoomb();
				ps.setString(2, rb.getRoom_id());
				
				ps.setString(3, csb.getStart_date());
				ps.setString(4, csb.getEnd_date());
				ps.setString(5, csb.getTime_study());
				ps.setString(6, csb.getStatus());
	        	int state = ps.executeUpdate();
	        	if(state > 0 ){		
					message = "success";
				}
			}catch(Exception e){
				message = "error";
	        	System.out.println("ClassStudyService::addNewClassStudy() => " + e.toString());
	        }finally{
	        	MySQL.P_getClose();;
	        }
			return message;
		}
		
		public static String addNewClassStudyDetail(ClassStudyDetailBean csdb){
			String message = "";
			try{
	        	String sql = "INSERT INTO tblclassstudydetail VALUES(?,?)";
	        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	        	ps.setInt(1, csdb.getClassID());
	        	ps.setString(2, csdb.getName());
				
	        	int state = ps.executeUpdate();
	        	if(state > 0 ){		
					message = "success";
				}
	        	
			}catch(Exception e){
				message = "error";
	        	System.out.println("ClassStudyService::addNewClassStudyDetail() => " + e.toString());
	        }finally{
	        	MySQL.P_getClose();;
	        }
			return message;
		}
		
		//Delete class_study
		public static String P_deleteClassStudy(String id){  
	        String msg = ""; 
	        try{  
	        	String sql = "DELETE FROM t_class_study WHERE class_id = ?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	            ps.setString(1,id);  
	            int state = ps.executeUpdate(); 
	            if(state > 0){
	            	msg = "Success";
	            } 
	                
	        }catch(Exception e){
	        		msg = "Error";
	        		e.printStackTrace();
	        	}
	        finally{
	        		MySQL.P_getClose();
	        	}
	          
	        return msg;  
	    }
		
		public static ArrayList<ClassStudyDetailBean> p_listAllClassStudyDetail(){
			ArrayList<ClassStudyDetailBean> al = new ArrayList<ClassStudyDetailBean>();
			try{
				String sql = "SELECT * FROM tblclassstudydetail";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					ClassStudyDetailBean csdb = new ClassStudyDetailBean();
					//csdb.setClassID(rs.getInt("classID"));
					
					//csdb.setName(rs.getString("className"));
					
					String str = rs.getString("className");
				    String items[] =str.split(",");
				    for(int i=0;i<items.length; i++){
				    	//String search=items[i];
				    	System.out.println("Subject = " + items[i]);
				    
					    String sqls = "SELECT * FROM t_subject_category where category_id="+ items[i];
						PreparedStatement pss = MySQL.P_getConnection().prepareStatement(sqls);
						
						ResultSet rss = pss.executeQuery();
						while(rss.next()){
							SubjectCategoryBean scb = new SubjectCategoryBean();
							//append=rss.getString("subject_category");
							scb.setCategory_id(rss.getString("category_id"));
							scb.setCategory_name(rss.getString("subject_category"));
							csdb.setScb(scb);
							//csdb.setName(rss.getString("subject_category"));
							System.out.println(" show count array!" + rss.getString("subject_category"));
							
						} 
				    }     
					al.add(csdb);
				}
			}catch(Exception e){
				System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return al;
		}
		//====== get Student's Class ======
		public static ClassStudyBean getClassOfStudent(String id){
			ClassStudyBean csb = null;
			try{
				String sql = "SELECT cs.*,r.room_id,r.room_name FROM t_student_class sc INNER JOIN ( t_class_study cs INNER JOIN t_rooms r ON cs.room_id = r.room_id) ON sc.class_id = cs.class_id WHERE sc.student_id=?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					csb = new ClassStudyBean();
					csb.setClass_id(rs.getString("class_id"));					
					RoomBean rb = new RoomBean();
					rb.setRoom_id(rs.getString("room_id"));
					rb.setRoom(rs.getString("room_name"));
					csb.setRoomb(rb);
					
					csb.setStart_date(rs.getString("start_date"));
					csb.setEnd_date(rs.getString("end_date"));
					
					csb.setTime_study(rs.getString("time_study"));
					csb.setStatus(rs.getString("status"));
				}
			}catch(Exception e){
				System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return csb;
		}
		
		//================= list Class by Teacher id ================
	       public static ArrayList<ClassStudyBean> getClassByUserID(String id){
	         ArrayList<ClassStudyBean> al = new ArrayList<ClassStudyBean>();
	        try{
	          String sql = "SELECT DISTINCT(r.room_name)AS RoomName,r.room_id,cs.class_id,t.teacher_id FROM t_user_account us,t_user_account ua, t_teacher t,t_teacher_class tc,t_class_study cs, t_rooms r WHERE us.user_id = t.user_id AND t.teacher_id = tc.teacher_id AND tc.class_id = cs.class_id AND cs.room_id = r.room_id AND t.user_id = ?";          
	          PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	          ps.setString(1, id);
	          ResultSet rs = ps.executeQuery();
	          while(rs.next()){
	            ClassStudyBean csb = new ClassStudyBean();	
	            csb.setClass_id(rs.getString("class_id"));
	            RoomBean rb = new RoomBean();
	            rb.setRoom_id(rs.getString("room_id"));
	            rb.setRoom(rs.getString("RoomName"));
	            csb.setRoomb(rb);           
	            TeacherBean tb = new TeacherBean();
	            tb.setT_id(rs.getString("teacher_id"));
	            csb.setTeaacherB(tb);
	            al.add(csb);
	          }
	        }catch(Exception e){
	          System.out.println("TeacherClassService::getClassByUserID() => " + e.toString());	          
	        }finally{
	          MySQL.P_getClose();
	        }
	        return al;
	      }
}
