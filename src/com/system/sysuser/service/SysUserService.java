package com.system.sysuser.service;                                             
                                                                             
import org.springframework.beans.factory.annotation.Autowired;               
import org.springframework.stereotype.Service;                               
import framework.base.service.BaseService;                               
import com.system.sysuser.dao.ISysUserDao;                                         
import com.system.sysuser.entity.SysUser;                                          
                                                                             
@Service                                                                     
public class SysUserService extends BaseService<SysUser> implements ISysUserService { 
                                                                             
	@Autowired                                                                  
	public void setDao(ISysUserDao dao) {                                          
		setBaseDao(dao);                                                        
	}                                                                           
}                                                                            
