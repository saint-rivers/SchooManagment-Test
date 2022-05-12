package bean;

public class Sub_SubjectBean {
	private String mother_id,subject_name;
	private int subject_id;
	
	public Sub_SubjectBean() {}
	public Sub_SubjectBean(int sid,String mid,String sn) {
		this.subject_id = sid;
		this.mother_id = mid;
		this.subject_name = sn;
	}
	public String getMother_id() {
		return mother_id;
	}
	public void setMother_id(String mother_id) {
		this.mother_id = mother_id;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public int getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}
	
}
