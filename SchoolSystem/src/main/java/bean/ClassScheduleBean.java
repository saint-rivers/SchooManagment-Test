package bean;

public class ClassScheduleBean {
	private String class_id;
	private int day_id;
	
	private ClassStudyBean ClassSB;
	private DayBean DayB;
	public ClassScheduleBean() {}
	public ClassScheduleBean(String cid,int did) {
		this.class_id = cid;
		this.day_id = did;
	}
	
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public int getDay_id() {
		return day_id;
	}
	public void setDay_id(int day_id) {
		this.day_id = day_id;
	}
	public ClassStudyBean getClassSB() {
		return ClassSB;
	}
	public void setClassSB(ClassStudyBean classSB) {
		ClassSB = classSB;
	}
	public DayBean getDayB() {
		return DayB;
	}
	public void setDayB(DayBean dayB) {
		DayB = dayB;
	}
	
	
}
