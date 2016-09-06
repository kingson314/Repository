package com.system.SysDepartment.service;                                             
                                                                             
import org.springframework.beans.factory.annotation.Autowired;               
import org.springframework.stereotype.Service;                               
import framework.base.service.BaseService;                               
import com.system.SysDepartment.dao.ISysDepartmentDao;                                         
import com.system.SysDepartment.entity.SysDepartment;                                          
                                                                             
@Service                                                                     
public class SysDepartmentService extends BaseService<SysDepartment> implements ISysDepartmentService { 
                                                                             
	@Autowired                                                                  
	public void setDao(ISysDepartmentDao dao) {                                          
		setBaseDao(dao);                                                        
	}                                                                           
}                                                                            
