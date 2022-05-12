package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.RoomBean;
import db.mysql.MySQL;

public class RoomService {
	
	public static String getNewId(){
		String code = null;
		
        try{
        	String sql = "SELECT MAX(room_id) AS roomID FROM t_rooms";
        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
        	ResultSet rs = ps.executeQuery();
        	if(rs.next()){
        		String rCode = rs.getString("roomID");
        		String l_code = l_cutePrefix(rCode, "room");
        		int tmpCode = Integer.parseInt(l_code);
        		tmpCode ++;
        		
        		code = "room";
        		code += String.format("%03d", tmpCode);
        	}
        	
        }catch(Exception e){
        	code = "room";
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
		
	
	public static ArrayList<RoomBean> p_listAllRoom(){
		ArrayList<RoomBean> al = new ArrayList<RoomBean>();
		try{
			String sql = "SELECT * FROM t_rooms";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				RoomBean roomb = new RoomBean();
				roomb.setRoom_id(rs.getString("room_id"));
				roomb.setRoom(rs.getString("room_name"));
			
				al.add(roomb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	//===================Add New Room=========================
	public static String addNewClassroom(RoomBean rb){
		String message = "";
		try{
        	String sql = "INSERT INTO t_rooms VALUES(?,?)";
        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
        	ps.setString(1, rb.getRoom_id());
        	ps.setString(2, rb.getRoom());
        	int state = ps.executeUpdate();
        	if(state > 0)
        		message = "success";
        	
		}catch(Exception e){
			message = "error";
        	System.out.println("RoomService::addNewClassroom() => " + e.toString());
        }finally{
        	MySQL.P_getClose();;
        }
		return message;
	}
	//====================GetAClassroom====================
	public static RoomBean getAClassroom(String id){
		RoomBean rb = null;
		try{
			
			String sql = "SELECT * FROM t_rooms WHERE room_id=?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				
				rb = new RoomBean();
				rb.setRoom_id(rs.getString("room_id"));
				rb.setRoom(rs.getString("room_name"));
			}
			
		}catch(Exception e){
			System.out.println("RoomService::getAClassroom() => " + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return rb;
	}
	
	
	public static String updateClassroom(RoomBean rb){
		String message = "";
		try{
        	String sql = "UPDATE t_rooms SET room_name=? WHERE room_id=?";
        	PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
        	
        	ps.setString(1, rb.getRoom());
        	ps.setString(2, rb.getRoom_id());
        	
        	int state = ps.executeUpdate();
        	if(state > 0)
        		message = "success";
        		
		}catch(Exception e){
			message = "error";
        	System.out.println("RoomService::updateClassroom() => " + e.toString());
        }finally{
        	MySQL.P_getClose();
        }
		return message;
	}
	
	//Delete Room
		public static String deletRoom(String id){  
	        String msg = ""; 
	        try{  
	        	String sql = "DELETE FROM t_rooms WHERE room_id = ?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
	            ps.setString(1,id);  
	            int state = ps.executeUpdate(); 
	            if(state > 0){
	            	msg = "Success";
	            }    
	        }catch(Exception e){
	        		msg = "Error";
	        		e.printStackTrace();
	        	}finally{
	        		MySQL.P_getClose();
	        	}
	        return msg;  
	    }
}
