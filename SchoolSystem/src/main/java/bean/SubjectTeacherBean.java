package bean;

public class SubjectTeacherBean {
	private String teacherID,subjectID;
	private TeacherBean tb;
	private SubjectCategoryBean scb;
	private SubjectBean sb;
	public SubjectBean getSb() {
		return sb;
	}
	public void setSb(SubjectBean sb) {
		this.sb = sb;
	}
	public TeacherBean getTb() {
		return tb;
	}
	public void setTb(TeacherBean tb) {
		this.tb = tb;
	}
	public SubjectCategoryBean getScb() {
		return scb;
	}
	public void setScb(SubjectCategoryBean scb) {
		this.scb = scb;
	}
	public SubjectTeacherBean(){}
	public SubjectTeacherBean(String tid,String sid){
		this.teacherID = tid;
		this.subjectID = sid;
	}
	public String getTeacherID() {
		return teacherID;
	}
	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}
	public String getSubjectID() {
		return subjectID;
	}
	public void setSubjectID(String subjectID) {
		this.subjectID = subjectID;
	}
}
