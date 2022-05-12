package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.Sub_SubjectBean;
import db.mysql.MySQL;

public class SubSubjectService {
	// List all sub subjects
		public static ArrayList<Sub_SubjectBean> listSubSubject(){
			ArrayList<Sub_SubjectBean> al = new ArrayList<Sub_SubjectBean>();
			try{
				String sql = "SELECT * FROM tbl_subjects";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					Sub_SubjectBean sb = new Sub_SubjectBean();
					sb.setSubject_id(rs.getInt("subject_id"));
					sb.setMother_id(rs.getString("mother_id"));
					sb.setSubject_name(rs.getString("subject_name"));
					
					al.add(sb);
				}
			}catch(Exception e){
				System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return al;
		}
}
