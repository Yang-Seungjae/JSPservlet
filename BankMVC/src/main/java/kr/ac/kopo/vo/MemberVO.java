package kr.ac.kopo.vo;

public class MemberVO {

	private String id;
	private String password;
	private String email;
	private String name;
	private String usercode;
	private String phone;
	private String address;
	private String postcode;
	private String user_type;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsercode() {
		return usercode;
	}

	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", email=" + email + ", name=" + name + ", usercode="
				+ usercode + ", phone=" + phone + ", address=" + address + ", postcode=" + postcode + ", user_type="
				+ user_type + "]";
	}

	public MemberVO(String id, String password, String email, String name, String usercode, String phone,
			String address, String postcode, String user_type) {
		super();
		this.id = id;
		this.password = password;
		this.email = email;
		this.name = name;
		this.usercode = usercode;
		this.phone = phone;
		this.address = address;
		this.postcode = postcode;
		this.user_type = user_type;
	}

	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
