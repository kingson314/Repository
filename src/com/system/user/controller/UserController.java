package com.system.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.system.user.entity.User;
import com.system.user.service.IUserService;

import common.util.UtilGuid;
import common.util.conver.UtilConver;
import common.util.json.UtilJackSon;
import common.util.log.UtilLog;

import framework.base.controller.BaseContorller;
import framework.base.support.Result;

/**
 * @Description:
 * @date Feb 7, 2014
 * @author:fgq
 */
@Controller
@RequestMapping("/user/")
public class UserController extends BaseContorller<User> {

	@Resource
	private IUserService userService;
	
	@RequestMapping("list")
	public void list() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		Result result = this.userService.list(this.pageParams.get("curPage"), this.pageParams.get("limit"), "from User", this.mapParams);
		this.print(result);
	}
	@RequestMapping("get")
	public void get() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		String id=this.mapParams.get("id").toString();
		User user = this.userService.get(id);
		this.print(new Result(user));
	}
	@RequestMapping("add")
	public void insertUser() {
		for (Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		User user=UtilConver.mapToBean(this.mapParams, User.class);
		user.setId(UtilGuid.getGuid());
		this.userService.save(user);
		this.print(new Result(true));
	}

	@RequestMapping("update")
	public void updateUser() {
		for (Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		User user=UtilConver.mapToBean(this.mapParams, User.class);
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
	public void login(User user) throws Exception {
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
	public String reset(User user) throws Exception {
		UtilLog.logDebug(this.request.getParameter("userName") + ":" + this.request.getParameter("password"));
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("success","FGQ");
		return this.forward("com/system/user/reset", mapParam) ;
	}
	

	@RequestMapping("forget")
	public String forget(User user) throws Exception {
		UtilLog.logDebug(this.request.getParameter("userName") + ":" + this.request.getParameter("password"));
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("success","FGQ");
		return this.forward("com/system/user/forget", mapParam) ;
	}
	
	@RequestMapping("newpsw")
	public void newpsw(User user) throws Exception {
		UtilLog.logDebug(this.request.getParameter("userName") + ":" + this.request.getParameter("password"));
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("success","FGQ");
		this.print(new Result(true));
	}
	
	
	@RequestMapping("register")
	public String register(User user) throws Exception {
		UtilLog.logDebug(this.request.getParameter("userName") + ":" + this.request.getParameter("password"));
//		List<Menu>listMenu=this.menuService.getTopMenu();
		Map<String, Object> mapParam = new HashMap<String, Object>();
//		mapParam.put("listMenu",UtilJackSon.toJson(listMenu));
		mapParam.put("success","FGQ");
		return this.forward("com/system/user/register", mapParam) ;
	}
}
