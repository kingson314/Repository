package com.system.SysDepartment.controller;                              

import javax.annotation.Resource;                                            
import org.springframework.stereotype.Controller;                            
import org.springframework.web.bind.annotation.RequestMapping;               
import framework.base.controller.BaseContorller;                         
import framework.base.support.Result;                                    
import com.system.SysDepartment.entity.SysDepartment;                              
import com.system.SysDepartment.service.ISysDepartmentService;                     
                                                                                  
/**                                                                          
 * @Description:                                                             
 * @date 2016-09-06                              
 * @author:fgq                                                               
 */                                                                          
@Controller                                                                  
@RequestMapping("/SysDepartment/")                                             
public class SysDepartmentController extends BaseContorller<SysDepartment> {                   
                                                                                  
	@Resource                                                                
	private ISysDepartmentService sysDepartmentService;                                        
                                                                                  
	@RequestMapping("list")                                               
	public void list() {                                                     
		Result result = this.sysDepartmentService.list(this.baseParams.getPageIndex(), this.baseParams.getPageSize(), this.mapParams);   
		this.print(result);                                                  
	}                                                                        
                                                                                  
	@RequestMapping("get")                                               
	public void get() {                                                     
		this.print(new Result(this.sysDepartmentService.get(this.baseParams.getId())));                                        
	}                                                                        
                                                                                  
	@RequestMapping("save")                                               
	public void save() {                                                     
		this.sysDepartmentService.save(this.getEntity());                             
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("update")                                             
	public void update() {                                                   
		this.sysDepartmentService.update(this.getEntity());                           
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("delete")                                             
	public void delete() {                                                   
		this.sysDepartmentService.delete(this.baseParams.getId());
		this.print(new Result(true));                                        
	}                                                                        
}                                                                            
