package com.system.sysdepartment.controller;                              

import javax.annotation.Resource;                                            
import org.springframework.stereotype.Controller;                            
import org.springframework.web.bind.annotation.RequestMapping;               
import framework.base.controller.BaseContorller;                         
import framework.base.support.Result;                                    
import com.system.sysdepartment.entity.SysDepartment;                              
import com.system.sysdepartment.service.ISysDepartmentService;                     
                                                                                  
/**                                                                          
 * @Description:                                                             
 * @date 2016-09-05                              
 * @author:fgq                                                               
 */                                                                          
@Controller                                                                  
@RequestMapping("/sysdepartment/")                                             
public class SysDepartmentController extends BaseContorller<SysDepartment> {                   
                                                                                  
	@Resource                                                                
	private ISysDepartmentService sysdepartmentService;                                        
                                                                                  
	@RequestMapping("list")                                               
	public void list() {                                                     
		Result result = this.sysdepartmentService.list(1, 10, "from SysDepartment", null);   
		this.print(result);                                                  
	}                                                                        
                                                                                  
	@RequestMapping("save")                                               
	public void save() {                                                     
		this.sysdepartmentService.save(this.getEntity());                             
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("update")                                             
	public void update() {                                                   
		this.sysdepartmentService.update(this.getEntity());                           
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("delete")                                             
	public void delete() {                                                   
		this.sysdepartmentService.delete(this.getEntity());                           
		this.print(new Result(true));                                        
	}                                                                        
}                                                                            
