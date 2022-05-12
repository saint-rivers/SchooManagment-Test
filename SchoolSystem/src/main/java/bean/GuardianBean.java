package bean;

public class GuardianBean {
	private String guardian_id,father_name,father_job,mother_name,mother_job,guardian_phone;
	private int village_id;
	private AddressBean ab;
	
	public AddressBean getAb() {
		return ab;
	}
	public void setAb(AddressBean ab) {
		this.ab = ab;
	}
	public GuardianBean(){}
	public GuardianBean(String id, String fname,String fjob,String mname,String mjob,String phone,int vid){
		this.guardian_id = id;
		this.father_name = fname;
		this.father_job = fjob;
		this.mother_name = mname;
		this.mother_job  = mjob;
		this.guardian_phone = phone;
		this.village_id = vid;
	}
	public String getGuardian_id() {
		return guardian_id;
	}
	public void setGuardian_id(String guardian_id) {
		this.guardian_id = guardian_id;
	}
	public String getFather_name() {
		return father_name;
	}
	public void setFather_name(String father_name) {
		this.father_name = father_name;
	}
	public String getFather_job() {
		return father_job;
	}
	public void setFather_job(String father_job) {
		this.father_job = father_job;
	}
	public String getMother_name() {
		return mother_name;
	}
	public void setMother_name(String mother_name) {
		this.mother_name = mother_name;
	}
	public String getMother_job() {
		return mother_job;
	}
	public void setMother_job(String mother_job) {
		this.mother_job = mother_job;
	}
	public String getGuardian_phone() {
		return guardian_phone;
	}
	public void setGuardian_phone(String guardian_phone) {
		this.guardian_phone = guardian_phone;
	}
	public int getVillage_id() {
		return village_id;
	}
	public void setVillage_id(int village_id) {
		this.village_id = village_id;
	}
	
	
}
