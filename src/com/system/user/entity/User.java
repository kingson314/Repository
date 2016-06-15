package com.system.user.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import framework.base.entity.BaseEntity;

@Entity
@Table(name = "sys_user", catalog = "", schema = "")
public class User extends BaseEntity {
	private static final long serialVersionUID = 1L;

	// 密码
	private String password;
	// 用户别名
	private String userAlias;
	// 职位ID(Sys_post.id)
	private String postId;
	// 性别(0表示男，1表示女)
	private int sex;
	// 出生日期
	private String birthday;
	// 移动电话
	private String mobilePhone;
	// 办公室电话
	private String officePhone;
	// 邮箱地址
	private String email;
	// 学历
	private String education;
	// 个人照片url
	private String photoUrl;

	@Column(name = "password", nullable = false, unique = false, length = 100, insertable = true, updatable = true /*, columnDefinition = "DATE"*/)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserAlias() {
		return userAlias;
	}

	public void setUserAlias(String userAlias) {
		this.userAlias = userAlias;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getOfficePhone() {
		return officePhone;
	}

	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

}
