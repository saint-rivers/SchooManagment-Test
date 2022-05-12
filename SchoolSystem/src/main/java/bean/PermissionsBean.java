package bean;

public class PermissionsBean {
	private String role_id,user_id;
	private int add,edit,delete,search,report;
	
	public PermissionsBean(){};
	public PermissionsBean(String rid,String uid,int add,int update,int delete,int search,int report){
		this.role_id = rid;
		this.user_id = uid;
		this.add = add;
		this.edit = update;
		this.delete = delete;
		this.search = search;
		this.report = report;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getAdd() {
		return add;
	}
	public void setAdd(int add) {
		this.add = add;
	}
	public int getEdit() {
		return edit;
	}
	public void setEdit(int edit) {
		this.edit = edit;
	}
	public int getDelete() {
		return delete;
	}
	public void setDelete(int delete) {
		this.delete = delete;
	}
	public int getSearch() {
		return search;
	}
	public void setSearch(int search) {
		this.search = search;
	}
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}
	
	
}
