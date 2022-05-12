package bean;

public class SubjectClassBean {
	private String class_id,subject_id;
	private ClassStudyBean csb;
	private SubjectBean sb;
	
	public SubjectClassBean(){}
	public SubjectClassBean(String cid,String sid){
		this.class_id = cid;
		this.subject_id = sid;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}
	public ClassStudyBean getCsb() {
		return csb;
	}
	public void setCsb(ClassStudyBean csb) {
		this.csb = csb;
	}
	public SubjectBean getSb() {
		return sb;
	}
	public void setSb(SubjectBean sb) {
		this.sb = sb;
	}
}
