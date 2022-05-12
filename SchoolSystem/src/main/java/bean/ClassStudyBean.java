package bean;

public class ClassStudyBean {
	private String class_id,room_id,start_date,end_date,time_study,status;
	private RoomBean roomb;
	private TeacherBean TeaacherB;
	public TeacherBean getTeaacherB() {
		return TeaacherB;
	}
	public void setTeaacherB(TeacherBean teaacherB) {
		TeaacherB = teaacherB;
	}
	public RoomBean getRoomb() {
		return roomb;
	}
	public void setRoomb(RoomBean roomb) {
		this.roomb = roomb;
	}
	public ClassStudyBean(){}
	public ClassStudyBean(String cid,String rid,String time,String start,String end,String status){
		this.class_id = cid;		
		this.room_id = rid;
		this.start_date = start;
		this.end_date = end;
		
		this.time_study = time;
		this.status = status;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getTime_study() {
		return time_study;
	}
	public void setTime_study(String time_study) {
		this.time_study = time_study;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	
}
