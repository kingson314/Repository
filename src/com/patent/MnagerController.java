//package com.patent;
//import java.util.List;
//import java.util.Map;
//import org.codehaus.jackson.type.TypeReference;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import com.patent.wipo.entity.Wipo;
//import common.util.file.UtilFile;
//import common.util.json.UtilJackSon;
//import framework.base.controller.BaseContorller;
//import framework.base.support.Result;
//
///**
// * @Description:
// * @date 2015-07-07
// * @author:fgq
// */
//@Controller
//@RequestMapping("/manager/")
//public class MnagerController extends BaseContorller<Wipo> {
//	@RequestMapping("getCommon")
//	public void getCommon() {
//		String basePath=this.request.getSession().getServletContext().getRealPath("");
//		//String sqh = this.mapParams.get("sqh").toString();
//		String content=UtilFile.readFile(basePath+"/data/common.json");
//		System.out.println(content);
//		List<Map> list=UtilJackSon.toObj(content,new TypeReference<List<Map>>() {
//		});
//		this.print(new Result(list));
//	}
//	
//	@RequestMapping("svaeCommon")
//	public void svaeCommon() {
//		String content = this.mapParams.get("params").toString();
//		UtilFile.writeFile("D:\\GitHub\\Patent\\WebRoot\\data\\common.json", content);
//		content=UtilFile.readFile("D:\\GitHub\\Patent\\WebRoot\\data\\common.json");
//		System.out.println(content);
//		this.print(new Result(true));
//	}
//	public static void main(String[] args) {
//		String content=UtilFile.readFile("D:\\GitHub\\Patent\\WebRoot\\data\\common.json");
//		List<Map> list=UtilJackSon.toObj(content,new TypeReference<List<Map>>() {
//		});
//		System.out.println(list.size());
//		System.out.println(content);
//	} 
//}
