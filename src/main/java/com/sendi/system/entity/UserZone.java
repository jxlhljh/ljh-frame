package com.sendi.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * UserRoleRelation entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user_zone")
public class UserZone implements java.io.Serializable {

	// Fields

	private Integer id;  
	private String zonecode;
	private String zonename;
	private String parentcode;
	private String level;

	// Constructors

	/** default constructor */
	public UserZone() {
	}

	/** full constructor */
	public UserZone(String zonecode, String zonename,String parentcode,String level) {
		this.zonecode = zonecode;
		this.zonename = zonename;
		this.parentcode = parentcode;
		this.level = level;
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

	@Column(name = "zonecode", length = 50)
	public String getZonecode() {
		return this.zonecode;
	}

	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}

	@Column(name = "zonename", length = 50)
	public String getZonename() {
		return zonename;
	}

	public void setZonename(String zonename) {
		this.zonename = zonename;
	}

	@Column(name = "parentcode", length = 50)
	public String getParentcode() {
		return parentcode;
	}

	public void setParentcode(String parentcode) {
		this.parentcode = parentcode;
	}

	@Column(name = "level", length = 50)
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}



}