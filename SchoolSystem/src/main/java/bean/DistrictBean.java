package bean;

public class DistrictBean {
	private int district_id,province_id;
	private String district;
	private ProvinceBean pb;
	public ProvinceBean getPb() {
		return pb;
	}
	public void setPb(ProvinceBean pb) {
		this.pb = pb;
	}
	public DistrictBean(){}
	public DistrictBean(int id,String district,int proid){
		this.district_id = id;
		this.district = district;
		this.province_id = proid;
	}
	public int getDistrict_id() {
		return district_id;
	}
	public void setDistrict_id(int district_id) {
		this.district_id = district_id;
	}
	public String getDistrict() {
		return district;
	}
	public int getProvince_id() {
		return province_id;
	}
	public void setProvince_id(int province_id) {
		this.province_id = province_id;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	
}
