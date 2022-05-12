package bean;

public class RoleBean {
	private String role_id,role_name,description;
	
	public RoleBean(){};
	public RoleBean(String rid,String rname,String desc){
		this.role_id = rid;
		this.role_name = rname;
		this.description = desc;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
