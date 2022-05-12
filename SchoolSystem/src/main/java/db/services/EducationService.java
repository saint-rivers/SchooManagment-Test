package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.EducationBean;
import bean.TeacherBean;
import db.mysql.MySQL;

public class EducationService {
	
	
	
	
	/////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////     Display All list teacher Education
	
	public static ArrayList<EducationBean> DisplayEducation(){
		
		ArrayList<EducationBean >ed= new ArrayList<EducationBean>();
		try
			{
				String sql = "SELECT ed.* , t.* FROM t_teacher_edu ed INNER JOIN t_teacher t ON ed.teacher_id = t.teacher_id"; 
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				    while(rs.next())
				         {
				    	    EducationBean edb= new EducationBean();	
				    	         edb.setEducation_id(rs.getString("education_id"));
				    	         TeacherBean tb = new TeacherBean();
//				    	         tb.setT_id(rs.getString("teacher_id"));
//				    	         edb.setTeacherbean(tb); 
				    	         tb.setT_fname(rs.getString("first_name"));
				    	         tb.setT_lname(rs.getString("last_name"));
				    	         edb.setTeacherbean(tb);
				    	         edb.setPrimary_name(rs.getString("pramary_school"));
				    	         edb.setStart_date_primary(rs.getString("start_pramaryschool"));
				    	         edb.setEnd_date_primary(rs.getString("end_pramaryschool"));
				    	         
				    	         edb.setHeigth_name(rs.getString("height_school"));
				    	         edb.setStart_date_heigth(rs.getString("start_heightschool"));
				    	         edb.setEnd_date_heigth(rs.getString("end_heightschool"));
				    	         
				    	         edb.setUniverSety_name(rs.getString("universety_school"));
				    	         edb.setStart_date_univerSety(rs.getString("start_universetyschool"));
				    	         edb.setEnd_date_univerSety(rs.getString("end_universety_school"));
				    	         
				    	         edb.setSkill(rs.getString("skill"));
				    	         edb.setLevel(rs.getString("level"));
				    	         edb.setTeacher_type(rs.getString("teacher_type"));
				    	         ed.add(edb);
		               }
		}
	catch(Exception e)
	    {
	    	System.out.println("Error ==>> EducationService <<===>> ::DisplayEducation()".toString());
	    }
	finally
		{
		 MySQL.P_getClose();
        }
		
		
		return ed;
		
	}
	
	
	
	///////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////   get Data on Update
	
