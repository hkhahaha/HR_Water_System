package entity;
// Generated 2019-2-23 22:29:09 by Hibernate Tools 3.5.0.Final

/**
 * TbAdmin generated by hbm2java
 */
public class TbAdmin implements java.io.Serializable {

	private Integer id;
	private String username;
	private String password;

	public TbAdmin() {
	}

	public TbAdmin(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}