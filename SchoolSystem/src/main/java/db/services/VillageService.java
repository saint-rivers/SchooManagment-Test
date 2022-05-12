package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.CommuneBean;
import bean.VillageBean;
import db.mysql.MySQL;

public class VillageService {
	
	public static ArrayList<VillageBean> p_listAllVillageByCommuneID(int id){
		ArrayList<VillageBean> al = new ArrayList<VillageBean>();
		try{
			String sql = "SELECT * FROM t_village WHERE commune_id = ?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				VillageBean vb = new VillageBean();
				vb.setVillage_id(rs.getInt("village_id"));
				vb.setVillage(rs.getString("village"));
				vb.setCommune_id(rs.getInt("commune_id"));
				al.add(vb);
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
		        	String sql = "SELECT MAX(village_id) AS vID FROM t_commune";
		        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
		        	ResultSet rs = ps.executeQuery();
		        	if(rs.next()){
		        		int tCode = rs.getInt("vID");
		        		
		        		tCode += 1;
		        		code = tCode;
		        	}
		        	
		        }catch(Exception e){
		        	code = 0;
		        	System.out.println("VillageService::getNewId() => " + e.toString());
		        }finally{
		        	MySQL.P_getClose();
		        }
		        return code;
		   }
			
	public static String addNewVillage(VillageBean vb){
		String message = "";
		try{
        	String sql = "INSERT INTO t_village VALUES(?,?,?)";
        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
        	ps.setInt(1, getNewId());
        	ps.setString(2, vb.getVillage());
        	
        	CommuneBean cb = vb.getCb();
        	ps.setInt(3, cb.getCommune_id());
			
        	int state = ps.executeUpdate();
        	if(state > 0 ){		
				message = "success";
			}
		}catch(Exception e){
			message = "error";
        	System.out.println("VillageService::addNewVillage() => " + e.toString());
        }finally{
        	MySQL.P_getClose();
        }
		return message;
	}
}
