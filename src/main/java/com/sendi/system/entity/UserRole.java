package com.sendi.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * UserRole entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user_role")
public class UserRole implements java.io.Serializable {

	// Fields

	private Integer id;
	private String rolename;
	private String roledesc;
	private String loginip;
	private String area;
	private String isvalidataip;
	private Integer parentid;
	private String username;
	private String parentname;

	// Constructors
	
	/** default constructor */
	public UserRole() {
	}

	/** full constructor */
	public UserRole(String rolename, String roledesc, String loginip,
			String area, String isvalidataip, Integer parentid) {
		this.rolename = rolename;
		this.roledesc = roledesc;
		this.loginip = loginip;
		this.area = area;
		this.isvalidataip = isvalidataip;
		this.parentid = parentid;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "rolename", length = 100)
	public String getRolename() {
		return this.rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	@Column(name = "roledesc", length = 200)
	public String getRoledesc() {
		return this.roledesc;
	}

	public void setRoledesc(String roledesc) {
		this.roledesc = roledesc;
	}

	@Column(name = "loginip", length = 2000)
	public String getLoginip() {
		return this.loginip;
	}

	public void setLoginip(String loginip) {
		this.loginip = loginip;
	}

	@Column(name = "area", length = 50)
	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Column(name = "isvalidataip", length = 10)
	public String getIsvalidataip() {
		return this.isvalidataip;
	}

	public void setIsvalidataip(String isvalidataip) {
		this.isvalidataip = isvalidataip;
	}

	@Column(name = "parentid")
	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	@Column(name = "username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Transient
	public String getParentname() {
		return parentname;
	}

	public void setParentname(String parentname) {
		this.parentname = parentname;
	}

}