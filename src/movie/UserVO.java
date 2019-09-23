package movie;

public class UserVO {
	String userid;
	String pw;
	String email;


	String phone;
	int age;
	int paynum;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getPaynum() {
		return paynum;
	}
	public void setPaynum(int paynum) {
		this.paynum = paynum;
	}
	@Override
	public String toString() {
		
		return "아이디 :" +userid+", 이메일: "+ email+", 핸드폰: "+phone+", 나이: "+age+", 결제횟수: "+paynum;
	}
}
