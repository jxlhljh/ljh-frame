package com.sendi.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
  
 */
@Entity
@Table(name = "dctdata")
public class Dctdata implements java.io.Serializable {

	// Fields

	private Integer id;
	private String dcttypenote;
	private String dcttypeen;
	private String selecttype;
	private String selectsql;
	private String displayname;
	private String valuename;
	private String displayvalue;
	private String valuetext;
	private String otherfieldname;
	private String otherfieldvalue;

	// Constructors

	/** default constructor */
	public Dctdata() {
	}

	/** full constructor */
	public Dctdata(String dcttypenote, String dcttypeen, String selecttype,
			String selectsql, String displayname, String valuename,
			String displayvalue, String valuetext, String otherfieldname,
			String otherfieldvalue) {
		this.dcttypenote = dcttypenote;
		this.dcttypeen = dcttypeen;
		this.selecttype = selecttype;
		this.selectsql = selectsql;
		this.displayname = displayname;
		this.valuename = valuename;
		this.displayvalue = displayvalue;
		this.valuetext = valuetext;
		this.otherfieldname = otherfieldname;
		this.otherfieldvalue = otherfieldvalue;
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

	@Column(name = "dcttypenote", length = 100)
	public String getDcttypenote() {
		return this.dcttypenote;
	}

	public void setDcttypenote(String dcttypenote) {
		this.dcttypenote = dcttypenote;
	}

	@Column(name = "dcttypeen", length = 100)
	public String getDcttypeen() {
		return this.dcttypeen;
	}

	public void setDcttypeen(String dcttypeen) {
		this.dcttypeen = dcttypeen;
	}

	@Column(name = "selecttype", length = 20)
	public String getSelecttype() {
		return this.selecttype;
	}

	public void setSelecttype(String selecttype) {
		this.selecttype = selecttype;
	}

	@Column(name = "selectsql", length = 200)
	public String getSelectsql() {
		return this.selectsql;
	}

	public void setSelectsql(String selectsql) {
		this.selectsql = selectsql;
	}

	@Column(name = "displayname", length = 200)
	public String getDisplayname() {
		return this.displayname;
	}

	public void setDisplayname(String displayname) {
		this.displayname = displayname;
	}

	@Column(name = "valuename", length = 20)
	public String getValuename() {
		return this.valuename;
	}

	public void setValuename(String valuename) {
		this.valuename = valuename;
	}

	@Column(name = "displayvalue", length = 100)
	public String getDisplayvalue() {
		return this.displayvalue;
	}

	public void setDisplayvalue(String displayvalue) {
		this.displayvalue = displayvalue;
	}

	@Column(name = "valuetext", length = 20)
	public String getValuetext() {
		return this.valuetext;
	}

	public void setValuetext(String valuetext) {
		this.valuetext = valuetext;
	}

	@Column(name = "otherfieldname", length = 20)
	public String getOtherfieldname() {
		return this.otherfieldname;
	}

	public void setOtherfieldname(String otherfieldname) {
		this.otherfieldname = otherfieldname;
	}

	@Column(name = "otherfieldvalue", length = 200)
	public String getOtherfieldvalue() {
		return this.otherfieldvalue;
	}

	public void setOtherfieldvalue(String otherfieldvalue) {
		this.otherfieldvalue = otherfieldvalue;
	}

}