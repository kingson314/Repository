package com.system.SysUser.service;                                             
                                                                             
import org.springframework.beans.factory.annotation.Autowired;               
import org.springframework.stereotype.Service;                               
import framework.base.service.BaseService;                               
import com.system.SysUser.dao.ISysUserDao;                                         
import com.system.SysUser.entity.SysUser;                                          
                                                                             
@Service                                                                     
public class SysUserService extends BaseService<SysUser> implements ISysUserService { 
                                                                             
	@Autowired                                                                  
	public void setDao(ISysUserDao dao) {                                          
		setBaseDao(dao);                                                        
	}                                                                           
}                                                                            
