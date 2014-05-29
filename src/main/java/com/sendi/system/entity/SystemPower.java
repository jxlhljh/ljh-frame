package com.sendi.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 系统权限表
 */
@Entity
@Table(name = "system_power")
public class SystemPower implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer moudleid;
	private String powerstate;
	private Integer roleid;

	// Constructors

	/** default constructor */
	public SystemPower() {
	}

	/** full constructor */
	public SystemPower(Integer moudleid, String powerstate, Integer roleid) {
		this.moudleid = moudleid;
		this.powerstate = powerstate;
		this.roleid = roleid;
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

	@Column(name = "moudleid", nullable = false)
	public Integer getMoudleid() {
		return this.moudleid;
	}

	public void setMoudleid(Integer moudleid) {
		this.moudleid = moudleid;
	}

	@Column(name = "powerstate", nullable = false, length = 20)
	public String getPowerstate() {
		return this.powerstate;
	}

	public void setPowerstate(String powerstate) {
		this.powerstate = powerstate;
	}

	@Column(name = "roleid", nullable = false)
	public Integer getRoleid() {
		return this.roleid;
	}

	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}

}