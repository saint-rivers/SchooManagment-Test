package db.services;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.AddressBean;
import bean.CommuneBean;
import bean.CountryBean;
import bean.DistrictBean;
import bean.ProvinceBean;
import bean.SubjectTeacherBean;
import bean.TeacherBean;
import bean.VillageBean;
import db.mysql.MySQL;

public class TeacherService  {
	
	//===========================================================================================================
	//                                       DeclarVaraible in TeacherService
	//===========================================================================================================
	    static CommuneBean commune = new CommuneBean();
	    static CountryBean country = new CountryBean();
		static DistrictBean district = new DistrictBean();
		static 	ProvinceBean province = new ProvinceBean();
		static VillageBean village = new VillageBean();

	
		//=============================== Search Teacher by Teacher Name ==========================
		  public static ArrayList<String >listTeacherAutoComplete(String teacher){
			  
			    ArrayList<String> list = new ArrayList<String>();			    
			    try{
				      String sql="SELECT teacher_id,first_name,last_name,gender FROM t_teacher WHERE teacher_id LIKE? OR first_name LIKE? OR last_name LIKE?";
				      PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				      ps.setString(1,"%"+ teacher +"%");
				      ps.setString(2,"%"+ teacher +"%");
				      ps.setString(3,"%"+ teacher +"%");
				      ResultSet rs = ps.executeQuery();
				      
				      while (rs.next()){
				    	  String result = rs.getString("teacher_id") + ":" + rs.getString("first_name") + ":" + rs.getString("last_name");
				    	  
				    	  list.add(result);
				      }
			    }catch(Exception e){
			      e.toString();
			    
			    }finally{
			      MySQL.P_getClose();
			    
			  }
			    return list;
			}
		  //listTeacherAutoComplete
		  
		  //================== AddNewTeacherSubject =================================
			public static String addNewTeacherSubject(SubjectTeacherBean stb){
				String message = "";
				try{
					String sql = "INSERT INTO tblteachersubjects VALUES(?,?)";
					PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
					
					ps.setString(1, stb.getTeacherID());
					ps.setString(2, stb.getSubjectID());
					
					int state = ps.executeUpdate();
					if(state > 0 ){
						message = "Success";
					}
				}catch(Exception e){
					message = "Error";
					System.out.println("TeacherService::addNewTeacherSubject(...) => " + e.toString());
				}finally{
					MySQL.P_getClose();
				}
				return message;
			}
		
			//=================================== Insert Multi Row of SubjectTeacher ============================
			   public static String insertMultiSubjectTeacher(ArrayList<SubjectTeacherBean> list){
				   String msg ="";
				   
				   try{
					   
				   		for(int i=0;i<list.size();i++){
				   			String sql = "INSERT INTO tblteachersubjects VALUES(?,?)";
				   			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				   			SubjectTeacherBean stb = (SubjectTeacherBean) list.get(i);
				   			ps.setString(1, stb.getTeacherID());
				   			ps.setString(2, stb.getSubjectID());
				   			
				   			int state = ps.executeUpdate();
				   			if(state > 0){
				   				msg = "Success";
				   			}
				   		}
				   }catch(Exception e){
					   msg = "Error";
					   System.out.println("TeacherService::insertMultiSubjectTeacher() => " + e.toString());
				   }finally{
					   MySQL.P_getClose();
				   }
				   return msg;
			   }
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////            GET ALL LIST IN TEACHER 					       ////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

		///  class Address using Address
		
