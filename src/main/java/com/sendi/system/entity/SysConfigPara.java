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
@Table(name = "sys_config_para")
public class SysConfigPara implements java.io.Serializable {

	// Fields

	private Integer id;
	private String paraName;
	private String paraValue;
	private String paraDesc;

	// Constructors

	/** default constructor */
	public SysConfigPara() {
	}

	/** minimal constructor */
	public SysConfigPara(String paraName, String paraValue) {
		this.paraName = paraName;
		this.paraValue = paraValue;
	}

	/** full constructor */
	public SysConfigPara(String paraName, String paraValue, String paraDesc) {
		this.paraName = paraName;
		this.paraValue = paraValue;
		this.paraDesc = paraDesc;
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

	@Column(name = "para_name", nullable = false, length = 200)
	public String getParaName() {
		return this.paraName;
	}

	public void setParaName(String paraName) {
		this.paraName = paraName;
	}

	@Column(name = "para_value", nullable = false, length = 200)
	public String getParaValue() {
		return this.paraValue;
	}

	public void setParaValue(String paraValue) {
		this.paraValue = paraValue;
	}

	@Column(name = "para_desc", length = 20)
	public String getParaDesc() {
		return this.paraDesc;
	}

	public void setParaDesc(String paraDesc) {
		this.paraDesc = paraDesc;
	}

}