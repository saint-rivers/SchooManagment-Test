package db.mysql;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQL {
	private static Connection connection = null;
	private static String db_name = "dbschool";
	private static String db_user = "root";
	private static String db_pass = "";
	private static String db_url = "jdbc:mysql://127.0.0.1:3306/";
	
	public static Connection P_getConnection(){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(db_url+db_name,db_user,db_pass);
			System.out.println("MySQL::P_getConnection() => Connection Successful!");
			return connection;
			
		}catch(Exception e){
			System.out.println("MySQL::P_getConnection() => " + e.toString());
			return null;
		}
	}
	
	public static void P_getClose(){
		try{
			connection.close();
		}catch (Exception e){
			System.out.println("MySQL::p_getClose=>"+e.toString());
		}
	}
	
	public static void main(String [] args){
		P_getConnection();
	}
	
}
