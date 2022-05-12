package bean;

 
public class TeacherBean  {
	
	private String url = "D:\\projectJava\\SchoolSystem\\src\\main\\webapp\\images\\teachers\\";
	private String partOf= "images/teachers";
	
	private String t_id, t_fname,t_lname,t_gender,t_dob,t_phone,t_photo,nationality,country ,stustus ,nationality_id,user_id;
	private int pob,curr_address;
	private SubjectCategoryBean scb;
	public SubjectCategoryBean getScb() {
		return scb;
	}

	public void setScb(SubjectCategoryBean scb) {
		this.scb = scb;
	}

	public TeacherBean(String t_id, String t_fname, String t_lname, String t_gender, int pob,
			int curr_address, String t_dob, String t_phone, String t_photo, String nationality, String education_id,
			 String stustus, String nationality_id, TeacherBean tb, AddressBean address_teacher,
			AddressBean current_address, String url, EducationBean eb,String user_id) {
		super();
		this.t_id = t_id;
		this.t_fname = t_fname;
		this.t_lname = t_lname;
		this.t_gender = t_gender;
		this.pob = pob;
		this.curr_address = curr_address;
		this.t_dob = t_dob;
		this.t_phone = t_phone;
		this.t_photo = t_photo;
		this.nationality = nationality;		  
		
		this.stustus = stustus;
		this.nationality_id = nationality_id;
		this.tb = tb;
		this.address_teacher = address_teacher;
		this.current_address = current_address;		
		Eb = eb;
		this.user_id = user_id;
	}

	public String getUrl() {
		return url;
	}

	public String getPartOf() {
		return partOf;
	}

	

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getCurr_address() {
		return curr_address;
	}

	public void setCurr_address(int curr_address) {
		this.curr_address = curr_address;
	}



	private TeacherBean tb;
	private AddressBean address_teacher;
	private AddressBean current_address;
	    public int getPob() {
		return pob;
	}

	public void setPob(int pob) {
		this.pob = pob;
	}

	public AddressBean getAddress_teacher() {
		return address_teacher;
	}

	public void setAddress_teacher(AddressBean address_teacher) {
		this.address_teacher = address_teacher;
	}

	public AddressBean getCurrent_address() {
		return current_address;
	}

	public void setCurrent_address(AddressBean current_address) {
		this.current_address = current_address;
	}

		public AddressBean getaddress_teacher() {
		return address_teacher;
	}

	public String getNationality_id() {
			return nationality_id;
		}

		public void setNationality_id(String nationality_id) {
			this.nationality_id = nationality_id;
		}

	public void setaddress_teacher(AddressBean address_teacher) {
		this.address_teacher=address_teacher;
	}

	public EducationBean getEb() {
		return Eb;
	}

	public void setEb(EducationBean eb) {
		Eb = eb;
	}

	private EducationBean Eb;
	
	public TeacherBean getTb() {
		return tb;
	}

	public void setTb(TeacherBean tb) {
		this.tb = tb;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public String getT_fname() {
		return t_fname;
	}

	public void setT_fname(String t_fname) {
		this.t_fname = t_fname;
	}

	public String getT_lname() {
		return t_lname;
	}

	public void setT_lname(String t_lname) {
		this.t_lname = t_lname;
	}

	public String getT_gender() {
		return t_gender;
	}

	public void setT_gender(String t_gender) {
		this.t_gender = t_gender;
	}

	
	public String getT_dob() {
		return t_dob;
	}

	public void setT_dob(String t_dob) {
		this.t_dob = t_dob;
	}

	public String getT_phone() {
		return t_phone;
	}

	public void setT_phone(String t_phone) {
		this.t_phone = t_phone;
	}

	public String getT_photo() {
		return t_photo;
	}

	public void setT_photo(String t_photo) {
		this.t_photo = t_photo;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getCountry() {
		return country;
	}

	public void setEducation_id(String country) {
		this.country = country;
	}

	public String getStustus() {
		return stustus;
	}

	public void setStustus(String stustus) {
		this.stustus = stustus;
	}

	@Override
	public String toString() {
		return "teacherBeen [t_id=" + t_id + ", t_fname=" + t_fname + ", t_lname=" + t_lname + ", t_gender=" + t_gender
				+ ", t_add_id=" + pob + ", t_dob=" + t_dob + ", t_phone=" + t_phone + ", t_photo=" + t_photo
				+ ", nationality=" + nationality + ", Education_id=" +country + ", passport_no="
				+ ", stustus=" + stustus + "]";
	}
	
	public TeacherBean() {
		
	}
	
public TeacherBean(String t_id,String t_fname,String country ,String t_lname ,String t_gender,int pob ,String t_dob,String t_phone,String t_photo,String nationality ,String Education_id ,String passport_no, String stustus ,String url) {
	
		this.t_gender = t_gender;
		this.t_lname = t_lname;
		this.t_fname =t_fname;
		this.t_lname=t_lname;
		this.pob=pob;
		this.t_dob =t_dob;
		this.t_phone=t_phone;
		this.t_photo=t_photo;
		this.nationality=nationality;
		this.country = country;
		this.stustus=stustus;
		
	}

public void setCountry(String country) {
	this.country = country;
}



	
}
