package com.system.SysUserRole.entity;                     
	                                                               
import javax.persistence.Column;
import javax.persistence.Entity;                                
import javax.persistence.Table;                                 
import framework.base.entity.SuperEntity;                    
	                                                               
@Entity                                                         
@Table(name = "sys_user_role", catalog = "", schema = "") 
public class SysUserRole extends SuperEntity {                          
	private static final long serialVersionUID = 1L;      
	
	@Column(nullable = false,length = 40)
	protected String userId;
	
	@Column(nullable = false,length = 40)
	protected String roleId;
}                                                               
