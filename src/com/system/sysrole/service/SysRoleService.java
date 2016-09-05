package com.system.sysrole.service;                                             
                                                                             
import org.springframework.beans.factory.annotation.Autowired;               
import org.springframework.stereotype.Service;                               
import framework.base.service.BaseService;                               
import com.system.sysrole.dao.ISysRoleDao;                                         
import com.system.sysrole.entity.SysRole;                                          
                                                                             
@Service                                                                     
public class SysRoleService extends BaseService<SysRole> implements ISysRoleService { 
                                                                             
	@Autowired                                                                  
	public void setDao(ISysRoleDao dao) {                                          
		setBaseDao(dao);                                                        
	}                                                                           
}                                                                            
