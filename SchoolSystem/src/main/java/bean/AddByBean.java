package bean;

public class AddByBean {
	private String inputDate;
	private String inputTime;
	private UserBean userbean;
	private int addby_id ;
	public UserBean getUserbean() {
		return userbean;
	}
	public void setUserbean(UserBean userbean) {
		this.userbean = userbean;
	}
	public String getInputDate() {
		return inputDate;
	}
	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}
	public AddByBean() {
		
	}
	public AddByBean(String inputDate, String inputTime, UserBean userbean, int addby_id) {
		super();
		this.inputDate = inputDate;
		this.inputTime = inputTime;
		this.userbean = userbean;
		this.addby_id = addby_id;
	}
	public String getInputTime() {
		return inputTime;
	}
	public void setInputTime(String inputTime) {
		this.inputTime = inputTime;
	}
	
	public int getAddby_id() {
		return addby_id;
	}
	public void setAddby_id(int addby_id) {
		this.addby_id = addby_id;
	}
	

}
