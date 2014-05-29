package com.sendi.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysJobInterface entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_job_interface")
public class SysJobInterface implements java.io.Serializable {

	// Fields

	private Integer id;
	private String interfaceid;
	private String description;
	private String interfacecalss;
	private String jobtype;
	private String cronexpression;
	private String jobstartTime;
	private Integer jobRepeatInterval;
	private Integer jobRepeatcount;
	private String isactive;

	// Constructors

	/** default constructor */
	public SysJobInterface() {
	}

	/** minimal constructor */
	public SysJobInterface(String interfaceid, String description,
			String interfacecalss) {
		this.interfaceid = interfaceid;
		this.description = description;
		this.interfacecalss = interfacecalss;
	}

	/** full constructor */
	public SysJobInterface(String interfaceid, String description,
			String interfacecalss, String jobtype, String cronexpression,
			String jobstartTime, Integer jobRepeatInterval,
			Integer jobRepeatcount, String isactive) {
		this.interfaceid = interfaceid;
		this.description = description;
		this.interfacecalss = interfacecalss;
		this.jobtype = jobtype;
		this.cronexpression = cronexpression;
		this.jobstartTime = jobstartTime;
		this.jobRepeatInterval = jobRepeatInterval;
		this.jobRepeatcount = jobRepeatcount;
		this.isactive = isactive;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "interfaceid", nullable = false, length = 100)
	public String getInterfaceid() {
		return this.interfaceid;
	}

	public void setInterfaceid(String interfaceid) {
		this.interfaceid = interfaceid;
	}

	@Column(name = "description", nullable = false, length = 200)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "interfacecalss", nullable = false, length = 200)
	public String getInterfacecalss() {
		return this.interfacecalss;
	}

	public void setInterfacecalss(String interfacecalss) {
		this.interfacecalss = interfacecalss;
	}

	@Column(name = "jobtype", length = 20)
	public String getJobtype() {
		return this.jobtype;
	}

	public void setJobtype(String jobtype) {
		this.jobtype = jobtype;
	}

	@Column(name = "cronexpression", length = 20)
	public String getCronexpression() {
		return this.cronexpression;
	}

	public void setCronexpression(String cronexpression) {
		this.cronexpression = cronexpression;
	}

	@Column(name = "jobstart_time", length = 20)
	public String getJobstartTime() {
		return this.jobstartTime;
	}

	public void setJobstartTime(String jobstartTime) {
		this.jobstartTime = jobstartTime;
	}

	@Column(name = "job_repeatInterval")
	public Integer getJobRepeatInterval() {
		return this.jobRepeatInterval;
	}

	public void setJobRepeatInterval(Integer jobRepeatInterval) {
		this.jobRepeatInterval = jobRepeatInterval;
	}

	@Column(name = "job_repeatcount")
	public Integer getJobRepeatcount() {
		return this.jobRepeatcount;
	}

	public void setJobRepeatcount(Integer jobRepeatcount) {
		this.jobRepeatcount = jobRepeatcount;
	}

	@Column(name = "isactive", length = 20)
	public String getIsactive() {
		return this.isactive;
	}

	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}

}