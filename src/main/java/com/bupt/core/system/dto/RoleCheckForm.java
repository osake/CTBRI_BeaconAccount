package com.bupt.core.system.dto;

public class RoleCheckForm {

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_security_role.role_id
	 * 
	 * @mbggenerated Fri Sep 06 15:12:05 CST 2013
	 */
	private Integer roleId;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_security_role.name
	 * 
	 * @mbggenerated Fri Sep 06 15:12:05 CST 2013
	 */
	private String name;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_security_role.description
	 * 
	 * @mbggenerated Fri Sep 06 15:12:05 CST 2013
	 */
	private String description;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_security_role.parent_id
	 * 
	 * @mbggenerated Fri Sep 06 15:12:05 CST 2013
	 */
	
	private String roleSelectR;
	public String getRoleSelectR() {
		return roleSelectR;
	}

	public void setRoleSelectR(String roleSelectR) {
		this.roleSelectR = roleSelectR;
	}

	private Integer parentId;

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_security_role.role_id
	 * 
	 * @return the value of t_security_role.role_id
	 * 
	 * @mbggenerated Fri Sep 06 15:12:05 CST 2013
	 */
	public Integer getRoleId() {
		return roleId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_security_role.role_id
	 * 
	 * @param roleId
	 *            the value for t_security_role.role_id
	 * 
	 * @mbggenerated Fri Sep 06 15:12:05 CST 2013
	 */
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_security_role.name
	 * 
	 * @return the value of t_security_role.name
	 * 
	 * @mbggenerated Fri Sep 06 15:12:05 CST 2013
	 */
	public String getName() {
		return name;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_security_role.name
	 * 
	 * @param name
	 *            the value for t_security_role.name
	 * 
	 * @mbggenerated Fri Sep 06 15:12:05 CST 2013
	 */
	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_security_role.description
	 * 
	 * @return the value of t_security_role.description
	 * 
	 * @mbggenerated Fri Sep 06 15:12:05 CST 2013
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_security_role.description
	 * 
	 * @param description
	 *            the value for t_security_role.description
	 * 
	 * @mbggenerated Fri Sep 06 15:12:05 CST 2013
	 */
	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_security_role.parent_id
	 * 
	 * @return the value of t_security_role.parent_id
	 * 
	 * @mbggenerated Fri Sep 06 15:12:05 CST 2013
	 */
	public Integer getParentId() {
		return parentId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_security_role.parent_id
	 * 
	 * @param parentId
	 *            the value for t_security_role.parent_id
	 * 
	 * @mbggenerated Fri Sep 06 15:12:05 CST 2013
	 */
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
}
