package bean;

public class AddressBean {
	private int village_id, commune_id, district_id , province_id;
	private String village,commune,district,province;
	public AddressBean(){}
	public AddressBean(int vid,String vil,int cid,String commune,int did,String district,int pid,String province){
		this.village_id = vid;
		this.village = vil;
		this.commune_id = cid;
		this.commune = commune;
		this.district_id = did;
		this.district = district;
		this.province_id = pid;
		this.province = province;
	}
	public int getVillage_id() {
		return village_id;
	}
	public void setVillage_id(int villlage_id) {
		this.village_id = villlage_id;
	}
	public int getCommune_id() {
		return commune_id;
	}
	public void setCommune_id(int commune_id) {
		this.commune_id = commune_id;
	}
	public int getDistrict_id() {
		return district_id;
	}
	public void setDistrict_id(int district_id) {
		this.district_id = district_id;
	}
	public int getProvince_id() {
		return province_id;
	}
	public void setProvince_id(int province_id) {
		this.province_id = province_id;
	}
	public String getVillage() {
		return village;
	}
	public void setVillage(String village) {
		this.village = village;
	}
	public String getCommune() {
		return commune;
	}
	public void setCommune(String commune) {
		this.commune = commune;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	
}
