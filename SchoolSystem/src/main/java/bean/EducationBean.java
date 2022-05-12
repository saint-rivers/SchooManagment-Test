package bean;

public class EducationBean {
	

	private String education_id ,skill,level,teacher_type;
	private TeacherBean teacherbean;
	public String getUniverSety_name() {
		return univerSety_name;
	}

	public void setUniverSety_name(String univerSety_name) {
		this.univerSety_name = univerSety_name;
	}

	public String getStart_date_univerSety() {
		return start_date_univerSety;
	}

	public void setStart_date_univerSety(String start_date_univerSety) {
		this.start_date_univerSety = start_date_univerSety;
	}

	public String getEnd_date_univerSety() {
		return end_date_univerSety;
	}

	public void setEnd_date_univerSety(String end_date_univerSety) {
		this.end_date_univerSety = end_date_univerSety;
	}

	public String getHeigth_name() {
		return heigth_name;
	}

	public void setHeigth_name(String heigth_name) {
		this.heigth_name = heigth_name;
	}

	public String getStart_date_heigth() {
		return start_date_heigth;
	}

	public void setStart_date_heigth(String start_date_heigth) {
		this.start_date_heigth = start_date_heigth;
	}

	public String getEnd_date_heigth() {
		return end_date_heigth;
	}

	public void setEnd_date_heigth(String end_date_heigth) {
		this.end_date_heigth = end_date_heigth;
	}

	public String getPrimary_name() {
		return primary_name;
	}

	public void setPrimary_name(String primary_name) {
		this.primary_name = primary_name;
	}

	public String getStart_date_primary() {
		return start_date_primary;
	}

	public void setStart_date_primary(String start_date_primary) {
		this.start_date_primary = start_date_primary;
	}

	public String getEnd_date_primary() {
		return end_date_primary;
	}

	public void setEnd_date_primary(String end_date_primary) {
		this.end_date_primary = end_date_primary;
	}


	private String univerSety_name ,start_date_univerSety,end_date_univerSety;
	private String heigth_name ,start_date_heigth,end_date_heigth;
	private String primary_name ,start_date_primary,end_date_primary;
	

	public EducationBean(String education_id, String skill, String level, String teacher_type, TeacherBean teacherbean,
			String univerSety_name, String start_date_univerSety, String end_date_univerSety, String heigth_name,
			String start_date_heigth, String end_date_heigth, String primary_name, String start_date_primary,
			String end_date_primary) {
		super();
		this.education_id = education_id;
		this.skill = skill;
		this.level = level;
		this.teacher_type = teacher_type;
		this.teacherbean = teacherbean;
		this.univerSety_name = univerSety_name;
		this.start_date_univerSety = start_date_univerSety;
		this.end_date_univerSety = end_date_univerSety;
		this.heigth_name = heigth_name;
		this.start_date_heigth = start_date_heigth;
		this.end_date_heigth = end_date_heigth;
		this.primary_name = primary_name;
		this.start_date_primary = start_date_primary;
		this.end_date_primary = end_date_primary;
	}

	public String getTeacher_type() {
		return teacher_type;
	}

	public void setTeacher_type(String teacher_type) {
		this.teacher_type = teacher_type;
	}

	public TeacherBean getTeacherbean() {
		return teacherbean;
	}

	public void setTeacherbean(TeacherBean teacherbean) {
		this.teacherbean = teacherbean;
	}

	public String getEducation_id() {
		return education_id;
	}

	public void setEducation_id(String education_id) {
		this.education_id = education_id;
	}

	public String getprimary_name() {
		return primary_name;
	}

	public void setprimary_name(String primar_name) {
		this.primary_name = primar_name;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	
	public EducationBean() {
		
	}

	
	






	
	
	
	
	
	
	
	
	
	
}
