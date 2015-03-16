/**
 *  Copyright 2015 CTBRI
 *  All right reserved.
 *	<p></p>
 * @author 贺群
 * @Creat Time : 2015-3-13 下午8:50:20
 * @DepartmentAndInfo
 */
package com.bupt.core.system.model;

/**
 *  Copyright 2015 CTBRI
 *  All right reserved.
 *	<p></p>
 * @author 贺群
 * @Creat Time : 2015-3-13 下午8:50:20
 * @DepartmentAndInfo
 */
public class DepartmentAndInfo {

	private Integer departmentId;
	private Integer departmentInfoId;
	private String name;
	private String level;
	private Boolean isLeaf;
	private Integer parentId;
	private String status;
	private String dataVersion;
	private String capacity;
	
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public Boolean getIsLeaf() {
		return isLeaf;
	}
	public void setIsLeaf(Boolean isLeaf) {
		this.isLeaf = isLeaf;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDataVersion() {
		return dataVersion;
	}
	public void setDataVersion(String dataVersion) {
		this.dataVersion = dataVersion;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public Integer getDepartmentInfoId() {
		return departmentInfoId;
	}
	public void setDepartmentInfoId(Integer departmentInfoId) {
		this.departmentInfoId = departmentInfoId;
	}
}
