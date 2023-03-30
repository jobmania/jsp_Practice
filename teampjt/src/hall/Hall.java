package hall;

import java.sql.Date;

public class Hall {

	private int id;
	private String region; // 지역
	private String type;  // 종류
	private String name;
	private Date openDate;
	private Date closeDate;
	private String price;
	private String address;
	private String phoneNum;
	private String homepage;

	public Hall(){
	}

	public Hall(int id, String region, String type, String name, Date openDate, Date closeDate, String price, String address, String phoneNum, String homepage) {
		this.id = id;
		this.region = region;
		this.type = type;
		this.name = name;
		this.openDate = openDate;
		this.closeDate = closeDate;
		this.price = price;
		this.address = address;
		this.phoneNum = phoneNum;
		this.homepage = homepage;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public Date getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
}
