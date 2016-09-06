package com.system.Database.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.system.Database.entity.Database;
import com.system.Database.service.IDatabaseService;


import common.util.UtilGuid;
import common.util.conver.UtilConver;
import common.util.log.UtilLog;

import framework.base.controller.BaseContorller;
import framework.base.support.Result;

/**
 * @Description:
 * @date Feb 7, 2014
 * @author:fgq
 */
@Controller
@RequestMapping("/Database/")
public class DatabaseController extends BaseContorller<Database> {

	@Resource
	private IDatabaseService userService;
	
	@RequestMapping("list")
	public void list() {
	}
	
	@RequestMapping("tables")
	public void tables(){
		System.out.println("/*** 表信息 ***/");
		String sql="SELECT table_name text,table_name value  FROM information_schema.tables WHERE table_schema='test' ORDER BY table_name asc";
		List<Map<String, Object>>list = this.userService.listMap(sql);
		for(Map<String ,Object>map:list){
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
			}
		}
		this.print(new Result(list));
	}
	@RequestMapping("fields")
	public void fields(){
		System.out.println("/*** 字段信息 ***/");
		String sql="SELECT COLUMN_NAME,IS_NULLABLE ISNULL,DATA_TYPE,replace(replace(replace(replace(replace(replace( replace (COLUMN_TYPE,'longtext',''),'int(',''),')',''),'varchar(',''),'datetime',''),'double',''),'text','') DATA_LEN FROM information_schema.COLUMNS  where TABLE_SCHEMA like 'test' and TABLE_NAME like '"+this.mapParams.get("tablename")+"';";
		List<Map<String, Object>> list = this.userService.listMap(sql);
		for(Map<String ,Object>map:list){
			System.out.println("************************");
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
			}
		}
		this.print(new Result(list));
	}
	
	@RequestMapping("generate")
	public void generate() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		this.print(new Result(true));
	}
	@RequestMapping("select")
	public void select(){
		System.out.println("/*** 表信息 ***/");
		String sql="select id value ,name text from sys_user ";
		List<Map<String, Object>>list = this.userService.listMap(sql);
		for(Map<String ,Object>map:list){
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
			}
		}
		this.print(new Result(list));
	}
	@RequestMapping("get")
	public void get(){
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		String id=this.mapParams.get("id").toString();
		Database user = this.userService.get(id);
		this.print(new Result(user));
	}
	
	@RequestMapping("add")
	public void insertUser() {
		for (Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		Database user=UtilConver.mapToBean(this.mapParams, Database.class);
		user.setId(UtilGuid.getGuid());
		this.userService.save(user);
		this.print(new Result(true));
	}

	@RequestMapping("update")
	public void updateUser() {
		for (Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		Database user=UtilConver.mapToBean(this.mapParams, Database.class);
		this.userService.update(user);
		this.print(new Result(true));	
	}

	@RequestMapping("delete")
	public void delUser() {
		for (Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue().toString());
		}
		this.userService.delete((String[]) this.mapParams.get("id"));
		this.print(new Result(true));	
	}
	
	@RequestMapping("login")
	public void login(Database user) throws Exception {
		UtilLog.logDebug(this.request.getParameter("id") + ":" + this.request.getParameter("password"));
		String id=this.mapParams.get("id").toString();
		String password=this.mapParams.get("password").toString();
		 int count=this.userService.count("from User where id='"+id+"' and password='"+password+"'");
		 if(count>0){
			 this.print(new Result(true));
		 }else{
			 this.print(new Result(false));
		 }
		//return this.redirect("app/app-main.jsp", mapParam) ;
	}

	@RequestMapping("reset")
	public String reset(Database user) throws Exception {
		UtilLog.logDebug(this.request.getParameter("userName") + ":" + this.request.getParameter("password"));
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("success","FGQ");
		return this.forward("com/system/user/reset", mapParam) ;
	}

	@RequestMapping("forget")
	public String forget(Database user) throws Exception {
		UtilLog.logDebug(this.request.getParameter("userName") + ":" + this.request.getParameter("password"));
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("success","FGQ");
		return this.forward("com/system/user/forget", mapParam) ;
	}
	
	@RequestMapping("newpsw")
	public void newpsw(Database user) throws Exception {
		UtilLog.logDebug(this.request.getParameter("userName") + ":" + this.request.getParameter("password"));
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("success","FGQ");
		this.print(new Result(true));
	}
	
	@RequestMapping("register")
	public String register(Database user) throws Exception {
		UtilLog.logDebug(this.request.getParameter("userName") + ":" + this.request.getParameter("password"));
//		List<Menu>listMenu=this.menuService.getTopMenu();
		Map<String, Object> mapParam = new HashMap<String, Object>();
//		mapParam.put("listMenu",UtilJackSon.toJson(listMenu));
		mapParam.put("success","FGQ");
		return this.forward("com/system/user/register", mapParam) ;
	}
}
