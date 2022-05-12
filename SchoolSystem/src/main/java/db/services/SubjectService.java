package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.AddByBean;
import bean.SubjectBean;
import bean.SubjectCategoryBean;
import bean.UserBean;
import db.mysql.MySQL;

public class SubjectService {
	
	
	
	static SubjectCategoryBean scb =null;
	static  AddByBean addby =null;
	static SubjectBean sb = null;
	public static String getNewId(){
		String code = null;	
        try{
        	String sql = "SELECT MAX(subject_id) AS subjectID FROM t_subject";
        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
        	ResultSet rs = ps.executeQuery();
        	if(rs.next()){
        		String sCode = rs.getString("subjectID");
        		String l_code = l_cutePrefix(sCode, "sub");
        		int tmpCode = Integer.parseInt(l_code);
        		tmpCode ++;
        		
        		code = "sub";
        		code += String.format("%03d", tmpCode);
        	}
        	
        }catch(Exception e){
        	code = "sub";
        	code += String.format("%03d", 1);
        	System.out.println("SubjectService::getNewId() => " + e.toString());
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
	
	public static ArrayList<SubjectBean> p_listAllSubject(){
		ArrayList<SubjectBean> al = new ArrayList<SubjectBean>();
		try{
			String sql = "SELECT t_subject.*,c.category_id ,c.subject_category ,ad.* ,us.user_name FROM t_subject_category c INNER JOIN( t_subject INNER JOIN( addby ad INNER JOIN t_user_account us ON us.user_id = ad.user_id) ON ad.addby_id = t_subject.adby_id )ON t_subject.category_id = c.category_id ";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				SubjectBean sb = new SubjectBean();
				sb.setSubject_id(rs.getString("subject_id"));
				sb.setSubject_name(rs.getString("subject_name"));
				SubjectCategoryBean scb = new SubjectCategoryBean();
				scb.setCategory_name(rs.getString("subject_category"));
				addby =new AddByBean();
				addby.setAddby_id(rs.getInt("addby_id"));
				addby.setInputTime(rs.getString("input_time"));
				addby.setInputDate(rs.getString("input_date"));
				UserBean ub = new UserBean();
				ub.setUser_id(rs.getString("user_id"));
				ub.setUser_name(rs.getString("user_name"));
				addby.setUserbean(ub);
                sb.setAddbybean(addby);

				sb.setScb(scb);
				al.add(sb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	
	
	public static ArrayList<SubjectCategoryBean> p_listAllCategory(){
		ArrayList<SubjectCategoryBean> al = new ArrayList<SubjectCategoryBean>();
		try{
			String sql = "SELECT * FROM t_subject_category";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				 scb = new SubjectCategoryBean();
				scb.setCategory_id(rs.getString("category_id"));
				scb.setCategory_name(rs.getString("subject_category"));
				al.add(scb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	//================================== Auto Complete Search Subjects ============================
	public static ArrayList<String> p_autoCompleteListSubject(String subject_name){
		ArrayList<String> al = new ArrayList<String>();
		try{
			String sql = "SELECT subject_id,subject_name FROM t_subject WHERE subject_name LIKE";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1,subject_name + "%" );
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				String result = rs.getString("subject_id") + ":" + rs.getString("subject_name");
				al.add(result);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	//============================ Add New Subject ================================
	public static String addNewSubject(SubjectBean sb,AddByBean addbys){
		String message = "";
		try{
        	String sql = "INSERT INTO t_subject VALUES(?,?,?,?)";
        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	        	ps.setString(1, sb.getSubject_id());
	        	ps.setString(2, sb.getSubject_name());
        	SubjectCategoryBean scb = sb.getScb();
				ps.setString(3,scb.getCategory_id());
			
			    ps.setInt(4,addbys.getAddby_id());
        	int state = ps.executeUpdate();
        	if(state > 0 ){		
        		AddByService.addNewAddby(addbys);
				message = "Success";
			}
        	
		}catch(Exception e){
			message = "Error";
        	System.out.println("SubjectService::addNewSubject() => " + e.toString());
        }finally{
        	MySQL.P_getClose();;
        }
		return message;
	}
	
	public static SubjectBean p_getASubject(String id){
		
		try{
			String sql = "SELECT s.subject_id, s.subject_name,c.category_id ,c.subject_category FROM t_subject s INNER JOIN t_subject_category c ON s.category_id = c.category_id WHERE subject_id=?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				sb = new SubjectBean();
				sb.setSubject_id(rs.getString("subject_id"));
				sb.setSubject_name(rs.getString("subject_name"));
				
				 scb = new SubjectCategoryBean();
				scb.setCategory_id(rs.getString("category_id"));
				scb.setCategory_name(rs.getString("subject_category"));
				sb.setScb(scb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return sb;
	}
	
	public static String updateSubject(SubjectBean sb){
		String message = "";
		try{
        	String sql = "UPDATE t_subject SET subject_name=?,category_id=? WHERE subject_id=?";
        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
        	
        	ps.setString(1, sb.getSubject_name());
        	scb = new SubjectCategoryBean();
        	   scb = sb.getScb();
        	ps.setString(2, scb.getCategory_id()); 
        	ps.setString(3, sb.getSubject_id());
        	
        	int state = ps.executeUpdate();
        	if(state > 0)
        		message = "Success";        		
		}catch(Exception e){
			message = "Error";
        	System.out.println("SubjectService::updateSubject() => " + e.toString());
        }finally{
        	MySQL.P_getClose();
        }
		return message;
	}
	
	public static ArrayList<SubjectCategoryBean> p_getSubjectCategory(){
		ArrayList<SubjectCategoryBean> al = new ArrayList<SubjectCategoryBean>();
		try{
			String sql = "SELECt * FROM  t_subject_category";
			
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				SubjectCategoryBean scb = new SubjectCategoryBean();
				scb.setCategory_id(rs.getString("category_id"));
				scb.setCategory_name(rs.getString("subject_category"));
				al.add(scb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
		//Delete subject
		public static String deleteSubject(String id){  
	        String msg = ""; 
	        try{  
	        	String sql = "DELETE FROM t_subject WHERE subject_id = ? ";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	            ps.setString(1,id);
	            int state = ps.executeUpdate(); 
	            if(state > 0){
	            	  SubjectCategoryService.deleteSubjectCategory(id);
	            	  AddByService.deleteSubject(id);
	            	} 
	        }catch(Exception e){
	        		msg = "Error";
	        		e.printStackTrace();
	        }finally{MySQL.P_getClose();}
	        return msg;  
	    }
	
}
