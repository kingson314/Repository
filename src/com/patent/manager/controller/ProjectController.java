package com.patent.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
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
@RequestMapping("/project/")
public class ProjectController extends BaseContorller<Wipo> {
	@Resource
	private IManagerService managerService;

	@RequestMapping("listProject")
	public void listProject() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		String sql = "select * from project where state=0 order by ord ";
		List<Map<String, Object>> list = this.managerService.listMap(sql, new  HashMap<String, Object>());
		try {
			System.out.println(UtilJackSon.toJson(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.print(new Result(list));
	}
	@RequestMapping("getProject")
	public void getProject() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		String id= UtilString.isNil(this.mapParams.get("id"));
		String sql = "select * from project where id='"+id+"'  ";
		List<Map<String, Object>> list = this.managerService.listMap(sql, new  HashMap<String, Object>());
		try {
			System.out.println(UtilJackSon.toJson(list.get(0)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.print(new Result(list.get(0)));
	}
	@RequestMapping("svaeProject")
	public void svaeProject() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		String name= UtilString.isNil(this.mapParams.get("name"));
		String level= UtilString.isNil(this.mapParams.get("level"));
		String relative= UtilString.isNil(this.mapParams.get("relative"));
		String memo= UtilString.isNil(this.mapParams.get("memo"));
		String ord= UtilString.isNil(this.mapParams.get("ord"));
		String files= UtilString.isNil(this.mapParams.get("files"));
		String detailurl= UtilString.isNil(this.mapParams.get("detailurl"));
		String id= UtilString.isNil(this.mapParams.get("id"));
		String sql = "select * from project where id='"+id+"'  ";
		List<Map<String, Object>> list = this.managerService.listMap(sql, new  HashMap<String, Object>());
		if(list.size()==0){
			if("".equals(id)){
			 id= UtilGuid.getGuid();
			}
			sql = "insert into project(id,name,level,relative,memo,ord,state,files,detailurl)values('"
				+id+"','"+name+"','"+level+"','"+relative+"','"+memo+"','"+ord+"',0,'"+files+"','"+detailurl+"')";
		}else{ 
			sql = "update project set name='"+name+"',level='"+level+"',relative='"+relative+"',memo='"+memo+"',files='"+files+"',detailurl='"+detailurl+"',ord='"+ord+"' where id='"+id+"'";
		}
		System.out.println(sql);
		this.managerService.executeSql(sql);
		//生成明细页面
		String realPath=this.request.getSession().getServletContext().getRealPath("");
		String content=UtilFile.readFile(realPath+"/patent/ProjectDetailTpl.jsp");
		StringBuilder sbHtml=new StringBuilder();
		String[] fileArr=files.split(",");
		String basePath=request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/upload/";
		for(String sfile:fileArr){
			sbHtml.append("<div class='row'><div class='col-md-12'>");
			sbHtml.append("<img src='"+basePath+sfile+"'/ style='width:100%'>");
			sbHtml.append("</div></div>");
		}
		UtilFile.writeFile(realPath+"/"+id+".jsp", content.replace("<%-- dyn html --%>",sbHtml.toString()).replace("<%-- dyn name --%>",name)); 
		//
		this.print(new Result(true,id));
	}
	
	@RequestMapping("deleteProject")
	public void deleteProject() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		String[] ids= UtilString.isNil(this.mapParams.get("ids")).split(",");
		for(String id:ids){
			String sql = "update project set state=1 where id='"+id+"'";
			this.managerService.executeSql(sql);
		}
		this.print(new Result(true));
	}
	@RequestMapping("createPage")
	public void createPage() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		String sql = "select * from project where state=0 order by ord ";
		List<Map<String, Object>> list = this.managerService.listMap(sql, new  HashMap<String, Object>());
		StringBuilder sbHtml=new StringBuilder();
		String basePath=request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() +"/";
		for(Map<String, Object> map:list){
			sbHtml.append("<tr><td width='15%'><a href='"+basePath+map.get("id")+".jsp'>"+UtilString.isNil(map.get("name"))+"</a></td><td width='15%'>"+UtilString.isNil(map.get("level"))
			+"</td><td width='25%'>"+UtilString.isNil(map.get("relavite"))+"</td><td width='15%'>"+UtilString.isNil(map.get("memo"))
			+"</td></tr>");
		}
		String realPath=this.request.getSession().getServletContext().getRealPath("");
		String content=UtilFile.readFile(realPath+"/patent/ProjectTpl.jsp");
		UtilFile.writeFile(realPath+"/Project.jsp", content.replace("<%-- dyn html --%>",sbHtml.toString())); 
		this.print(new Result(true,basePath+ "Project.jsp"));
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("upload")
	public void upload() throws IOException {
		List<MultipartFile> listUpload=(List<MultipartFile>)this.mapParams.get("listUpload");
		String id= UtilString.isNil(this.mapParams.get("id"));
		if("".equals(id)){
			id= UtilGuid.getGuid();
		}
		List<String>listFileName=new ArrayList<String>();
		for(int i=0;i<listUpload.size();i++){
			MultipartFile file =listUpload.get(i);
			int pre = (int) System.currentTimeMillis();
			// 取得当前上传文件的文件名称
			String fileName = file.getOriginalFilename();
			String suffix =file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));  
			// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
			if (fileName.trim() != "") {
				System.out.println(fileName);
				// 重命名上传后的文件名
				// 定义上传路径
				String filePath = this.request.getSession().getServletContext().getRealPath("/upload")+"/"+ id+"_"+i+suffix;
				listFileName.add(id+"_"+i+suffix);
				UtilFile.writeFile(filePath, file.getBytes());
			}
			// 记录上传该文件后的时间
			int finaltime = (int) System.currentTimeMillis();
			System.out.println(finaltime - pre);
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("files", listFileName);
		this.print(new Result(map));
	}
}
