package com.bupt.core.system.model;

public class RolePrivilegeKey {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_security_role_privilege.privilege_id
     *
     * @mbggenerated Wed Sep 25 18:54:09 CST 2013
     */
    private Integer privilegeId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_security_role_privilege.role_id
     *
     * @mbggenerated Wed Sep 25 18:54:09 CST 2013
     */
    private Integer roleId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_security_role_privilege.privilege_id
     *
     * @return the value of t_security_role_privilege.privilege_id
     *
     * @mbggenerated Wed Sep 25 18:54:09 CST 2013
     */
    public Integer getPrivilegeId() {
        return privilegeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_security_role_privilege.privilege_id
     *
     * @param privilegeId the value for t_security_role_privilege.privilege_id
     *
     * @mbggenerated Wed Sep 25 18:54:09 CST 2013
     */
    public void setPrivilegeId(Integer privilegeId) {
        this.privilegeId = privilegeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_security_role_privilege.role_id
     *
     * @return the value of t_security_role_privilege.role_id
     *
     * @mbggenerated Wed Sep 25 18:54:09 CST 2013
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_security_role_privilege.role_id
     *
     * @param roleId the value for t_security_role_privilege.role_id
     *
     * @mbggenerated Wed Sep 25 18:54:09 CST 2013
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}