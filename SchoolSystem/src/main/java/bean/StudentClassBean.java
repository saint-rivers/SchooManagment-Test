package bean;

public class StudentClassBean {
	private String class_id,student_id;
	private StudentBean sb;
	private ClassStudyBean csb;
	public StudentBean getSb() {
		return sb;
	}
	public void setSb(StudentBean sb) {
		this.sb = sb;
	}
	public ClassStudyBean getCsb() {
		return csb;
	}
	public void setCsb(ClassStudyBean csb) {
		this.csb = csb;
	}
	public StudentClassBean(){}
	public StudentClassBean(String cid,String sid){
		this.class_id = cid;
		this.student_id = sid;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
}
