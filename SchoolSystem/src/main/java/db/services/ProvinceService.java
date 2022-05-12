package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.ProvinceBean;
import db.mysql.MySQL;

public class ProvinceService {
	public static ArrayList<ProvinceBean> p_listAllProvince(){
		ArrayList<ProvinceBean> al = new ArrayList<ProvinceBean>();
		try{
			String sql = "SELECT * FROM t_province";
			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				ProvinceBean pb = new ProvinceBean();
				pb.setPro_id(rs.getInt("province_id"));
				pb.setProvince(rs.getString("province"));
				
				al.add(pb);
			}
		}catch(Exception e){
			System.out.println(" show error!" + e.toString());
		}finally{
			MySQL.P_getClose();
		}
		return al;
	}
		
}
