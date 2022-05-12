package bean;

public class SubjectBean {
	private String subject_id,subject_name,category_id;
	private SubjectCategoryBean scb;
    private AddByBean addbybean;
	public SubjectBean(){}
	public SubjectBean(String sub_id,String subject,String cat_id){
		this.subject_id = sub_id;
		this.subject_name = subject;
		this.category_id = cat_id;
	}
	
	public SubjectCategoryBean getScb() {
		return scb;
	}
	public void setScb(SubjectCategoryBean scb) {
		this.scb = scb;
	}
	public String getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public AddByBean getAddbybean() {
		return addbybean;
	}
	public void setAddbybean(AddByBean addbybean) {
		this.addbybean = addbybean;
	}
	
	
}
