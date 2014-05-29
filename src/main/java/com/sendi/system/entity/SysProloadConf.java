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
@Table(name = "sys_proload_conf")
public class SysProloadConf implements java.io.Serializable {

	// Fields

	private Integer id;
	private String interfaceid;
	private String description;
	private String interfacecalss;

	// Constructors

	/** default constructor */
	public SysProloadConf() {
	}

	/** minimal constructor */
	public SysProloadConf(String interfaceid, String interfacecalss) {
		this.interfaceid = interfaceid;
		this.interfacecalss = interfacecalss;
	}

	/** full constructor */
	public SysProloadConf(String interfaceid, String description,
			String interfacecalss) {
		this.interfaceid = interfaceid;
		this.description = description;
		this.interfacecalss = interfacecalss;
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

	@Column(name = "interfaceid", nullable = false, length = 200)
	public String getInterfaceid() {
		return this.interfaceid;
	}

	public void setInterfaceid(String interfaceid) {
		this.interfaceid = interfaceid;
	}

	@Column(name = "description", length = 200)
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

}