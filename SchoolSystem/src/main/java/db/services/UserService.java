
package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.PermissionsBean;
import bean.RoleBean;
import bean.UserBean;
import db.mysql.MySQL;

public class UserService {
	
	public static String getNewId(){
		String code = null;
		
        try{
        	String sql = "SELECT MAX(user_id) AS userID FROM t_user_account";
        	PreparedStatement ps =MySQL.P_getConnection().prepareStatement(sql);
        	ResultSet rs = ps.executeQuery();
        	if(rs.next()){
        		String uCode = rs.getString("userID");
        		String l_code = l_cutePrefix(uCode, "user");
        		int tmpCode = Integer.parseInt(l_code);
        		tmpCode ++;
        		
        		code = "user";
        		code += String.format("%03d", tmpCode);
        	}        	
        }catch(Exception e){
        	code = "user";
        	code += String.format("%03d", 1);
        	System.out.println("UserService::getNewId() => " + e.toString());
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
	
	public static String P_getLogin(UserBean ub){
		String url = "";
		try{
			String sql = "SELECT * FROM t_user_account WHERE user_name=? AND password=?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1, ub.getUser_name());
			ps.setString(2, ub.getPassword());
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				
				url="./view/template/PageTemplate";
			}else{
				url="./AccessSystem";
			}
		}catch(Exception e){
			e.toString();
			url="./AccessSystem";
		}finally{
			MySQL.P_getClose();
		}
		return url;
	}
	
	public static UserBean P_getLoginPermission(UserBean ub){
		UserBean uBean = null;
		
		try{
			String sql="SELECT u.*,p.*,r.* FROM t_user_account u INNER JOIN (t_permissions p INNER JOIN t_roles r ON p.role_id = r.role_id )ON u.user_id = p.user_id WHERE user_name=? AND password=?" ;
			
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1 , ub.getUser_name());
			ps.setString(2, ub.getPassword());
			
			ResultSet rs = ps.executeQuery();
			uBean = new UserBean(); 
			
			if(rs.next()){
				uBean.setUser_id(rs.getString("user_id"));
				uBean.setUser_name(rs.getString("user_name"));
				uBean.setPassword(rs.getString("password"));
				uBean.setPhoto_name(rs.getString("photo_name"));				
				
				PermissionsBean pb = new PermissionsBean();
				pb.setAdd(rs.getInt("add_insert"));
				pb.setEdit(rs.getInt("edit_update"));
				pb.setDelete(rs.getInt("remove_delete"));
				pb.setSearch(rs.getInt("search_query"));
				pb.setReport(rs.getInt("report"));
				
				RoleBean rb = new RoleBean();
				rb.setRole_id(rs.getString("role_id"));
				rb.setRole_name(rs.getString("role_name"));
				uBean.setRb(rb);
				if(rs.getString("role_id").equals("role005")) {
					uBean.setUrl("./view/template/PageTemplate");
				}
				if(rs.getString("role_id").equals("role001")) {
					uBean.setUrl("./view/panel/TeacherPanel");
				}
				if(rs.getString("role_id").equals("role002")) {
					uBean.setUrl("./view/panel/StudentPanel");
				}
			}
			else{
				uBean.setUrl("./AccessSystem");
			}
		}catch(Exception e){
			System.out.println("UserService::P_getLoginPermission(...) => " + e.toString());
			uBean = new UserBean();
			uBean.setUrl("./AccessSystem");
		}finally{
			MySQL.P_getClose();
		}
		return uBean;
	}
	
	
	//Function Register Account
	public static String P_addNewRegisterUserAccount(UserBean ub){
		String msg = "";
		
		try{
			String sql = "INSERT INTO t_user_account VALUES(?,?,?,?,?,?,?)";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			
			ps.setString(1, ub.getUser_id());
			ps.setString(2, ub.getUser_name());
			ps.setString(3, ub.getPassword());
			//Ecrypt User Password
			//String salt = PasswordUtils.getSalt(30);
	        // Protect user's password. The generated value can be stored in DB.
	        //String mySecurePassword = PasswordUtils.generateSecurePassword(ub.getPassword(), salt);
	        // Print out protected password 
	        //System.out.println("My secure password = " + mySecurePassword);
	        //System.out.println("Salt value = " + salt);
	        //ps.setString(3, salt);
	        
			ps.setString(4, ub.getHin());
			ps.setString(5, ub.getQuestion());
			ps.setString(6, ub.getAnswer());
			ps.setString(7, ub.getPhoto_name());
			
			int state = ps.executeUpdate();
			if(state > 0 ){
				sql = "INSERT INTO t_permissions VALUES(?,?,?,?,?,?,?)";
				ps = MySQL.P_getConnection().prepareStatement(sql);
				
				RoleBean rb = ub.getRb();
				ps.setString(1, rb.getRole_id());
				ps.setString(2, ub.getUser_id());
				
				if(rb.getRole_id().equals("role001")){
					ps.setInt(3, 1);
					ps.setInt(4, 1);
					ps.setInt(5, 1);
					ps.setInt(6, 1);
					ps.setInt(7, 1);
				}else{
					ps.setInt(3, 0);
					ps.setInt(4, 0);
					ps.setInt(5, 0);
					ps.setInt(6, 1);
					ps.setInt(7, 1);
				}				
				state = ps.executeUpdate();
				if(state > 0 )					
					msg="Success";
			}
		}catch(Exception e){
			msg="Error";
			System.out.println("UserService::P_addNewRegisterUserAccount(...) => " + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return msg;		
	}
	
	
	public static UserBean P_getUserUnlockScreen(UserBean ub){
		UserBean uBean = null;
		
		try{
			String sql="SELECT u.*,p.*,r.* FROM t_user_account u INNER JOIN (t_permissions p INNER JOIN t_roles r ON p.role_id = r.role_id )ON u.user_id = p.user_id WHERE user_name=? AND password=?" ;
			
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1 , ub.getUser_name());
			ps.setString(2, ub.getPassword());
			
			ResultSet rs = ps.executeQuery();
			uBean = new UserBean();
			if(rs.next()){
				uBean.setUser_id(rs.getString("user_id"));
				uBean.setUser_name(rs.getString("user_name"));
				uBean.setPassword(rs.getString("password"));
				uBean.setPhoto_name(rs.getString("photo_name"));				
				
				PermissionsBean pb = new PermissionsBean();
				pb.setAdd(rs.getInt("add_insert"));
				pb.setEdit(rs.getInt("edit_update"));
				pb.setDelete(rs.getInt("remove_delete"));
				pb.setSearch(rs.getInt("search_query"));
				pb.setReport(rs.getInt("report"));
				
				RoleBean rb = new RoleBean();
				rb.setRole_id(rs.getString("role_id"));
				rb.setRole_name(rs.getString("role_name"));
				uBean.setRb(rb);
				if(rs.getString("role_id").equals("role005")) {
					uBean.setUrl("./view/template/PageTemplate");
				}
				if(rs.getString("role_id").equals("role001")) {
					uBean.setUrl("./view/panel/TeacherPanel");
				}
				if(rs.getString("role_id").equals("role002")) {
					uBean.setUrl("./view/panel/StudentPanel");
				}
			}
			else{
				uBean.setUrl("./lock_screen");
			}
		}catch(Exception e){
			System.out.println("UserService::P_getUserUnlockScreen(...) => " + e.toString());
			uBean = new UserBean();
			uBean.setUrl("./lock_screen");
		}finally{
			MySQL.P_getClose();
		}
		return uBean;
	}
	
	public static ArrayList<UserBean> P_listAllUserAccounts(){
		ArrayList<UserBean> al = new ArrayList<UserBean>();
		try{
			String sql = "SELECT u.*,r.* FROM t_user_account u INNER JOIN(t_permissions p INNER JOIN t_roles r ON p.role_id = r.role_id) ON p.user_id = u.user_id";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				UserBean ub = new UserBean();
				ub.setUser_id(rs.getString("user_id"));
				ub.setUser_name(rs.getString("user_name"));
				ub.setPassword(rs.getString("password"));
				ub.setHin(rs.getString("hin"));
				ub.setQuestion(rs.getString("question"));
				ub.setAnswer(rs.getString("answer"));
				
				RoleBean rb = new RoleBean();
				rb.setRole_id(rs.getString("role_id"));
				rb.setRole_name(rs.getString("role_name"));
				ub.setRb(rb);
				
				ub.setPhoto_name(rs.getString("photo_name"));
				al.add(ub);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	public static ArrayList<UserBean> P_getQuestion(){
		ArrayList<UserBean> al = new ArrayList<UserBean>();
		try{
			String sql = "SELECT DISTINCT question FROM t_user_account";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				UserBean ub = new UserBean();
				ub.setQuestion(rs.getString("question"));
				al.add(ub);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	//Update User
	public static UserBean p_getAUser(String id){
		UserBean ub = null;
		try{
			String sql = "SELECT u.*,r.* FROM t_roles r INNER JOIN(t_permissions p INNER JOIN t_user_account u ON p.user_id = u.user_id) ON p.role_id = r.role_id WHERE u.user_id=?";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			if( rs.next() ){
				ub = new UserBean();
				ub.setUser_id(rs.getString("user_id"));
				ub.setUser_name(rs.getString("user_name"));
				ub.setPassword(rs.getString("password"));
				ub.setHin(rs.getString("hin"));
				ub.setQuestion(rs.getString("question"));
				ub.setAnswer(rs.getString("answer"));				
				ub.setPhoto_name(rs.getString("photo_name"));
				
				RoleBean rb = new RoleBean();
				rb.setRole_id(rs.getString("role_id"));
				rb.setRole_name(rs.getString("role_name"));
				ub.setRb(rb);
			}
			
		}catch(Exception e){
			System.out.println("UserService::p_getAUser(...) => " + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		
		return ub;
	}
	
	public static String p_updateExistUserAccount( UserBean ub){
		String msg = "";
		try{
			
			if(ub.getPhoto_name().equals("")){
				String sql = "UPDATE t_user_account SET user_name=?, password=?,hin=?, question=?,answer=? WHERE user_id=?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, ub.getUser_name());
				ps.setString(2, ub.getPassword());
				ps.setString(3, ub.getHin());
				ps.setString(4, ub.getQuestion());
				ps.setString(5, ub.getAnswer());
				ps.setString(6, ub.getUser_id());
				
				int state = ps.executeUpdate();
				if(state > 0) {
					sql = "UPDATE t_permissions SET role_id=? WHERE user_id=?";
					ps = MySQL.P_getConnection().prepareStatement(sql);
					ps.setString(1, ub.getRb().getRole_id());
					ps.setString(2, ub.getUser_id());
					
					state = ps.executeUpdate();
					if(state > 0)
					msg = "SUC";
				}
			}else{
				String sql = "UPDATE t_user_account SET user_name=?, password=?,hin=?,question=?,answer=?,photo_name=? WHERE user_id=?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, ub.getUser_name());
				ps.setString(2, ub.getPassword());
				ps.setString(3, ub.getHin());
				ps.setString(4, ub.getQuestion());
				ps.setString(5, ub.getAnswer());
				ps.setString(6, ub.getPhoto_name());
				ps.setString(7, ub.getUser_id());
				
				int state = ps.executeUpdate();
				if(state > 0) {
					sql = "UPDATE t_permissions SET role_id=? WHERE user_id=?";
					ps = MySQL.P_getConnection().prepareStatement(sql);
					ps.setString(1, ub.getRb().getRole_id());
					ps.setString(2, ub.getUser_id());
					
					state = ps.executeUpdate();
					if(state > 0)
					msg = "SUC";
				}
			}
		}catch(Exception e){
			msg = "ERR";
			System.out.println("UserService::p_updateExistUserAccount(...) => " + e.toString());
			MySQL.P_getClose();
		}finally{
			MySQL.P_getClose();
		}
		return msg;		
	}
	
	public static ArrayList<RoleBean> p_getRole(){
		ArrayList<RoleBean> al = new ArrayList<RoleBean>();
		try{
			String sql = "SELECt * FROM  t_roles";
			
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				RoleBean rb = new RoleBean();
				rb.setRole_id(rs.getString("role_id"));
				rb.setRole_name(rs.getString("role_name"));
				al.add(rb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
	
	//Delete user
	public static String P_deleteUser(String id){  
        String msg = ""; 
        try{  
        	String sql = "DELETE FROM t_user_account WHERE user_id = ?";
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
	
	//===== Get A User Account by User_id ======
		public static UserBean p_getAUserByUserID(String id){
			UserBean ub = null;
			try{
				String sql = "SELECT u.* FROM t_user_account u WHERE u.user_id=?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				if( rs.next() ){
					ub = new UserBean();
					ub.setUser_id(rs.getString("user_id"));
					ub.setUser_name(rs.getString("user_name"));
					ub.setPassword(rs.getString("password"));
					ub.setHin(rs.getString("hin"));
					ub.setQuestion(rs.getString("question"));
					ub.setAnswer(rs.getString("answer"));					
					ub.setPhoto_name(rs.getString("photo_name"));					
					
				}
				
			}catch(Exception e){
				System.out.println("UserService::p_getAUserByUserID(...) => " + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			
			return ub;
		}
}


