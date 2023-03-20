package hall;

public class Hall {

	private Integer hallID;
	private String city;
	private String country;
	private String address;
	private String hallName;
	private String openDate;
	private String num;
	
	public Hall(Integer hallID, String city, String country, String address, String hallName, String openDate, String num) {
		this.hallID = hallID;
		this.city = city;
		this.country = country;
		this.address = address;
		this.hallName = hallName;
		this.openDate = openDate;
		this.num = num;
	}
	
	public Integer getHallID() {
		return hallID;
	}
	public void setHallID(Integer hallID) {
		this.hallID = hallID;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHallName() {
		return hallName;
	}
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	
	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	
	
}
