package bean;

public class TeacherClassBean {
	private String class_id,teacher_id;
	private ClassStudyBean csb;
	private TeacherBean tb;
	
	public TeacherClassBean(){}
	public TeacherClassBean(String cid,String tid){
		this.class_id = cid;
		this.teacher_id = tid;	
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public ClassStudyBean getCsb() {
		return csb;
	}
	public void setCsb(ClassStudyBean csb) {
		this.csb = csb;
	}
	public TeacherBean getTb() {
		return tb;
	}
	public void setTb(TeacherBean tb) {
		this.tb = tb;
	}
}
