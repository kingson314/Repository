package com.system.SysRole.controller;                              

import javax.annotation.Resource;                                            
import org.springframework.stereotype.Controller;                            
import org.springframework.web.bind.annotation.RequestMapping;               
import framework.base.controller.BaseContorller;                         
import framework.base.support.Result;                                    
import com.system.SysRole.entity.SysRole;                              
import com.system.SysRole.service.ISysRoleService;                     
                                                                                  
/**                                                                          
 * @Description:                                                             
 * @date 2016-09-06                              
 * @author:fgq                                                               
 */                                                                          
@Controller                                                                  
@RequestMapping("/SysRole/")                                             
public class SysRoleController extends BaseContorller<SysRole> {                   
                                                                                  
	@Resource                                                                
	private ISysRoleService sysRoleService;                                        
                                                                                  
	@RequestMapping("list")                                               
	public void list() {                                                     
		Result result = this.sysRoleService.list(this.baseParams.getPageIndex(), this.baseParams.getPageSize(), this.mapParams);   
		this.print(result);                                                  
	}                                                                        
                                                                                  
	@RequestMapping("get")                                               
	public void get() {                                                     
		this.print(new Result(this.sysRoleService.get(this.baseParams.getId())));                                      
	}                                                                        
                                                                                  
	@RequestMapping("save")                                               
	public void save() {                                                     
		this.sysRoleService.save(this.getEntity());                             
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("update")                                             
	public void update() {                                                   
		this.sysRoleService.update(this.getEntity());                           
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("delete")                                             
	public void delete() {                                                   
		this.sysRoleService.delete(this.baseParams.getId());
		this.print(new Result(true));                                        
	}                                                                        
}                                                                            
