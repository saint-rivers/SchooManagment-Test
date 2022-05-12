package bean;

public class TestUpdatePictureBean {
	private String id,name,photo,url;
	public TestUpdatePictureBean(){}
	public TestUpdatePictureBean(String id,String name,String pho,String url){
		this.id = id;
		this.name = name;
		this.photo = pho;
		this.url = url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
