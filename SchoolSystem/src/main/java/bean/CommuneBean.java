package bean;

public class CommuneBean {
	private int commune_id,district_id;
	private String commune;
	private DistrictBean db;
	
	public DistrictBean getDb() {
		return db;
	}
	public void setDb(DistrictBean db) {
		this.db = db;
	}
	public CommuneBean(){}
	public CommuneBean(int id,String com,int distid){
		this.commune_id = id;
		this.commune = com;
		this.district_id = distid;
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
	public String getCommune() {
		return commune;
	}
	public void setCommune(String commune) {
		this.commune = commune;
	}
	
	
}
