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
@Table(name = "user_zone_power")
public class UserZonePower implements java.io.Serializable {

	// Fields

	private Integer id;  
	private Integer zoneid;
	private String powerstate;
	private Integer roleid;

	// Constructors

	/** default constructor */
	public UserZonePower() {
	}

	/** full constructor */
	public UserZonePower(Integer zoneid,String powerstate,Integer roleid) {
		this.zoneid = zoneid;
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

	@Column(name = "zoneid")
	public Integer getZoneid() {
		return zoneid;
	}

	public void setZoneid(Integer zoneid) {
		this.zoneid = zoneid;
	}

	@Column(name = "powerstate", length = 20)
	public String getPowerstate() {
		return powerstate;
	}

	public void setPowerstate(String powerstate) {
		this.powerstate = powerstate;
	}

	@Column(name = "roleid")
	public Integer getRoleid() {
		return roleid;
	}

	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}


}