package com.bupt.core.system.model;

import java.util.Date;

public class UserInfo {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_security_user_info.user_info_id
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    private Integer userInfoId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_security_user_info.user_id
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    private Integer userId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_security_user_info.email
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    private String email;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_security_user_info.telephone
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    private String telephone;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_security_user_info.permit_num
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    private String permitNum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_security_user_info.birthday
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    private Date birthday;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_security_user_info.hireday
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    private Date hireday;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_security_user_info.type
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    private String type;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_security_user_info.sex
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    private Boolean sex;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_security_user_info.contact_num
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    private String contactNum;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_security_user_info.user_info_id
     *
     * @return the value of t_security_user_info.user_info_id
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public Integer getUserInfoId() {
        return userInfoId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_security_user_info.user_info_id
     *
     * @param userInfoId the value for t_security_user_info.user_info_id
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public void setUserInfoId(Integer userInfoId) {
        this.userInfoId = userInfoId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_security_user_info.user_id
     *
     * @return the value of t_security_user_info.user_id
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_security_user_info.user_id
     *
     * @param userId the value for t_security_user_info.user_id
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_security_user_info.email
     *
     * @return the value of t_security_user_info.email
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_security_user_info.email
     *
     * @param email the value for t_security_user_info.email
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_security_user_info.telephone
     *
     * @return the value of t_security_user_info.telephone
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_security_user_info.telephone
     *
     * @param telephone the value for t_security_user_info.telephone
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_security_user_info.permit_num
     *
     * @return the value of t_security_user_info.permit_num
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public String getPermitNum() {
        return permitNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_security_user_info.permit_num
     *
     * @param permitNum the value for t_security_user_info.permit_num
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public void setPermitNum(String permitNum) {
        this.permitNum = permitNum == null ? null : permitNum.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_security_user_info.birthday
     *
     * @return the value of t_security_user_info.birthday
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_security_user_info.birthday
     *
     * @param birthday the value for t_security_user_info.birthday
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_security_user_info.hireday
     *
     * @return the value of t_security_user_info.hireday
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public Date getHireday() {
        return hireday;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_security_user_info.hireday
     *
     * @param hireday the value for t_security_user_info.hireday
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public void setHireday(Date hireday) {
        this.hireday = hireday;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_security_user_info.type
     *
     * @return the value of t_security_user_info.type
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public String getType() {
        return type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_security_user_info.type
     *
     * @param type the value for t_security_user_info.type
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_security_user_info.sex
     *
     * @return the value of t_security_user_info.sex
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public Boolean getSex() {
        return sex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_security_user_info.sex
     *
     * @param sex the value for t_security_user_info.sex
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_security_user_info.contact_num
     *
     * @return the value of t_security_user_info.contact_num
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public String getContactNum() {
        return contactNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_security_user_info.contact_num
     *
     * @param contactNum the value for t_security_user_info.contact_num
     *
     * @mbggenerated Mon Dec 16 17:30:03 CST 2013
     */
    public void setContactNum(String contactNum) {
        this.contactNum = contactNum == null ? null : contactNum.trim();
    }
}