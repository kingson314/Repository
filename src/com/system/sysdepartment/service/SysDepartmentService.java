package com.system.sysdepartment.service;                                             
                                                                             
import org.springframework.beans.factory.annotation.Autowired;               
import org.springframework.stereotype.Service;                               
import framework.base.service.BaseService;                               
import com.system.sysdepartment.dao.ISysDepartmentDao;                                         
import com.system.sysdepartment.entity.SysDepartment;                                          
                                                                             
@Service                                                                     
public class SysDepartmentService extends BaseService<SysDepartment> implements ISysDepartmentService { 
                                                                             
	@Autowired                                                                  
	public void setDao(ISysDepartmentDao dao) {                                          
		setBaseDao(dao);                                                        
	}                                                                           
}                                                                            
