package com.sendi.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import org.hibernate.annotations.GenericGenerator;

/**
 * Functionmoudle entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "functionmoudle", uniqueConstraints = @UniqueConstraint(columnNames = "moudleid"))
public class Functionmoudle implements java.io.Serializable {

	// Fields

	private Integer id;
	private String moudletitle;
	private String moudleid;
	private String moudletype;
	private String isleaf;
	private String openurl;
	private String icon;
	private Integer parentid;
	private Integer orderid;
	private String iconcls;
	private String addshutcut;
	private String shutcuturl;
	private String dependtree;

	// Constructors
	/** default constructor */
	public Functionmoudle() {
	}

	/** full constructor */
	public Functionmoudle(String moudletitle, String moudleid,
			String moudletype, String isleaf, String openurl, String icon,
			Integer parentid, Integer orderid, String iconcls,
			String addshutcut, String shutcuturl,String dependtree) {
		this.moudletitle = moudletitle;
		this.moudleid = moudleid;
		this.moudletype = moudletype;
		this.isleaf = isleaf;
		this.openurl = openurl;
		this.icon = icon;
		this.parentid = parentid;
		this.orderid = orderid;
		this.iconcls = iconcls;
		this.addshutcut = addshutcut;
		this.shutcuturl = shutcuturl;
		this.dependtree = dependtree;
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

	@Column(name = "moudletitle", length = 150)
	public String getMoudletitle() {
		return this.moudletitle;
	}

	public void setMoudletitle(String moudletitle) {
		this.moudletitle = moudletitle;
	}

	@Column(name = "moudleid", unique = true, length = 50)
	public String getMoudleid() {
		return this.moudleid;
	}

	public void setMoudleid(String moudleid) {
		this.moudleid = moudleid;
	}

	@Column(name = "moudletype", length = 5)
	public String getMoudletype() {
		return this.moudletype;
	}

	public void setMoudletype(String moudletype) {
		this.moudletype = moudletype;
	}

	@Column(name = "isleaf", length = 5)
	public String getIsleaf() {
		return this.isleaf;
	}

	public void setIsleaf(String isleaf) {
		this.isleaf = isleaf;
	}

	@Column(name = "openurl", length = 100)
	public String getOpenurl() {
		return this.openurl;
	}

	public void setOpenurl(String openurl) {
		this.openurl = openurl;
	}

	@Column(name = "icon", length = 100)
	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Column(name = "parentid")
	public Integer getParentid() {
		return this.parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	@Column(name = "orderid")
	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	@Column(name = "iconcls", length = 20)
	public String getIconcls() {
		return this.iconcls;
	}

	public void setIconcls(String iconcls) {
		this.iconcls = iconcls;
	}

	@Column(name = "addshutcut", length = 20)
	public String getAddshutcut() {
		return this.addshutcut;
	}

	public void setAddshutcut(String addshutcut) {
		this.addshutcut = addshutcut;
	}

	@Column(name = "shutcuturl", length = 200)
	public String getShutcuturl() {
		return this.shutcuturl;
	}

	public void setShutcuturl(String shutcuturl) {
		this.shutcuturl = shutcuturl;
	}
	

	@Column(name = "dependtree", length = 20)
	public String getDependTree() {
		return dependtree;
	}

	public void setDependTree(String dependtree) {
		this.dependtree = dependtree;
	}


}