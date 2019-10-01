package academy.appliedmath.gerenciadordetarefas.CRUDAngularJSJersey.bean;

public class User{
	
	int id;
	String userName;	
	long age;
	
	public User() {
		super();
	}
	public User(int i, String userName,long age) {
		super();
		this.id = i;
		this.userName = userName;
		this.age=age;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getuserName() {
		return userName;
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}
	public long getage() {
		return age;
	}
	public void setage(long age) {
		this.age = age;
	}	
	
}