	 String url = "";
	 static int i=0;
  public static ArrayList<TeacherBean> P_listInformation_Teacher()
	{
		
		ArrayList<TeacherBean>tb = new ArrayList<TeacherBean>();
		try
			{
				String sqlinfor = "SELECT * FROM t_teacher"; 
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sqlinfor);
				ResultSet rs = ps.executeQuery();
				    while(rs.next()){
					    TeacherBean teb = new TeacherBean();
						   	teb.setT_id(rs.getString("teacher_id"));
						   	teb.setT_fname(rs.getString("first_name"));
						   	teb.setT_lname(rs.getString("last_name"));
						   	teb.setT_gender(rs.getString("gender"));
							teb.setNationality(rs.getString("nationality"));
							teb.setNationality_id(rs.getString("nationality_id"));
						   	teb.setT_dob(rs.getString("dob"));
							AddressBean ab = getAddress(rs.getInt("pob"));
							teb.setaddress_teacher(ab);
						   	teb.setT_phone(rs.getString("phone"));
						   
						   	teb.setStustus(rs.getString("status"));
						  
						    AddressBean adbean = getAddress(rs.getInt("currentaddress"));
						     teb.setCurrent_address(adbean);
						   	teb.setT_photo(rs.getString("photo"));						   	
						 	teb.setCountry(rs.getString("country"));
							
						   	tb.add(teb); 	
					}
		 }catch(Exception e){
		   System.out.print("TeacherService Is Error <==> Function Display_InformatoinTeacher() :<==>:===>" + e.toString());
		  } finally{
			MySQL.P_getClose();
		}
	return tb;
}

	public static AddressBean getAddress(int village_id)
	{
	    AddressBean ab = null;
	    try
		    {
		          String sql = "SELECT p.*, d.*, c.*, v.* FROM t_village v "
		          		      + "INNER JOIN ( t_commune c INNER JOIN ( t_district d INNER JOIN t_province p "
		          		      + "ON d.province_id = p.province_id ) ON c.district_id = d.district_id ) ON v.commune_id = c.commune_id "
		          		      + "WHERE village_id = ?";
		          PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
		          ps.setInt(1, village_id);
		          ResultSet rs = ps.executeQuery();
		          while(rs.next())
			          {
			            ab = new AddressBean();
			            ab.setProvince_id(rs.getInt("province_id"));
			            ab.setProvince(rs.getString("province"));
			            ab.setDistrict_id(rs.getInt("district_id"));
			            ab.setDistrict(rs.getString("district"));
			            ab.setCommune_id(rs.getInt("commune_id"));
			            ab.setCommune(rs.getString("commune"));
			            ab.setVillage_id(rs.getInt("village_id"));
			            ab.setVillage(rs.getString("village"));
			          }
		    }
	    catch(Exception e)
		    {
		      e.printStackTrace();
		    }
	       finally{
	    	   MySQL.P_getClose();
	       }
	    return ab;
	  }

