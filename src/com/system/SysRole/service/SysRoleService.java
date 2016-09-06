package com.system.SysRole.service;                                             
                                                                             
import org.springframework.beans.factory.annotation.Autowired;               
import org.springframework.stereotype.Service;                               
import framework.base.service.BaseService;                               
import com.system.SysRole.dao.ISysRoleDao;                                         
import com.system.SysRole.entity.SysRole;                                          
                                                                             
@Service                                                                     
public class SysRoleService extends BaseService<SysRole> implements ISysRoleService { 
                                                                             
	@Autowired                                                                  
	public void setDao(ISysRoleDao dao) {                                          
		setBaseDao(dao);                                                        
	}                                                                           
}                                                                            
