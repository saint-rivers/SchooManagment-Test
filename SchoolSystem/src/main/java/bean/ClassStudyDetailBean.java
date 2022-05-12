package bean;

public class ClassStudyDetailBean {
	private int classID;
	private String name;
	private SubjectCategoryBean scb;
	public SubjectCategoryBean getScb() {
		return scb;
	}
	public void setScb(SubjectCategoryBean scb) {
		this.scb = scb;
	}
	public ClassStudyDetailBean(){}
	public ClassStudyDetailBean(int id,String name){
		this.classID = id;
		this.name = name;
	}
	public int getClassID() {
		return classID;
	}
	public void setClassID(int classID) {
		this.classID = classID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
