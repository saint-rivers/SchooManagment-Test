package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.AddByBean;
import bean.UserBean;
import db.mysql.MySQL;

public class AddByService {
	
	
	
	public static String addNewAddby(AddByBean sb){
		String message = "";
		try{
        		 String sql1 = "INSERT INTO addby VALUES(?,?,?,?)";
             	PreparedStatement ps1 = MySQL.P_getConnection().prepareStatement(sql1);
                    UserBean user =new  UserBean();
             		ps1.setInt(1, sb.getAddby_id());
             		 user = sb.getUserbean();
             		ps1.setString(2,user.getUser_id());
 	            	ps1.setString(3,sb.getInputTime());
 	            	ps1.setString(4,sb.getInputDate());
 	            	int x = ps1.executeUpdate();
 	            	if(x > 0) {
 	            		message = "Success";
 	            		
 	            	}
				
			}catch(Exception e){
			message = "Error";
        	System.out.println("AddByService::addNewAddBy() => " + e.toString());
        }finally{
        	MySQL.P_getClose();;
        }
		return message;
}
	
	//addby Delete
	
	public static String deleteSubject(String id){  
        String msg = ""; 
        try{  
        	String sql = "DELETE FROM addby WHERE addby_id = ? ";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
            ps.setString(1,id);
            
            int state = ps.executeUpdate(); 
            if(state > 0){
            	
            	msg = "Success";
            	} 
        }catch(Exception e){
        		msg = "Error";
        		e.printStackTrace();
        }finally{MySQL.P_getClose();}
        return msg;  
    }
	// AddbySerVice 
	
	public static int getNewId(){
		int code = 0;
          try{
	        	String sql = "SELECT MAX(addby_id) AS cID FROM addby";
	        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
	        	ResultSet rs = ps.executeQuery();
	        	if(rs.next()){
	        		int tCode = rs.getInt("cID");
	        		tCode += 1;
	        		code = tCode;
        	     }
          }
          catch(Exception e){
        	code = 0;
        	System.out.println("GetIdAddbyService::getNewIdAddbyService() => " + e.toString());
          }
          finally{
        	MySQL.P_getClose();
          }
        return code;
   }
	
}
