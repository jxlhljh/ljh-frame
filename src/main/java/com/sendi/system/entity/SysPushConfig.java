package com.sendi.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import org.hibernate.annotations.GenericGenerator;

/**
 * SysPushConfig entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_push_config", uniqueConstraints = @UniqueConstraint(columnNames = "pushid"))
public class SysPushConfig implements java.io.Serializable {

	// Fields

	private Integer id;
	private String callbackfun;
	private String callbackmoudleid;
	private String description;
	private String pushid;

	// Constructors

	/** default constructor */
	public SysPushConfig() {
	}

	/** full constructor */
	public SysPushConfig(String callbackfun, String callbackmoudleid,
			String description, String pushid) {
		this.callbackfun = callbackfun;
		this.callbackmoudleid = callbackmoudleid;
		this.description = description;
		this.pushid = pushid;
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

	@Column(name = "callbackfun", nullable = false, length = 100)
	public String getCallbackfun() {
		return this.callbackfun;
	}

	public void setCallbackfun(String callbackfun) {
		this.callbackfun = callbackfun;
	}

	@Column(name = "callbackmoudleid", nullable = false, length = 100)
	public String getCallbackmoudleid() {
		return this.callbackmoudleid;
	}

	public void setCallbackmoudleid(String callbackmoudleid) {
		this.callbackmoudleid = callbackmoudleid;
	}

	@Column(name = "description", nullable = false, length = 200)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "pushid", unique = true, nullable = false, length = 200)
	public String getPushid() {
		return this.pushid;
	}

	public void setPushid(String pushid) {
		this.pushid = pushid;
	}

}