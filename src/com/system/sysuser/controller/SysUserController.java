package com.system.SysUser.controller;                              

import javax.annotation.Resource;                                            
import org.springframework.stereotype.Controller;                            
import org.springframework.web.bind.annotation.RequestMapping;               
import framework.base.controller.BaseContorller;                         
import framework.base.entity.SuperEntity;
import framework.base.support.Result;                                    
import com.system.SysUser.entity.SysUser;                              
import com.system.SysUser.service.ISysUserService;                     
                                                                                  
/**                                                                          
 * @Description:                                                             
 * @date 2016-09-06                              
 * @author:fgq                                                               
 */                                                                          
@Controller                                                                  
@RequestMapping("/SysUser/")                                             
public class SysUserController extends BaseContorller<SysUser> {                   
                                                                                  
	@Resource                                                                
	private ISysUserService sysUserService;                                        
                                                                                  
	@RequestMapping("list")                                               
	public void list() {                                                     
		Result result = this.sysUserService.list(this.baseParams.getPageIndex(), this.baseParams.getPageSize(), this.mapParams);   
		this.print(result);                                                  
	}                                                                        
                                                                                  
	@RequestMapping("get")                                               
	public void get() {                                                     
		this.print(new Result(this.sysUserService.get(this.baseParams.getId())));                                        
	}                                                                        
                                                                                  
	@RequestMapping("save")                                               
	public void save() {                                                     
		this.sysUserService.save(this.getEntity());                             
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("update")                                             
	public void update() {                                                   
		this.sysUserService.update(this.getEntity());                           
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("delete")                                             
	public void delete() {                                                   
		this.sysUserService.delete(this.baseParams.getId());
		this.print(new Result(true));                                        
	}                                                                        
}                                                                            
