package bean;

public class SubjectsBean {
	private String subject_id,subject_name;
	private int subject_number;
	
	public SubjectsBean() {};
	public SubjectsBean(String sid,String sname,int snumber) {
		this.subject_id = sid;
		this.subject_name = sname;
		this.subject_number = snumber;
	}
	public String getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public int getSubject_number() {
		return subject_number;
	}
	public void setSubject_number(int subject_number) {
		this.subject_number = subject_number;
	}
	
}
