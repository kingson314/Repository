package com.system.sysrole.controller;                              

import javax.annotation.Resource;                                            
import org.springframework.stereotype.Controller;                            
import org.springframework.web.bind.annotation.RequestMapping;               
import framework.base.controller.BaseContorller;                         
import framework.base.support.Result;                                    
import com.system.sysrole.entity.SysRole;                              
import com.system.sysrole.service.ISysRoleService;                     
                                                                                  
/**                                                                          
 * @Description:                                                             
 * @date 2016-09-05                              
 * @author:fgq                                                               
 */                                                                          
@Controller                                                                  
@RequestMapping("/sysrole/")                                             
public class SysRoleController extends BaseContorller<SysRole> {                   
                                                                                  
	@Resource                                                                
	private ISysRoleService sysroleService;                                        
                                                                                  
	@RequestMapping("list")                                               
	public void list() {                                                     
		Result result = this.sysroleService.list(thisbaseParams.getPageIndex(), thisbaseParams.getPageSize(), this.mapParams);   
		this.print(result);                                                  
	}                                                                        
                                                                                  
	@RequestMapping("get")                                               
	public void get() {                                                     
		this.sysroleService.get(this.baseParams.getId()[0]);
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("save")                                               
	public void save() {                                                     
		this.sysroleService.save(this.getEntity());                             
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("update")                                             
	public void update() {                                                   
		this.sysroleService.update(this.getEntity());                           
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("delete")                                             
	public void delete() {                                                   
		this.sysroleService.delete(this.getEntity());                           
		this.print(new Result(true));                                        
	}                                                                        
}                                                                            
