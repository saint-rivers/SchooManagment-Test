package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.AddressBean;
import bean.StudentBean;
import db.mysql.MySQL;

public class StudentService {
	public static String getNewId(){
		String code = null;
        try{
        	String sql = "SELECT MAX(student_id) AS studentID FROM t_student";
        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
        	ResultSet rs = ps.executeQuery();
        	if(rs.next()){
        		String sCode = rs.getString("studentID");
        		String l_code = l_cutePrefix(sCode, "stu");
        		int tmpCode = Integer.parseInt(l_code);
        		tmpCode ++;
        		
        		code = "stu";
        		code += String.format("%03d", tmpCode);
        	}
        	
        }catch(Exception e){
        	code = "stu";
        	code += String.format("%03d", 1);
        	System.out.println("RoomService::getNewId() => " + e.toString());
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
	
	public static ArrayList<StudentBean> P_listAllStudents(){
		ArrayList<StudentBean> al = new ArrayList<StudentBean>();
		try{
			String sql = "SELECT * FROM t_student";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				StudentBean sb = new StudentBean();
				sb.setStudent_id(rs.getString("student_id"));
				sb.setFirst_name(rs.getString("first_name"));
				sb.setLast_name(rs.getString("last_name"));
				sb.setGender(rs.getString("gender"));
				sb.setDob(rs.getString("dob"));
				AddressBean pob = getAddress(rs.getString("pob"));
				AddressBean current_address = getAddress(rs.getString("current_address"));
				sb.setAb(pob);
				sb.setAbCurrent(current_address);
				sb.setPhone(rs.getString("phone"));
				sb.setNationality(rs.getString("nationality"));
				sb.setGuardian_id(rs.getString("guardian_id"));
				sb.setPhoto_name(rs.getString("photo_name"));				
				al.add(sb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	public static AddressBean getAddress(String village_id)
	{
	    AddressBean ab = null;
	    try
		    {
		          String sql = "SELECT p.*, d.*, c.*, v.* FROM t_village v "
		          		      + "INNER JOIN ( t_commune c INNER JOIN ( t_district d INNER JOIN t_province p "
		          		      + "ON d.province_id = p.province_id ) ON c.district_id = d.district_id ) ON v.commune_id = c.commune_id "
		          		      + "WHERE village_id = ?";
		          PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
		          ps.setString(1, village_id);
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
		    } catch(Exception e){
		      e.printStackTrace();
		    }finally{
	    	   MySQL.P_getClose();
	       }
	    return ab;
	  }
	
	public static String addNewStudent(StudentBean sb){
		String message = "";
		try{
        	String sql = "INSERT INTO t_student VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
        	ps.setString(1, sb.getStudent_id());
        	ps.setString(2, sb.getFirst_name());
        	ps.setString(3, sb.getLast_name());
        	ps.setString(4, sb.getGender());
        	ps.setString(5, sb.getNationality());
        	ps.setString(6, sb.getDob());
        	ps.setInt(7, sb.getPob());
        	AddressBean abCurrent = sb.getAb();
        	ps.setInt(8, abCurrent.getVillage_id());
        	ps.setString(9, sb.getPhone());
        	ps.setString(10, sb.getGuardian_id());//guardian_id
        	ps.setString(11, sb.getPhoto_name());
        	System.out.println("photo Name = " + sb.getPhoto_name());        	
        	ps.setString(12, sb.getUser_id());
        	int state = ps.executeUpdate();
        	if(state > 0 ){		
				message = "success";
			}
		}catch(Exception e){
			message = "error";
        	System.out.println("StudentService::addNewStudent() => " + e.toString());
        }finally{
        	MySQL.P_getClose();;
        }
		return message;
	}
	
	public static StudentBean getAStudentUpdate(String id){
		StudentBean sb = null;
		try{
			String sql = "SELECT * FROM t_student WHERE student_id=?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				sb = new StudentBean();
				sb.setStudent_id(rs.getString("student_id"));
				sb.setFirst_name(rs.getString("first_name"));
				sb.setLast_name(rs.getString("last_name"));
				sb.setGender(rs.getString("gender"));
				sb.setNationality(rs.getString("nationality"));
				sb.setDob(rs.getString("dob"));
				AddressBean pob = getAddress(rs.getString("pob"));
				sb.setAb(pob);
				
				AddressBean current_address = getAddress(rs.getString("current_address"));
				sb.setAbCurrent(current_address);
				sb.setPhone(rs.getString("phone"));
				sb.setGuardian_id(rs.getString("guardian_id"));
				sb.setPhoto_name(rs.getString("photo_name"));				
			}
		}catch(Exception e){
			System.out.println("StudentService::getAStudentUpdate() => " + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return sb;
	}

	public static String updateAStudent(StudentBean sb){
		String message = "";
		try{
			if(!sb.getPhoto_name().equals("")){
				String sql = "UPDATE t_student SET first_name=?,last_name=?,gender=?,nationality=?,dob=?,pob=?,current_address=?,phone=?,guardian_id=?,photo_name=? WHERE student_id=?";
	        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	        	
	        	ps.setString(1, sb.getFirst_name());
	        	ps.setString(2, sb.getLast_name());
	        	ps.setString(3, sb.getGender());
	        	ps.setString(4, sb.getNationality());
	        	ps.setString(5, sb.getDob());
	        	
	        	AddressBean pob = sb.getAb();
	        	ps.setInt(6, pob.getVillage_id());
	        	
	        	AddressBean CurrentAddress = sb.getAbCurrent();
	        	ps.setInt(7, CurrentAddress.getVillage_id());
	        	
	        	ps.setString(8, sb.getPhone());
	        	ps.setString(9, sb.getGuardian_id());
	        	ps.setString(10, sb.getPhoto_name());	        	
	        	ps.setString(11, sb.getStudent_id());
	        	
	        	int state = ps.executeUpdate();
	        	if(state > 0)
	        		message = "success";
			}else{
				String sql = "UPDATE t_student SET first_name=?,last_name=?,gender=?,nationality=?,dob=?,pob=?,current_address=?,phone=?,guardian_id=? WHERE student_id=?";
	        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	        	
	        	ps.setString(1, sb.getFirst_name());
	        	ps.setString(2, sb.getLast_name());
	        	ps.setString(3, sb.getGender());
	        	ps.setString(4, sb.getNationality());
	        	ps.setString(5, sb.getDob());
	        	
	        	AddressBean pob = sb.getAb();
	        	ps.setInt(6, pob.getVillage_id());
	        	
	        	AddressBean CurrentAddress = sb.getAbCurrent();
	        	ps.setInt(7, CurrentAddress.getVillage_id());
	        	
	        	ps.setString(8, sb.getPhone());
	        	ps.setString(9, sb.getGuardian_id());
	        	ps.setString(10, sb.getStudent_id());
	        	
	        	int state = ps.executeUpdate();
	        	if(state > 0)
	        		message = "success";
			}
		}catch(Exception e){
			message = "error";
        	System.out.println("StudentService::updateAStudent() => " + e.toString());
        }finally{
        	MySQL.P_getClose();
        }
		return message;
	}
	
	public static ArrayList<StudentBean> getStudentGender(){
		ArrayList<StudentBean> list = new ArrayList<StudentBean>();
		
		try{
			String sql = "SELECT DISTINCT gender FROM t_student";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				StudentBean sb = new StudentBean();
				sb.setGender(rs.getString("gender"));
				list.add(sb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return list;
	}
	
	//=========== Delete Student =================
	public static String deleteStudent(String id){
		String msg = "";
			try{
				String sql = "DELETE FROM t_student WHERE student_id = ?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				
				int status = ps.executeUpdate();
				if(status > 0)
					msg = "Success";
				
			}catch(Exception e){
				msg = "Error";
				e.printStackTrace();
			}finally{
				MySQL.P_getClose();
			}
		return msg;
	}
	
	//======= Get Student By User Id ========
	public static StudentBean getAStudentByUserID(String user_id){
		StudentBean sb = null;
		try{
			String sql = "SELECT s.* FROM t_student s WHERE s.user_id=?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1, user_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				sb = new StudentBean();
				sb.setStudent_id(rs.getString("student_id"));
				sb.setFirst_name(rs.getString("first_name"));
				sb.setLast_name(rs.getString("last_name"));
				sb.setGender(rs.getString("gender"));
				sb.setNationality(rs.getString("nationality"));
				sb.setDob(rs.getString("dob"));
				AddressBean pob = getAddress(rs.getString("pob"));
				sb.setAb(pob);
				
				AddressBean current_address = getAddress(rs.getString("current_address"));
				sb.setAbCurrent(current_address);
				sb.setPhone(rs.getString("phone"));
				sb.setGuardian_id(rs.getString("guardian_id"));
				sb.setPhoto_name(rs.getString("photo_name"));				
			}
		}catch(Exception e){
			System.out.println("StudentService::getAStudentUpdate() => " + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return sb;
	}
}
