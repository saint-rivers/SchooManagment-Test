package bean;

public class DayBean {
	private int day_id;
	private String day_name;
	
	public DayBean() {}
	public DayBean(int did,String dname) {
		this.day_id = did;
		this.day_name = dname;
	}
	
	public int getDay_id() {
		return day_id;
	}
	public void setDay_id(int day_id) {
		this.day_id = day_id;
	}
	public String getDay_name() {
		return day_name;
	}
	public void setDay_name(String day_name) {
		this.day_name = day_name;
	}
	
}