//////////////////////////                     GET ID AUTO IN TEACHER					    ////////////////////
	           
	public static String getteacherId()
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
				        tmpCode ++;
				        code = "Teacher";
				        code += String.format("%04d", tmpCode);
				     }         	
			   } catch(Exception e){
	               	code = "Teacher";
	               	code += String.format("%04d", 1);
	               	System.out.println("Teacher::getNewTeacherIdAuto() => " + e.toString());
			  } finally{
			        MySQL.P_getClose();
			  }
		       return code;
	}

	private static String l_cutePrefix(String str, String pref)
	{
		if(str != null && pref != null && str.startsWith(pref)){
				return str.substring(pref.length());
			}
		return str;
	}
		        

   public static String P_AddTeacher_InforMation(TeacherBean ub){
		String sms = "";						
		try{
			String sql = "INSERT INTO t_teacher VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1,ub.getT_id());
			ps.setString(2, ub.getT_fname());
			ps.setString(3, ub.getT_lname());
			ps.setString(4, ub.getT_gender());
			ps.setString(5, ub.getNationality());
			ps.setString(6, ub.getNationality_id());
			ps.setString(7, ub.getT_dob());
			 
			ps.setInt(8,ub.getPob());
			ps.setString(9, ub.getT_phone());			
			ps.setString(10, ub.getStustus());
	
			AddressBean abb = ub.getaddress_teacher();
			ps.setInt(11,abb.getVillage_id() );
			ps.setString(12, ub.getT_photo());			
			ps.setString(13, ub.getCountry());
			ps.setString(14, ub.getUser_id());
			int state = ps.executeUpdate();
		
			if(state>0){
				      sms=("Success");					     
				}
	    }catch(Exception e)	{
			sms= "Error";
			System.out.println("TeacherService Is Error <==> Function AddTeacher(.....) :<==>:===>" + e.toString());
		}finally{
        	MySQL.P_getClose();;
        }
    return sms;						
 }
   
   public static TeacherBean getATeacher(String teacher_id)
	{
		TeacherBean ut= null;
		try
			{
				String sql = "SELECT * FROM t_teacher WHERE teacher_id=? ";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, teacher_id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
						ut = new TeacherBean();
						ut.setT_id(rs.getString("teacher_id"));
					   	ut.setT_fname(rs.getString("first_name"));
					   	ut.setT_lname(rs.getString("last_name"));
					   	ut.setT_gender(rs.getString("gender"));
						ut.setNationality(rs.getString("nationality"));
						ut.setNationality_id(rs.getString("nationality_id"));
					   	ut.setT_dob(rs.getString("dob"));
						AddressBean ab= getAddress(rs.getInt("pob"));
						ut.setaddress_teacher(ab);
					   	ut.setT_phone(rs.getString("phone"));
					 
					    AddressBean adbean = getAddress(rs.getInt("currentaddress"));
					    ut.setCurrent_address(adbean);
					   	ut.setStustus(rs.getString("status"));
					   	ut.setT_photo(rs.getString("photo"));					  
					   	ut.setCountry(rs.getString("country"));
					
					}
				
			}catch(Exception e)
			{
				System.out.println("TeacherService :: updateTeacher() => " + e.toString());
			}finally{
					MySQL.P_getClose();
			}
		return ut;
	}
   
   ////////////////////////////////////////////////////////////////////////
   
   public static ArrayList<TeacherBean> getATeacherGender()
  	{
  		ArrayList<TeacherBean>al = new ArrayList<TeacherBean>();
  		try
  			{
  				
  				String sql = "SELECT DISTINCT gender FROM t_teacher";
  				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
  				ResultSet rs = ps.executeQuery();
  				
  				while(rs.next())
  					{
  						TeacherBean ut = new TeacherBean();
  					   	ut.setT_gender(rs.getString("gender"));
  					   	al.add(ut);
  					}
  			}catch(Exception e){
  				System.out.println("TeacherService :: Selected Gender() => " + e.toString());
  			}finally{
  				MySQL.P_getClose();
  			}
  		return al;
  	}
   
   /////////////////////////////////////////////////////////////////////////////////
   ////////////////////////////////////////////////////////////////////////////////
   
   public static ArrayList<TeacherBean> getAStaTus()
 	{
 		ArrayList<TeacherBean>al = new ArrayList<TeacherBean>();
 		try
 			{
 				
 				String sql = "SELECT DISTINCT status FROM t_teacher";
 				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
 				ResultSet rs = ps.executeQuery();
 				
 				while(rs.next())
 					{
 						TeacherBean ut = new TeacherBean();
 					   	ut.setStustus(rs.getString("status"));
 					   	al.add(ut);
 					}
 			}catch(Exception e){
 				System.out.println("TeacherService :: Selected Status() => " + e.toString());
 			}finally{
 				MySQL.P_getClose();
 			}
 		return al;
 	}
   
   ///////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////
   
   
   public static ArrayList<TeacherBean> getAcountry()
	{
		ArrayList<TeacherBean>al = new ArrayList<TeacherBean>();
		try
			{
				
				String sql = "SELECT DISTINCT country FROM t_teacher";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
					{
						TeacherBean ut = new TeacherBean();
					   	ut.setCountry(rs.getString("country"));
					   	al.add(ut);
					}
			}catch(Exception e){
				System.out.println("TeacherService :: Selected Country() => " + e.toString());
			}finally{
				MySQL.P_getClose();
			}
		return al;
	}
   
   //////////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////////
   
   public static String UpdateATeacher(TeacherBean ub){
	    String message = "";
	    try{
	      if(!ub.getT_photo().equals("")){
	    	 
	  		
	  			String sql = "UPDATE t_teacher SET first_name=?,last_name=?,gender=?"
	  					    + ",nationality=?,nationality_id=?,dob=?,pob=?,phone=?"
	  					    + ",status=?,currentaddress=?,photo=?,country =? WHERE teacher_id=?";
	  			
	  			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	  			ps.setString(1, ub.getT_fname());
	  			ps.setString(2, ub.getT_lname());
	  			ps.setString(3, ub.getT_gender());
	  			ps.setString(4, ub.getNationality());
	  			ps.setString(5, ub.getNationality_id());
	  			ps.setString(6,ub.getT_dob());
	  			AddressBean ab = ub.getaddress_teacher();
	  			ps.setInt(7,ab.getVillage_id());
	  			
	  			ps.setString(8, ub.getT_phone());
	  			
	  			ps.setString(9, ub.getStustus());
	  			AddressBean at = ub.getCurrent_address();
	  			ps.setInt(10,at.getVillage_id());
	  			ps.setString(11,ub.getT_photo());	  			
	  			ps.setString(12, ub.getCountry());
	  			ps.setString(13, ub.getT_id());
	  			int state = ps.executeUpdate();
	  			 
	  			if(state>0)
	  				{
	  					message="Success";
	  				}
	      }else{
	    	  	     
	    	  String sql = "UPDATE t_teacher SET first_name=?,last_name=?,gender=?"
					    + ",nationality=?,nationality_id=?,dob=?,pob=?,phone=?"
					    + ",status=?,currentaddress=?,country=? WHERE teacher_id=?";
			
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1, ub.getT_fname());
			ps.setString(2, ub.getT_lname());
			ps.setString(3, ub.getT_gender());
			ps.setString(4, ub.getNationality());
			ps.setString(5, ub.getNationality_id());
			ps.setString(6,ub.getT_dob());
			AddressBean ab = ub.getaddress_teacher();
			ps.setInt(7,ab.getVillage_id());
			ps.setString(8, ub.getT_phone());
			
			ps.setString(9, ub.getStustus());
			AddressBean at= ub.getCurrent_address();
			ps.setInt(10,at.getVillage_id());
			ps.setString(11, ub.getCountry());
			ps.setString(12, ub.getT_id());
			
			int state = ps.executeUpdate();
			 
			if(state>0)
				{
					message="Success";
				}
	      }
	    }catch(Exception e){
	      message = "Error";
	          System.out.println("TeacherService::updateATeacher() => " + e.toString());
	        }finally{
	          MySQL.P_getClose();
	        }
	    return message;
	  }
   
   
   
   ////////////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////////
   
   
	public static String P_Delete_Teacher(String id) {  
	    String msg = ""; 
	    try{  
	    	String sql = "DELETE FROM t_teacher WHERE teacher_id = ?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	        ps.setString(1,id);  
	        int state=  ps.executeUpdate(); 
	        if(state>0 ){
	    	  	msg = "Success";
		      }
		            
	    }catch(Exception e){
	    		msg = "Error";
		    	e.printStackTrace();
		    }finally {
				MySQL.P_getClose();
			}  
	    return msg;  
	}

	//================= list Teachers by Class id ================
	   public static ArrayList<TeacherBean> getTeacherBySubjectID(String id){
			ArrayList<TeacherBean> al = new ArrayList<TeacherBean>();
			try{
				String sql = "SELECT t.teacher_id,t.first_name,t.last_name,s.subject_name FROM t_teacher t INNER JOIN (tblteachersubjects ts INNER JOIN t_subject s ON s.subject_id = ts.subject_id)ON ts.teacher_id = t.teacher_id WHERE s.subject_id = ?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					TeacherBean tb = new TeacherBean();
					tb.setT_id(rs.getString("teacher_id"));
					tb.setT_fname(rs.getString("first_name"));
					tb.setT_lname(rs.getString("last_name"));
					
					al.add(tb);
				}
			}catch(Exception e){
				System.out.println("TeacherClassService::getTeacherBySubjectID() => " + e.toString());System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return al;
		}
	   // ============ get Teacher By UserID =============
	   public static TeacherBean getATeacherByUserID(String user_id)
		{
			TeacherBean ut= null;
			try{
					String sql = "SELECT * FROM t_teacher WHERE user_id =? ";
					PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
					ps.setString(1, user_id);
					ResultSet rs = ps.executeQuery();
					
					while(rs.next()){
							ut = new TeacherBean();
							ut.setT_id(rs.getString("teacher_id"));
						   	ut.setT_fname(rs.getString("first_name"));
						   	ut.setT_lname(rs.getString("last_name"));
						   	ut.setT_gender(rs.getString("gender"));
							ut.setNationality(rs.getString("nationality"));
							ut.setNationality_id(rs.getString("nationality_id"));
						   	ut.setT_dob(rs.getString("dob"));
							AddressBean ab= getAddress(rs.getInt("pob"));
							ut.setaddress_teacher(ab);
						   	ut.setT_phone(rs.getString("phone"));
						   
						    AddressBean adbean = getAddress(rs.getInt("currentaddress"));
						    ut.setCurrent_address(adbean);
						   	ut.setStustus(rs.getString("status"));
						   	ut.setT_photo(rs.getString("photo"));						   	
						   	ut.setCountry(rs.getString("country"));						
						}					
				}catch(Exception e){
					System.out.println("TeacherService :: getATeacherByUserID() => " + e.toString());
				}finally{
						MySQL.P_getClose();
				}
			return ut;
		}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////                 IN TEACHER					           ////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////		   

   
   
