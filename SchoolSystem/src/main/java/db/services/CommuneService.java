package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.CommuneBean;
import bean.DistrictBean;
import db.mysql.MySQL;

public class CommuneService {
	
	public static ArrayList<CommuneBean> p_listAllCommuneByDistrictID(int id){
		ArrayList<CommuneBean> al = new ArrayList<CommuneBean>();
		try{
			String sql = "SELECT * FROM t_commune WHERE district_id = ?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				CommuneBean cb = new CommuneBean();
				cb.setCommune_id(rs.getInt("commune_id"));
				cb.setCommune(rs.getString("commune"));
				cb.setDistrict_id(rs.getInt("district_id"));
				
				al.add(cb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	public static ArrayList<CommuneBean> p_listAllCommune(){
		ArrayList<CommuneBean> al = new ArrayList<CommuneBean>();
		try{
			String sql = "SELECT * FROM t_commune";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				CommuneBean cb = new CommuneBean();
				cb.setCommune_id(rs.getInt("commune_id"));
				cb.setCommune(rs.getString("commune"));
				cb.setDistrict_id(rs.getInt("district_id"));
				
				al.add(cb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	// Auto ID
		public static int getNewId(){
			int code = 0;
	        try{
	        	String sql = "SELECT MAX(commune_id) AS cID FROM t_commune";
	        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
	        	ResultSet rs = ps.executeQuery();
	        	if(rs.next()){
	        		int tCode = rs.getInt("cID");
	        		
	        		tCode += 1;
	        		code = tCode;
	        	}
	        	
	        }catch(Exception e){
	        	code = 0;
	        	System.out.println("CommuneService::getNewId() => " + e.toString());
	        }finally{
	        	MySQL.P_getClose();
	        }
	        return code;
	   }
		
	public static String addNewCommune(CommuneBean cb){
		String message = "";
		try{
        	String sql = "INSERT INTO t_commune VALUES(?,?,?)";
        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
        	ps.setInt(1, getNewId());
        	ps.setString(2, cb.getCommune());
        	
        	DistrictBean db = cb.getDb();
        	ps.setInt(3, db.getDistrict_id());
			
        	int state = ps.executeUpdate();
        	if(state > 0 ){		
				message = "success";
			}
		}catch(Exception e){
			message = "error";
        	System.out.println("CommuneService::addNewCommune() => " + e.toString());
        }finally{
        	MySQL.P_getClose();;
        }
		return message;
	}
}
