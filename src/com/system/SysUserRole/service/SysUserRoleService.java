package com.system.SysUserRole.service;                                             
                                                                             
import org.springframework.beans.factory.annotation.Autowired;               
import org.springframework.stereotype.Service;                               
import framework.base.service.BaseService;                               
import com.system.SysUserRole.dao.ISysUserRoleDao;                                         
import com.system.SysUserRole.entity.SysUserRole;                                          
                                                                             
@Service                                                                     
public class SysUserRoleService extends BaseService<SysUserRole> implements ISysUserRoleService { 
                                                                             
	@Autowired                                                                  
	public void setDao(ISysUserRoleDao dao) {                                          
		setBaseDao(dao);                                                        
	}                                                                           
}                                                                            