	public static EducationBean getDataTeacherEducation(String id){		
		EducationBean ed= new EducationBean();		
		try
		{
			String sql = "SELECT * FROM t_teacher_edu WHERE education_id=? ";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
	    	         ed.setEducation_id(rs.getString("education_id"));	    	         
	    	         TeacherBean tb = new TeacherBean();
	    	         tb.setT_id(rs.getString("teacher_id"));
	    	         ed.setTeacherbean(tb);  
	    	         
	    	         ed.setPrimary_name(rs.getString("pramary_school"));
	    	         ed.setStart_date_primary(rs.getString("start_pramaryschool"));
	    	         ed.setEnd_date_primary(rs.getString("end_pramaryschool"));
	    	         
	    	         ed.setHeigth_name(rs.getString("height_school"));
	    	         ed.setStart_date_heigth(rs.getString("start_heightschool"));
	    	         ed.setEnd_date_heigth(rs.getString("end_heightschool"));
	    	         
	    	         ed.setUniverSety_name(rs.getString("universety_school"));
	    	         ed.setStart_date_univerSety(rs.getString("start_universetyschool"));
	    	         ed.setEnd_date_univerSety(rs.getString("end_universety_school"));
	    	         
	    	         ed.setSkill(rs.getString("skill"));
	    	         ed.setLevel(rs.getString("level"));
	    	         ed.setTeacher_type(rs.getString("teacher_type"));
	    
				}
			 
		}catch( Exception e){		
			System.out.println("Error ===>> EducationService ==>>::SelectdataTeacherEducation(EducationBean ed) ");
		}finally{
			MySQL.P_getClose();
		}		
		return ed;
	}
	
	
	
	
	
	
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////   insert data In table Teacher Education
	
	public static String InsertTeacherEducation(EducationBean ed){
		String mms="";
		try
		{
			
			String sql ="INSERT INTO t_teacher_edu VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, ed.getEducation_id());
				 TeacherBean tb = ed.getTeacherbean();
				ps.setString(2,tb.getT_id());
				ps.setString(3, ed.getprimary_name());
				ps.setString(4, ed.getStart_date_primary());
				ps.setString(5, ed.getEnd_date_primary());
				ps.setString(6, ed.getHeigth_name());
				ps.setString(7, ed.getStart_date_heigth());
				ps.setString(8, ed.getEnd_date_heigth());
				ps.setString(9, ed.getUniverSety_name());
				ps.setString(10, ed.getStart_date_univerSety());
				ps.setString(11, ed.getEnd_date_univerSety());
				ps.setString(12, ed.getSkill());
				ps.setString(13, ed.getLevel());
				ps.setString(14, ed.getTeacher_type());
				
			 int  i = ps.executeUpdate();
			 if(i > 0)
			 {
				 mms="Success";
			 }
		}catch( Exception e)
		{
			mms="Error";
			System.out.println("Error ===>> EducationService ==>>::InsertTeacherEducation(EducationBean ed) ");
		}finally{
			MySQL.P_getClose();
		}
		
		return mms;
	}
   ///////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////// Get Max Id Education Teacher
	
	public static String getNewEducationIdAuto()
    {
		        	       
		String code=null;
		  try
			  {
			             
			     String sql = "SELECT MAX(education_id) AS education_id FROM t_teacher_edu";
			     PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
			     ResultSet rs = ps.executeQuery();
			     if(rs.next())
				     {
				        String sCode = rs.getString("education_id");
				        String l_code = l_cutePrefix(sCode, "Education");
				        int tmpCode = Integer.parseInt(l_code);
				        tmpCode ++;
				        code = "Education";
				        code += String.format("%04d", tmpCode);
				     }         	
			   }
		  catch(Exception e)
			  {
			               	code = "Education";
			               	code += String.format("%04d", 1);
			               	System.out.println("EducationTeacher::getNewEducationIdAuto() => " + e.toString());
			  }
		  finally
			  {
			               	MySQL.P_getClose();
			  }
		       		
		       		return code;
	}
		           

	
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////// 			CUT STRING ID AUTO  IN TEACHER					    ////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


	
	private static String l_cutePrefix(String str, String pref)
	{
			if(str != null && pref != null && str.startsWith(pref))
				{
					return str.substring(pref.length());
				}
			return str;
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////    Delete From Education Teacher
	
	public static String DeleteEducationTeacher(String id)
	{
		String mms="";
		int i =0;
		try{
			String sql= "DELETE FROM t_teacher_edu WHERE education_id = ?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			    ps.setString(1,id);
			    i = ps.executeUpdate();
			    if(i>0)
			    {
			    	mms="Success";
			    }
			
		}catch(Exception e){
			mms="Error";
			System.out.println("error ===>> EducationService===>>::DeleteEducationTeacher( EducationBean id)".toString());
		}finally{
			MySQL.P_getClose();
		}
	  return mms;	
	}
	
	
	
	////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////// Update Education 
	
	
	public static String UpdateTeacherEducation(EducationBean ed){
		String mms="";
		try
		{
			int i=0;
			String sql ="UPDATE t_teacher_edu SET teacher_id=?,pramary_school=?,start_pramaryschool=?,end_pramaryschool=?,height_school=?"
					   + ",start_heightschool=?,end_heightschool=?,universety_school=?,start_universetyschool=?,end_universety_school=? "
					   + ",skill=?,level=?,teacher_type =? WHERE education_id=?";
			 PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
			
			 TeacherBean tb = ed.getTeacherbean() ;
				ps.setString(1,tb.getT_id());
				ps.setString(2, ed.getprimary_name());
				ps.setString(3, ed.getStart_date_primary());
				ps.setString(4, ed.getEnd_date_primary());
				ps.setString(5, ed.getHeigth_name());
				ps.setString(6, ed.getStart_date_heigth());
				ps.setString(7, ed.getEnd_date_heigth());
				ps.setString(8, ed.getUniverSety_name());
				ps.setString(9, ed.getStart_date_univerSety());
				ps.setString(10, ed.getEnd_date_univerSety());
				ps.setString(11, ed.getSkill());
				ps.setString(12, ed.getLevel());
				ps.setString(13,ed.getTeacher_type());
				ps.setString(14, ed.getEducation_id());
			 i= ps.executeUpdate();
			 if(i>0)
			 {
				 mms="Success";
			 }
			 
		}
		catch( Exception e)
		{
			mms="Error";
			System.out.println("Error ===>> EducationService ==>>::UpdateTeacherEducation(EducationBean ed) ");
		}
		finally
		{
			MySQL.P_getClose();
		}
		return mms;
	}
	
	
	
	/////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////// get max Id teacher
	
	public static String getTeacherIdMax()
    {   	       
		String code=null;
		  try
			  {
			             
			     String sql = "SELECT MAX(teacher_id) AS teacherID FROM t_teacher";
			     PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
			     ResultSet rs = ps.executeQuery();
			     if(rs.next())
				     {
				        String sCode = rs.getString("teacherID");
				        String l_code = l_cutePrefix(sCode, "Teacher");
				        int tmpCode = Integer.parseInt(l_code);
				        
				        code = "Teacher";
				        code += String.format("%04d", tmpCode);
				     }         	
			   }
		  catch(Exception e)
			  {
			               
			               	System.out.println("TeacherService::getNewId() => " + e.toString());
			  }
		  finally
			  {
			               	MySQL.P_getClose();
			  }
		       		
		       		return code;
	}
	
	//======== get Education By TeacherID =========
	public static EducationBean getEducationByTeacherID(String id){		
		EducationBean ed= new EducationBean();		
		try		{
			String sql = "SELECT * FROM t_teacher_edu te INNER JOIN t_teacher t ON t.teacher_id = te.teacher_id WHERE t.teacher_id=? ";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
	    	         ed.setEducation_id(rs.getString("education_id"));	    	         
	    	         TeacherBean tb = new TeacherBean();
	    	         tb.setT_id(rs.getString("teacher_id"));
	    	         ed.setTeacherbean(tb);  
	    	         
	    	         ed.setPrimary_name(rs.getString("pramary_school"));
	    	         ed.setStart_date_primary(rs.getString("start_pramaryschool"));
	    	         ed.setEnd_date_primary(rs.getString("end_pramaryschool"));
	    	         
	    	         ed.setHeigth_name(rs.getString("height_school"));
	    	         ed.setStart_date_heigth(rs.getString("start_heightschool"));
	    	         ed.setEnd_date_heigth(rs.getString("end_heightschool"));
	    	         
	    	         ed.setUniverSety_name(rs.getString("universety_school"));
	    	         ed.setStart_date_univerSety(rs.getString("start_universetyschool"));
	    	         ed.setEnd_date_univerSety(rs.getString("end_universety_school"));
	    	         
	    	         ed.setSkill(rs.getString("skill"));
	    	         ed.setLevel(rs.getString("level"));
	    	         ed.setTeacher_type(rs.getString("teacher_type"));	    
				}			 
		}catch( Exception e){		
			System.out.println("Error ===>> EducationService ==>>::SelectdataTeacherEducation(EducationBean ed) ");
		}finally{
			MySQL.P_getClose();
		}		
		return ed;
	}

}
