package bean;

public class ProvinceBean {
	private int pro_id;
	private String province;
	public ProvinceBean(){};
	public ProvinceBean(int id, String proName){
		this.pro_id = id;
		this.province = proName;		
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	
	
}
