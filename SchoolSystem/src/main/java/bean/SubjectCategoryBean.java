package bean;

public class SubjectCategoryBean {
	private String category_id,category_name;
	public SubjectCategoryBean(){}
	public SubjectCategoryBean(String cat_id,String cat_name){
		this.category_id = cat_id;
		this.category_name = cat_name;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	
}
