package com.system.sysuser.entity;                     
	                                                               
import javax.persistence.Column;
import javax.persistence.Entity;                                
import javax.persistence.Table;                                 
import framework.base.entity.BaseEntity;                    
	                                                               
@Entity                                                         
@Table(name = "sys_user", catalog = "", schema = "") 
public class SysUser extends BaseEntity {                          
	private static final long serialVersionUID = 1L;     

	// 密码
	@Column(name = "password", nullable = true, unique = false, length = 100, insertable = true, updatable = true)
	private String password;
	// 用户别名
	@Column(length = 100)
	private String userAlias;
	// 部门ID(Sys_Department.id)
	@Column(length = 40)
	private String departmentId;
	// 性别(0表示男，1表示女)
	@Column(columnDefinition="INT default 0")
	private int sex;
	// 出生日期
	@Column(length = 20)
	private String birthday;
	// 移动电话
	@Column(length = 20)
	private String mobilePhone;
	// 办公室电话
	@Column(length = 20)
	private String officePhone;
	// 邮箱地址
	@Column(length = 50)
	private String email;
	// 学历
	@Column(length = 10)
	private String education;
	// 个人照片url
	@Column(length = 100)
	private String photoUrl;

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

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
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
