package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.SubjectCategoryBean;
import db.mysql.MySQL;

public class SubjectCategoryService {

	public static String getNewId(){
		String code = null;
		
        try{
        	String sql = "SELECT MAX(category_id) AS categoryID FROM t_subject_category";
        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
        	ResultSet rs = ps.executeQuery();
        	if(rs.next()){
        		String cCode = rs.getString("categoryID");
        		String l_code = l_cutePrefix(cCode, "cate");
        		int tmpCode = Integer.parseInt(l_code);
        		tmpCode ++;
        		
        		code = "cate";
        		code += String.format("%03d", tmpCode);
        	}
        	
        }catch(Exception e){
        	code = "cate";
        	code += String.format("%03d", 1);
        	System.out.println("SubjectCategoryService::getNewId() => " + e.toString());
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
	
	public static ArrayList<SubjectCategoryBean> p_listAllCategory(){
		ArrayList<SubjectCategoryBean> al = new ArrayList<SubjectCategoryBean>();
		try{
			String sql = "SELECT * FROM t_subject_category";
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
	
	//===================Add New Room=========================
		public static String addNewSubjectCategory(SubjectCategoryBean scb){
			String message = "";
			try{
	        	String sql = "INSERT INTO t_subject_category VALUES(?,?)";
	        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	        	ps.setString(1, scb.getCategory_id());
	        	ps.setString(2, scb.getCategory_name());
	        	
	        	int state = ps.executeUpdate();
	        	if(state > 0)
	        		message = "success";
	        	
			}catch(Exception e){
				message = "error";
	        	System.out.println("SubjectCategoryService::addSubjectCategory() => " + e.toString());
	        }finally{
	        	MySQL.P_getClose();;
	        }
			return message;
		}
		
		public static SubjectCategoryBean getASubjectCategory(String id){
			SubjectCategoryBean scb = null;
			try{
				
				String sql = "SELECT * FROM t_subject_category WHERE category_id=?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					
					scb = new SubjectCategoryBean();
					scb.setCategory_id(rs.getString("category_id"));
					scb.setCategory_name(rs.getString("subject_category"));
				}
				
			}catch(Exception e){
				System.out.println("SubjectCategoryService::getASubjectCategory() => " + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return scb;
		}
		
		
		public static String updateSubjectCategory(SubjectCategoryBean scb){
			String message = "";
			try{
	        	String sql = "UPDATE t_subject_category SET subject_category=? WHERE category_id=?";
	        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	        	
	        	ps.setString(1, scb.getCategory_name());
	        	ps.setString(2, scb.getCategory_id());
	        	
	        	int state = ps.executeUpdate();
	        	if(state > 0)
	        		message = "success";
			}catch(Exception e){
				message = "error";
	        	System.out.println("SubjectCategoryService::updateSubjectCategory() => " + e.toString());
	        }finally{
	        	MySQL.P_getClose();
	        }
			return message;
		}
		
		//Delete Subject Category
		public static String deleteSubjectCategory(String id){  
	        String msg = ""; 
	        try{  
	        	String sql = "DELETE FROM t_subject_category WHERE category_id = ?";
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
}
