package com.patent.manager.service;                                             
                                                                             
import org.springframework.beans.factory.annotation.Autowired;               
import org.springframework.stereotype.Service;                               
import framework.base.service.BaseService;                               
import com.patent.wipo.dao.IWipoDao;                                         
import com.patent.wipo.entity.Wipo;                                          
                                                                             
@Service                                                                     
public class ManagerService extends BaseService<Wipo> implements IManagerService { 
                                                                             
	@Autowired                                                                  
	public void setDao(IWipoDao dao) {                                          
		setBaseDao(dao);                                                        
	}                                                                           
}                                                                            
