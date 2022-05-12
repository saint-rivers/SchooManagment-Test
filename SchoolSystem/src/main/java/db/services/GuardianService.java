package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.AddressBean;
import bean.GuardianBean;
import db.mysql.MySQL;

public class GuardianService {
	
	public static String getNewId(){
		String code = null;
		
        try{
        	String sql = "SELECT MAX(guardian_id) AS guardianID FROM t_guardian";
        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
        	ResultSet rs = ps.executeQuery();
        	if(rs.next()){
        		String gCode = rs.getString("guardianID");
        		String l_code = l_cutePrefix(gCode, "gdian");
        		int tmpCode = Integer.parseInt(l_code);
        		tmpCode ++;
        		
        		code = "gdian";
        		code += String.format("%03d", tmpCode);
        	}
        	
        }catch(Exception e){
        	code = "gdian";
        	code += String.format("%03d", 1);
        	System.out.println("GuardianService::getNewId() => " + e.toString());
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
	
	public static ArrayList<GuardianBean> P_listAllGuardians(){
		ArrayList<GuardianBean> al = new ArrayList<GuardianBean>();
		try{
			String sql = "SELECT * FROM t_guardian";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				GuardianBean gb = new GuardianBean();
				gb.setGuardian_id(rs.getString("guardian_id"));
				gb.setFather_name(rs.getString("father_name"));
				gb.setFather_job(rs.getString("father_job"));
				gb.setMother_name(rs.getString("mother_name"));
				gb.setMother_job(rs.getString("mother_job"));
				gb.setGuardian_phone(rs.getString("guardian_phone"));
				
				AddressBean ab = getAddress(rs.getInt("village_id"));
				gb.setAb(ab);
				
				al.add(gb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	public static AddressBean getAddress(int village_id)
	{
	    AddressBean ab = null;
	    try {
		          String sql = "SELECT p.*, d.*, c.*, v.* FROM t_village v "
		          		      + "INNER JOIN ( t_commune c INNER JOIN ( t_district d INNER JOIN t_province p "
		          		      + "ON d.province_id = p.province_id ) ON c.district_id = d.district_id ) ON v.commune_id = c.commune_id "
		          		      + "WHERE village_id = ?";
		          PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
		          ps.setInt(1, village_id);
		          ResultSet rs = ps.executeQuery();
		          while(rs.next()) {
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
	
	public static String addNewGuardian(GuardianBean gb){
		String message = "";
		try{
        	String sql = "INSERT INTO t_guardian VALUES(?,?,?,?,?,?,?)";
        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
        	ps.setString(1, gb.getGuardian_id());
        	ps.setString(2, gb.getFather_name());
        	ps.setString(3, gb.getFather_job());
        	ps.setString(4, gb.getMother_name());
        	ps.setString(5, gb.getMother_job());
        	ps.setString(6, gb.getGuardian_phone());
        	
        	AddressBean ab = gb.getAb();
        	ps.setInt(7, ab.getVillage_id());
        
        	int state = ps.executeUpdate();
        	if(state > 0 ){		
				message = "success";
			}
		}catch(Exception e){
			message = "error";
        	System.out.println("GuardianService::addNewGuardian() => " + e.toString());
        }finally{
        	MySQL.P_getClose();;
        }
		return message;
	}
	
	public static GuardianBean p_getAGuardian(String id){
		GuardianBean gb = null;
		try{
			String sql = "SELECT * FROM t_guardian WHERE guardian_id = ?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				gb = new GuardianBean();
				gb.setGuardian_id(rs.getString("guardian_id"));
				gb.setFather_name(rs.getString("father_name"));
				gb.setFather_job(rs.getString("father_job"));
				gb.setMother_name(rs.getString("mother_name"));
				gb.setMother_job(rs.getString("mother_job"));
				gb.setGuardian_phone(rs.getString("guardian_phone"));
				
				AddressBean ab = getAddress(rs.getInt("village_id"));
				gb.setAb(ab);
		           
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return gb;
	}
	
	public static String updateGuardian(GuardianBean gb){
		String message = "";
		try{
        	String sql = "UPDATE t_guardian SET father_name=?,father_job=?,mother_name=?,mother_job=?,guardian_phone=?,village_id=? WHERE guardian_id=?";
        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
        	
        	ps.setString(1, gb.getFather_name());
        	ps.setString(2, gb.getFather_job());
        	ps.setString(3, gb.getMother_name());
        	ps.setString(4, gb.getMother_job());
        	ps.setString(5, gb.getGuardian_phone());
        	
        	AddressBean ab = gb.getAb();
        	ps.setInt(6, ab.getVillage_id());
        	ps.setString(7, gb.getGuardian_id());
        	
        	int state = ps.executeUpdate();
        	if(state > 0)
        		message = "success";
        		
		}catch(Exception e){
			message = "error";
        	System.out.println("GuardianService::updateGuardian() => " + e.toString());
        }finally{
        	MySQL.P_getClose();
        }
		return message;
	}
	
	public static GuardianBean p_getAGuardianByGuardianID(String id){
		GuardianBean gb = null;
		try{
			String sql = "SELECT g.* FROM t_guardian g INNER JOIN t_student s ON g.guardian_id = s.guardian_id WHERE s.guardian_id = ?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				gb = new GuardianBean();
				gb.setGuardian_id(rs.getString("guardian_id"));
				gb.setFather_name(rs.getString("father_name"));
				gb.setFather_job(rs.getString("father_job"));
				gb.setMother_name(rs.getString("mother_name"));
				gb.setMother_job(rs.getString("mother_job"));
				gb.setGuardian_phone(rs.getString("guardian_phone"));
				
				AddressBean ab = getAddress(rs.getInt("village_id"));
				gb.setAb(ab);
		           
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return gb;
	}
}
