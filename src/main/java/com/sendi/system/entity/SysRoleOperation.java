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
@Table(name = "sys_role_operation")
public class SysRoleOperation implements java.io.Serializable {

	// Fields

	private Integer id;
	private String operationcode;
	private String functionid;
	private String roleid;

	// Constructors

	/** default constructor */
	public SysRoleOperation() {
	}

	/** full constructor */
	public SysRoleOperation(String operationcode, String functionid,String roleid) {
		this.operationcode = operationcode;
		this.functionid = functionid;
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

	@Column(name = "operationcode", length = 255)
	public String getOperationcode() {
		return operationcode;
	}

	public void setOperationcode(String operationcode) {
		this.operationcode = operationcode;
	}

	@Column(name = "functionid", length = 255)
	public String getFunctionid() {
		return functionid;
	}

	public void setFunctionid(String functionid) {
		this.functionid = functionid;
	}

	@Column(name = "roleid", length = 255)
	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

}