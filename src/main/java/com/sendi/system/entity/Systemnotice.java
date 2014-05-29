package com.sendi.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "systemnotice")
public class Systemnotice implements java.io.Serializable {

	// Fields

	private Integer id;
	private String noticetype;
	private String noticetitle;
	private String openurl;
	private String noticestatus;
	private String roleid;
	private String noticecontent;
	private String startTime;

	// Constructors

	/** default constructor */
	public Systemnotice() {
	}

	/** minimal constructor */
	public Systemnotice(String noticetype, String noticetitle, String roleid) {
		this.noticetype = noticetype;
		this.noticetitle = noticetitle;
		this.roleid = roleid;
	}

	/** full constructor */
	public Systemnotice(String noticetype, String noticetitle, String openurl,
			String noticestatus, String roleid, String noticecontent,
			String startTime) {
		this.noticetype = noticetype;
		this.noticetitle = noticetitle;
		this.openurl = openurl;
		this.noticestatus = noticestatus;
		this.roleid = roleid;
		this.noticecontent = noticecontent;
		this.startTime = startTime;
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

	@Column(name = "noticetype", nullable = false, length = 20)
	public String getNoticetype() {
		return this.noticetype;
	}

	public void setNoticetype(String noticetype) {
		this.noticetype = noticetype;
	}

	@Column(name = "noticetitle", nullable = false, length = 100)
	public String getNoticetitle() {
		return this.noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	@Column(name = "openurl", length = 150)
	public String getOpenurl() {
		return this.openurl;
	}

	public void setOpenurl(String openurl) {
		this.openurl = openurl;
	}

	@Column(name = "noticestatus", length = 20)
	public String getNoticestatus() {
		return this.noticestatus;
	}

	public void setNoticestatus(String noticestatus) {
		this.noticestatus = noticestatus;
	}

	@Column(name = "roleid", nullable = false, length = 20)
	public String getRoleid() {
		return this.roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	@Column(name = "noticecontent", length = 200)
	public String getNoticecontent() {
		return this.noticecontent;
	}

	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}

	@Column(name = "start_time", length = 20)
	public String getStartTime() {
		return this.startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

}