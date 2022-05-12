package db.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.SubjectBean;
import bean.SubjectClassBean;
import db.mysql.MySQL;

public class SubjectClassService {
	 public static String addSubjectClass(ArrayList<SubjectClassBean> list){
		   String msg ="";
		   try{			   
		   		for(int i=0;i<list.size();i++){
		   			String sql = "INSERT INTO t_subject_class VALUES(?,?)";
		   			PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
		   			SubjectClassBean scb = (SubjectClassBean) list.get(i);
		   			ps.setString(1, scb.getClass_id());
		   			ps.setString(2, scb.getSubject_id());
		   			
		   			int state = ps.executeUpdate();
		   			if(state > 0){
		   				msg = "Success";
		   			}
		   		}
		   }catch(Exception e){
			   msg = "Error";
			   System.out.println("SubjectClassService::addSubjectClass() => " + e.toString());
		   }finally{
			   MySQL.P_getClose();
		   }
		   return msg;
	   }
	   
	   //================= list Subjects by Class id ================
	   public static ArrayList<SubjectBean> getSubjectByClassID(String id){
			ArrayList<SubjectBean> al = new ArrayList<SubjectBean>();
			try{
				String sql = "SELECT s.*,sc.* FROM t_subject s INNER JOIN t_subject_class sc ON s.subject_id = sc.subject_id WHERE sc.class_id = ?";
				PreparedStatement ps = MySQL.P_getConnection().prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					SubjectBean sb = new SubjectBean();
					sb.setSubject_id(rs.getString("subject_id"));
					sb.setSubject_name(rs.getString("subject_name"));

					al.add(sb);
				}
			}catch(Exception e){
				System.out.println("SubjectClassService::getSubjectByClassID() => " + e.toString());System.out.println(" show error!" + e.toString());
			}finally{
				MySQL.P_getClose();
			}
			return al;
		}
}
