package bean;

public class UserBean {
	private String user_id,user_name,password,hin,question,answer,photo_name,url;
	private String getPath = ("images/users");
	
	
	public String getGetPath() {
		return getPath;
	}


	public String getUrlfolder() {
		return urlfolder;
	}


	private String urlfolder = "D:\\projectJava\\SchoolSystem\\src\\main\\webapp\\images\\users\\";
	private PermissionsBean pb;
	private RoleBean rb;
	
	public UserBean(){};
	
	public UserBean(String user_id, String user_name,String pass,String hin,String quest,String answer,String photo_name,String url){
		this.user_id = user_id;
		this.user_name = user_name;
		this.password = pass;
		this.hin = hin;
		this.question = quest;
		this.answer = answer;
		this.photo_name = photo_name;		
		this.url = url;
	}
	
	
	public String getHin() {
		return hin;
	}

	public void setHin(String hin) {
		this.hin = hin;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public PermissionsBean getPb() {
		return pb;
	}

	public void setPb(PermissionsBean pb) {
		this.pb = pb;
	}

	public RoleBean getRb() {
		return rb;
	}

	public void setRb(RoleBean rd) {
		this.rb = rd;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}
	

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoto_name() {
		return photo_name;
	}

	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
