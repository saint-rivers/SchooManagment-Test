package bean;

public class VillageBean {
	private int village_id,commune_id;
	private String village;
	
	private CommuneBean cb;	
	public CommuneBean getCb() {
		return cb;
	}
	public void setCb(CommuneBean cb) {
		this.cb = cb;
	}
	public VillageBean(){}
	public VillageBean(int villid,String village,int comid){
		this.village_id = villid;
		this.village = village;
		this.commune_id = comid;
	}
	public int getVillage_id() {
		return village_id;
	}
	public void setVillage_id(int village_id) {
		this.village_id = village_id;
	}
	public int getCommune_id() {
		return commune_id;
	}
	public void setCommune_id(int commune_id) {
		this.commune_id = commune_id;
	}
	public String getVillage() {
		return village;
	}
	public void setVillage(String village) {
		this.village = village;
	}
	
	
}
