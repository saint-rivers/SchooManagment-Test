package bean;

public class AttendantBean {
	private int attendace_id, status;
	private String student_id,teacher_id,date;
	
	private StudentBean StudentB;
	
	public StudentBean getStudentB() {
		return StudentB;
	}
	public void setStudentB(StudentBean studentB) {
		StudentB = studentB;
	}
	public AttendantBean() {};
	public AttendantBean(int at_id,int status,String sid,String tid,String date) {
		this.attendace_id = at_id;
		this.student_id = sid;
		this.teacher_id = tid;
		this.status = status;
		this.date = date;		
	}
	public int getAttendace_id() {
		return attendace_id;
	}
	public void setAttendace_id(int attendace_id) {
		this.attendace_id = attendace_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	};
	
}
