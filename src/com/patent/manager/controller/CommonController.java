package com.patent.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.patent.manager.service.IManagerService;
import com.patent.wipo.entity.Wipo;
import common.util.UtilGuid;
import common.util.file.UtilFile;
import common.util.json.UtilJackSon;
import common.util.log.UtilLog;
import common.util.string.UtilString;
import framework.base.controller.BaseContorller;
import framework.base.support.Result;
/**
 * @Description:
 * @date 2016-07-13
 * @author:fgq
 */
@Controller
@RequestMapping("/common/")
public class CommonController extends BaseContorller<Wipo> {
	@Resource
	private IManagerService managerService;

	@RequestMapping("listCommon")
	public void listCommon() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		String recType=UtilString.isNil(this.mapParams.get("recType"));
		String sql = "select * from common where state=0 and rectype="+recType+" order by ord ";
		List<Map<String, Object>> list = this.managerService.listMap(sql, new  HashMap<String, Object>());
		try {
			System.out.println(UtilJackSon.toJson(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.print(new Result(list));
	}
	@RequestMapping("getCommon")
	public void getCommon() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		String id= UtilString.isNil(this.mapParams.get("id"));
		String sql = "select * from common where id='"+id+"'  ";
		List<Map<String, Object>> list = this.managerService.listMap(sql, new  HashMap<String, Object>());
		try {
			System.out.println(UtilJackSon.toJson(list.get(0)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.print(new Result(list.get(0)));
	}
	@RequestMapping("svaeCommon")
	public void svaeCommon() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		String domain= UtilString.isNil(this.mapParams.get("domain"));
		String num= UtilString.isNil(this.mapParams.get("num"));
		String name= UtilString.isNil(this.mapParams.get("name"));
		String status= UtilString.isNil(this.mapParams.get("status"));
		String pdate= UtilString.isNil(this.mapParams.get("pdate"));
		String ord= UtilString.isNil(this.mapParams.get("ord"));
		String recType=UtilString.isNil(this.mapParams.get("recType"));
		String type=UtilString.isNil(this.mapParams.get("type"));
		String sql ="";
		if("".equals(UtilString.isNil(this.mapParams.get("id")))){
			String id= UtilGuid.getGuid();
			sql = "insert into common(id,domain,num,name,type,status,pdate,ord,state,recType)values('"+id+"','"+domain+"','"+num+"','"+name+"','"+type+"','"+status+"','"+pdate+"','"+ord+"',0,'"+recType+"')";
		}else{
			String id=this.mapParams.get("id").toString();
			sql = "update common set domain='"+domain+"',num='"+num+"',name='"+name+"',type='"+type+"',status='"+status+"',pdate='"+pdate+"',ord='"+ord+"' where id='"+id+"'";
		}
		System.out.println(sql);
		this.managerService.executeSql(sql);
		this.print(new Result(true));
	}
	
	@RequestMapping("deleteCommon")
	public void deleteCommon() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		String[] ids= UtilString.isNil(this.mapParams.get("ids")).split(",");
		for(String id:ids){
			String sql = "update common set state=1 where id='"+id+"'";
			this.managerService.executeSql(sql);
		}
		this.print(new Result(true));
	}
	@RequestMapping("createPage")
	public void createPage() {
		String recType=UtilString.isNil(this.mapParams.get("recType"));
		String pdateTitle="授权公告日";
		String title="授权专利清单";
		if("1".equals(recType)){
			pdateTitle="办登截止日";
			title="授权未下证专利清单";
		}
		String sql = "select * from common where state=0 and rectype="+recType+" order by ord ";
		List<Map<String, Object>> list = this.managerService.listMap(sql, new  HashMap<String, Object>());
		StringBuilder sbHtml=new StringBuilder();
		String basePath=request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() +"/";
		for(Map<String, Object> map:list){
			sbHtml.append("<tr><td width='15%'>"+UtilString.isNil(map.get("domain"))+"</td><td width='15%'>"+UtilString.isNil(map.get("num"))
			+"</td><td width='25%'>"+UtilString.isNil(map.get("name"))+"</td><td width='15%'>"+UtilString.isNil(map.get("type"))
			+"</td><td width='15%'>"+UtilString.isNil(map.get("status"))
			+"</td><td width='15%'>"+UtilString.isNil(map.get("pdate"))
			+"</td></tr>");
		}
		String realPath=this.request.getSession().getServletContext().getRealPath("");
		String content=UtilFile.readFile(realPath+"/patent/CommonTpl.jsp");
		UtilFile.writeFile(realPath+"/Common"+recType+".jsp", content.replace("<%-- dyn html --%>",sbHtml.toString()).replace("<%-- dyn pdateTitle --%>", pdateTitle).replace("<%-- dyn Title --%>", title)); 
		this.print(new Result(true,basePath+ "Common"+recType+".jsp"));
	}
}
