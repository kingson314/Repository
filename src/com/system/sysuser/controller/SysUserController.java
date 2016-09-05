package com.system.sysuser.controller;                              

import java.io.IOException;
import javax.annotation.Resource;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.system.sysuser.entity.SysUser;
import com.system.sysuser.service.ISysUserService;
import common.util.json.UtilJackSon;
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
		Result result = this.sysuserService.list(this.baseParams.getPageIndex(), this.baseParams.getPageSize(), this.mapParams);
		try {
			System.out.println(UtilJackSon.toJson(result));
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		this.print(result);                                                  
	}                                                                        
         

	@RequestMapping("get")                                               
	public void get() {                                                     
		this.sysuserService.get(this.baseParams.getId()[0]);                             
		this.print(new Result(true));                                        
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
		this.sysuserService.delete(this.baseParams.getId());                           
		this.print(new Result(true));                                        
	}  
	
	@RequestMapping("test")                                             
	public void test() throws JsonGenerationException, JsonMappingException, IOException {    
//		SysDepartment sysDepartment=new SysDepartment();
//		sysDepartment.setId("123");
//		sysDepartment.setName("管理部");
//		SysUser sysUser=new SysUser();
//		sysUser.setName("fgq_new");
//		sysUser.setSysDepartment(sysDepartment);
//		this.sysuserService.save(sysUser);
		SysUser sysUser =this.sysuserService.get("40289de656f896b50156f896eb480000");
		System.out.println(sysUser.getName());
		System.out.println(UtilJackSon.toJson(sysUser.getSysDepartment()));
		this.print(new Result(true));                                        
	} 
	
}                                                                            
