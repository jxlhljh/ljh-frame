package com.sendi.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * Syslogs entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "syslogs")
public class Syslogs implements java.io.Serializable {

	// Fields

	private Integer id;
	private String logname;
	private String loguser;
	private String logterminal;
	private String logresult;
	private String logcontent;
	private String logtime;

	// Constructors

	/** default constructor */
	public Syslogs() {
	}

	/** full constructor */
	public Syslogs(String logname, String loguser, String logterminal,
			String logresult, String logcontent, String logtime) {
		this.logname = logname;
		this.loguser = loguser;
		this.logterminal = logterminal;
		this.logresult = logresult;
		this.logcontent = logcontent;
		this.logtime = logtime;
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

	@Column(name = "logname", length = 20)
	public String getLogname() {
		return this.logname;
	}

	public void setLogname(String logname) {
		this.logname = logname;
	}

	@Column(name = "loguser", length = 30)
	public String getLoguser() {
		return this.loguser;
	}

	public void setLoguser(String loguser) {
		this.loguser = loguser;
	}

	@Column(name = "logterminal", length = 20)
	public String getLogterminal() {
		return this.logterminal;
	}

	public void setLogterminal(String logterminal) {
		this.logterminal = logterminal;
	}

	@Column(name = "logresult", length = 20)
	public String getLogresult() {
		return this.logresult;
	}

	public void setLogresult(String logresult) {
		this.logresult = logresult;
	}

	@Column(name = "logcontent", length = 200)
	public String getLogcontent() {
		return this.logcontent;
	}

	public void setLogcontent(String logcontent) {
		this.logcontent = logcontent;
	}

	@Column(name = "logtime", length = 20)
	public String getLogtime() {
		return this.logtime;
	}

	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}

}