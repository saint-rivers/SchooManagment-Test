package bean;

public class StudentBean {
	private String first_name,last_name,gender,dob,phone,nationality,guardian_id,photo_name,user_id;
	private String student_id;
	private int pob,current_address;
	private AddressBean ab;
	private String getPath =("images/students");
	private String urlFolder = "D:\\projectJava\\SchoolSystem\\src\\main\\webapp\\images\\students\\" ;
	
	public String getGetPath() {
		return getPath;
	}
	
	
	
	public String getUrlFolder() {
		return urlFolder;
	}


	public void setAb(AddressBean ab) {
		this.ab = ab;
	}
	public AddressBean getAb() {
		return ab;
	}
	private AddressBean abCurrent;
	
	public AddressBean getAbCurrent() {
		return abCurrent;
	}
	public void setAbCurrent(AddressBean abCurrent) {
		this.abCurrent = abCurrent;
	}
	public StudentBean(){};
	public StudentBean(String id,String fn,String ln,String gender,int pob,String dob,int current_address,String photo,String phone,String nationality,String guardian_id,String user_id){
		this.student_id = id;
		this.first_name = fn;
		this.last_name = ln;
		this.gender = gender;
		this.dob = dob;
		this.nationality = nationality;
		this.pob = pob;
		this.current_address = current_address;
		this.phone = phone;
		this.guardian_id = guardian_id;
		this.photo_name = photo;		
		this.user_id = user_id;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getPob() {
		return pob;
	}
	public void setPob(int pob) {
		this.pob = pob;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public int getCurrent_address() {
		return current_address;
	}
	public void setCurrent_address(int current_address) {
		this.current_address = current_address;
	}
	public String getPhoto_name() {
		return photo_name;
	}
	public void setPhoto_name(String photo) {
		this.photo_name = photo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getGuardian_id() {
		return guardian_id;
	}
	public void setGuardian_id(String guardian_id) {
		this.guardian_id = guardian_id;
	}
}
