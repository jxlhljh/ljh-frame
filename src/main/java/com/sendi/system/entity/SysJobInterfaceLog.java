package com.sendi.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysJobInterfaceLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_job_interface_log")
public class SysJobInterfaceLog implements java.io.Serializable {

	// Fields

	private Integer id;
	private String jobdesc;
	private String jobstartTime;
	private String jobendTime;
	private String jobName;
	private String jobGroupname;

	// Constructors

	/** default constructor */
	public SysJobInterfaceLog() {
	}

	/** full constructor */
	public SysJobInterfaceLog(String jobdesc, String jobstartTime,
			String jobendTime, String jobName, String jobGroupname) {
		this.jobdesc = jobdesc;
		this.jobstartTime = jobstartTime;
		this.jobendTime = jobendTime;
		this.jobName = jobName;
		this.jobGroupname = jobGroupname;
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

	@Column(name = "jobdesc", length = 20)
	public String getJobdesc() {
		return this.jobdesc;
	}

	public void setJobdesc(String jobdesc) {
		this.jobdesc = jobdesc;
	}

	@Column(name = "jobstart_time", length = 20)
	public String getJobstartTime() {
		return this.jobstartTime;
	}

	public void setJobstartTime(String jobstartTime) {
		this.jobstartTime = jobstartTime;
	}

	@Column(name = "jobend_time", length = 20)
	public String getJobendTime() {
		return this.jobendTime;
	}

	public void setJobendTime(String jobendTime) {
		this.jobendTime = jobendTime;
	}

	@Column(name = "job_name", length = 200)
	public String getJobName() {
		return this.jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	@Column(name = "job_groupname", length = 40)
	public String getJobGroupname() {
		return this.jobGroupname;
	}

	public void setJobGroupname(String jobGroupname) {
		this.jobGroupname = jobGroupname;
	}

}