package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.DistrictBean;
import db.mysql.MySQL;

public class DistrictService {	
		public static ArrayList<DistrictBean> p_listAllDistrict(){
			ArrayList<DistrictBean> al = new ArrayList<DistrictBean>();
			try{
				String sql = "SELECT * FROM t_district";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ResultSet rs = ps.executeQuery();				
				while(rs.next()){
					DistrictBean db = new DistrictBean();
					db.setDistrict_id(rs.getInt("district_id"));
					db.setDistrict(rs.getString("district"));
					db.setProvince_id(rs.getInt("province_id"));			
					al.add(db);
				}
			}catch(Exception e){
				System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return al;
		}
	
	
	public static ArrayList<DistrictBean> p_listAllDistrictByProvinceID(int id){
		ArrayList<DistrictBean> al = new ArrayList<DistrictBean>();
		try{
			String sql = "SELECT * FROM t_district WHERE province_id = ?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();			
			while(rs.next()){
				DistrictBean db = new DistrictBean();
				db.setDistrict_id(rs.getInt("district_id"));
				db.setDistrict(rs.getString("district"));
				db.setProvince_id(rs.getInt("province_id"));				
				al.add(db);
			}
		}catch(Exception e){
			System.out.println("show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	// Auto ID
	public static int getNewId(){
		int code = 0;
        try{
        	String sql = "SELECT MAX(district_id) AS dID FROM t_district";
        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
        	ResultSet rs = ps.executeQuery();
        	if(rs.next()){
        		int tCode = rs.getInt("dID");        		
        		tCode += 1;
        		code = tCode;
        	}        	
        }catch(Exception e){
        	code = 0;
        	System.out.println("DistrictService::getNewId() => " + e.toString());
        }finally{
        	MySQL.P_getClose();
        }
        return code;
   }
	
	public static String addNewDistrict(DistrictBean db){
		String message = "";
		try{
        	String sql = "INSERT INTO t_district VALUES(?,?,?)";
        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
        	ps.setInt(1, getNewId());
        	ps.setString(2, db.getDistrict());
        	ps.setInt(3, db.getProvince_id());        	
        	int state = ps.executeUpdate();
        	if(state > 0 ){		
				message = "success";
			}
		}catch(Exception e){
			message = "error";
        	System.out.println("DistrictService::addNewDistrict() => " + e.toString());
        }finally{
        	MySQL.P_getClose();;
        }
		return message;
	}
}
