package com.system.sysuser.controller;                              

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.system.sysuser.entity.SysUser;
import com.system.sysuser.service.ISysUserService;

import framework.base.controller.BaseContorller;
import framework.base.support.Result;
                                                                                  
/**                                                                          
 * @Description:                                                             
 * @date 2016-09-02                              
 * @author:fgq                                                               
 */                                                                          
@Controller                                                                  
@RequestMapping("/sysuser/")                                             
public class SysUserController extends BaseContorller<SysUser> {                   
                                                                                  
	@Resource                                                                
	private ISysUserService sysuserService;                                        
                                                                                  
	@RequestMapping("list")                                               
	public void list() {           
		Result result = this.sysuserService.list(this.pager.getPageIndex(), this.pager.getPageSize(), this.mapParams);   
		this.print(result);                                                  
	}                                                                        
                                                                                  
	@RequestMapping("save")                                               
	public void save() {                                                     
		this.sysuserService.save(this.getEntity());                             
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("update")                                             
	public void update() {                                                   
		this.sysuserService.update(this.getEntity());                           
		this.print(new Result(true));                                        
	}                                                                        
                                                                                  
	@RequestMapping("delete")                                             
	public void delete() {                                                   
		this.sysuserService.delete(this.getEntity());                           
		this.print(new Result(true));                                        
	}                                                                        
}                                                                            
