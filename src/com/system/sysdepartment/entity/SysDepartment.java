package com.system.sysdepartment.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import com.system.sysuser.entity.SysUser;
import framework.base.entity.BaseEntity;

@Entity
@Table(name = "sys_department", catalog = "", schema = "")
public class SysDepartment extends BaseEntity {
	private static final long serialVersionUID = 1L;

//	@OneToMany  
//	@JoinColumn(name="departmentId")  
//	private Set<SysUser> sysUser = new HashSet<SysUser>();  
//
//	public Set<SysUser> getSysUser() {
//		return sysUser;
//	}
//
//	public void setSysUser(Set<SysUser> sysUser) {
//		this.sysUser = sysUser;
//	}

}
