package bean;

public class ScheduleBean {
	private String class_id,subject_id,teacher_id;
	private int day_id,time_id;
	private ClassStudyBean ClassStudyB;
	private DayBean DayB;
	private TimeBean TimeB;
	private SubjectBean SubjectB;
	private TeacherBean TeacherB;
	
	public ScheduleBean(){}
	public ScheduleBean(String cid,String sid,String tid,int did,int time_id) {
		this.class_id = cid;
		this.day_id = did;
		this.time_id = time_id;
		this.subject_id = sid;
		this.teacher_id = tid;
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
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public int getDay_id() {
		return day_id;
	}
	public void setDay_id(int day_id) {
		this.day_id = day_id;
	}
	public int getTime_id() {
		return time_id;
	}
	public void setTime_id(int time_id) {
		this.time_id = time_id;
	}
	public ClassStudyBean getClassStudyB() {
		return ClassStudyB;
	}
	public void setClassStudyB(ClassStudyBean classStudyB) {
		ClassStudyB = classStudyB;
	}
	public DayBean getDayB() {
		return DayB;
	}
	public void setDayB(DayBean dayB) {
		DayB = dayB;
	}
	public TimeBean getTimeB() {
		return TimeB;
	}
	public void setTimeB(TimeBean timeB) {
		TimeB = timeB;
	}
	public SubjectBean getSubjectB() {
		return SubjectB;
	}
	public void setSubjectB(SubjectBean subjectB) {
		SubjectB = subjectB;
	}
	public TeacherBean getTeacherB() {
		return TeacherB;
	}
	public void setTeacherB(TeacherBean teacherB) {
		TeacherB = teacherB;
	}
	
	
}
