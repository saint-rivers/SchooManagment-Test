package bean;

public class CountryBean {
 private String country_id,country;
 public CountryBean(){};
 public CountryBean(String id, String count){
	 this.country_id = id;
	 this.country = count;
 }
public String getCountry_id() {
	return country_id;
}
public void setCountry_id(String country_id) {
	this.country_id = country_id;
}
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
 
}
