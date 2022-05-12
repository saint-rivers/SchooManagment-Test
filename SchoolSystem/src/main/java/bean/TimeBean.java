package bean;

public class TimeBean {
	private int time_id;
	private String start_time,end_time;
	
	public TimeBean() {}

	public TimeBean(int tid,String stime,String etime) {
		this.time_id = tid;
		this.start_time = stime;
		this.end_time = etime;
	}
	
	

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public int getTime_id() {
		return time_id;
	}

	public void setTime_id(int time_id) {
		this.time_id = time_id;
	}

}