//   
//   
//		
//		public static ArrayList<TeacherBean> P_listEducation_Teacher()
//		{
//			ArrayList<TeacherBean >tb = new ArrayList<TeacherBean >();
//		 try
//		  {
//			  
//	         // select teacher Education 
//			
//			String sqlEducatoin ="SELECT t.teacher_id ,Concat(t.first_name, '' ,t.last_name )as Name  ,te.school_name ,"
//					            + "te.level,te.skill,te.start_year ,te.end_year FROM t_teacher t"
//					            +"INNER JOIN t_teacher_edu te ON te.education_id = t.Educactoin_id WHERE t.teacher_id ";           
//			  
//			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sqlEducatoin);
//			ResultSet rs = ps.executeQuery();
//			  if(rs.next())
//			    {
//				 
//				 TeacherBean teb = new TeacherBean();
//				 EducationBean eb =new EducationBean();
//					 
//					   	teb.setT_id(rs.getString("teacher_id"));
//					   	teb.setT_fname(rs.getString("first_name"));
//					   	teb.setT_lname(rs.getString("last_name"));
//					   	eb.setSchool_name(rs.getString("school_name"));
//					   	eb.setLevel(rs.getString("level"));
//					   	eb.setSkill(rs.getString("skill"));
//					   	eb.setStart(rs.getString("start"));
//					   	eb.setEnd(rs.getString("end"));
//					   	teb.setEb(eb);
//					   	tb.add(teb);
//					   	
//				}
//		 }
//		catch(Exception e)
//			  {
//			   System.out.print("TeacherService Is Error <==> Function Display_TeacherInformatoin() :<==>:===>" + e.toString());
//			  }
//		finally
//			{
//					MySQL.P_getClose();
//			}
//		return tb;
//	}
//	
////====================================================================================================================
////                                             Display Teacher Detail 
////====================================================================================================================
//			
//			public static ArrayList<TeacherBean> P_listDetail_Teacher()
//			{
//				ArrayList<TeacherBean >tb = new ArrayList<TeacherBean >();
//			 try
//			  {
//				// select all Table Teacher
//				
//				String sqlDetail ="SELECT t.first_name ,t.last_name ,t.gender ,t.dob ,t.phone ,v.village,m.commune ,d.district,p.province,"
//						          + "c.country ,t.nationality ,t.passport_no ,t.status ,t.photo , te.school_name ,te.level,te.skill,"
//						          + "te.start_year ,te.end_year FROM t_teacher_edu te INNER JOIN ( t_teacher t INNER JOIN ( t_village v"
//						          + " INNER JOIN ( t_commune m INNER JOIN ( t_district d INNER JOIN ( t_province p INNER JOIN  t_country c"
//						          + "ON p.country_id = c.country_id ) ON d.pro_id = p.pro_id) ON m.dist_id = d.dist_id)ON v.com_id = m.com_id)"
//						          + "ON  v.village_id = t.address) ON te.education_id = t.Educactoin_id where te.education_id";
//				  
//			  
//				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sqlDetail);
//				ResultSet rs = ps.executeQuery();
//				  if(rs.next())
//				    {
//					 
//					 TeacherBean teb = new TeacherBean();
//					 EducationBean eb =new EducationBean();
//	
//						 
//						   	teb.setT_id(rs.getString("teacher_id"));
//						   	teb.setT_fname(rs.getString("first_name"));
//						   	teb.setT_lname(rs.getString("last_name"));
//						   	teb.setT_gender(rs.getString("gender"));
//						   	teb.setT_dob(rs.getString("dob"));
//						   	
//						    village.setVillage(rs.getString("village"));
//						    commune.setCommune(rs.getString("commune"));
//						   	district.setDistrict(rs.getString("district"));
//						   	province.setProvince(rs.getString("province"));
//						   	country.setCountry(rs.getString("country"));
//						   	
//						   	teb.setT_phone(rs.getString("phone"));
//						   	teb.setT_photo(rs.getString("Photo"));
//						   	teb.setNationality(rs.getString("nationality"));
//						   	
//						   	eb.setSchool_name(rs.getString("school_name"));
//						   	eb.setLevel(rs.getString("level"));
//						   	eb.setSkill(rs.getString("skill"));
//						   	eb.setStart(rs.getString("start"));
//							eb.setEnd(rs.getString("end"));
//						   	teb.setPassport_no(rs.getString("passport_no"));
//						   	teb.setStustus(rs.getString("status"));
//						   	
//						  
//						   	    teb.setEb(eb);
//						     	tb.add(teb);
//						   	
//					}
//			 }
//			catch(Exception e)
//				{
//				   System.out.print("TeacherService Is Error <==> Function Display_Detail_Teacher() :<==>:===>" + e.toString());
//				}
//			 finally
//			    {
//					MySQL.P_getClose();
//				}
//			return tb;
//		}
//
//				
////==========================================================================================================
////                                             Delete From Table  Teacher
////============================================================================================================				
//					
//				
//
//	
////===========================================================================================================
////                                       The End TeacherService
////===========================================================================================================
//
//




}
