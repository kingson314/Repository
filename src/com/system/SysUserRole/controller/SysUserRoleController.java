package com.system.SysUserRole.controller;                              

import javax.annotation.Resource;                                            
import org.springframework.stereotype.Controller;                            
import org.springframework.web.bind.annotation.RequestMapping;               
import framework.base.controller.BaseContorller;                         
import framework.base.support.Result;                                    
import com.system.SysUserRole.entity.SysUserRole;                              
import com.system.SysUserRole.service.ISysUserRoleService;                     
                                                                                  
/**                                                                          
 * @Description:                                                             
 * @date 2016-09-06                              
 * @author:fgq                                                               
 */                                                                          
@Controller                                                                  
@RequestMapping("/SysUserRole/")                                             
public class SysUserRoleController extends BaseContorller<SysUserRole> {                   
                                                                                  
	@Resource                                                                
	private ISysUserRoleService sysUserRoleService;                                        
                                                                                  
	@RequestMapping("list")                                               
	public void list() {                                                     
		Result result = this.sysUserRoleService.list(this.baseParams.getPageIndex(), this.baseParams.getPageSize(), this.mapParams);   
		this.print(result);                                                  
	}                                                                        
                                                                                  
	@RequestMapping("get")                                               
	public void get() {                                                     
		this.print(new Result(this.sysUserRoleService.get(this.baseParams.getId())));                                        
	}                                                                        
                                                                                  
	@RequestMapping("save")                                               
	public void save() {                                                     
		this.sysUserRoleService.save(this.getEntity());                             
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("update")                                             
	public void update() {                                                   
		this.sysUserRoleService.update(this.getEntity());                           
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("delete")                                             
	public void delete() {                                                   
		this.sysUserRoleService.delete(this.baseParams.getId());
		this.print(new Result(true));                                        
	}                                                                        
}                                                                            
