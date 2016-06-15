package demo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.system.user.entity.User;


import common.util.array.UtilArray;
import common.util.file.UtilFile;
import common.util.json.UtilJackSon;
import common.util.tree.UtilTree;

import framework.base.controller.BaseContorller;

/**
 * @Description:
 * @date 2015-05-13
 * @author:fgq
 */
@Controller
@RequestMapping("/demo/")
public class DemoController extends BaseContorller<User> {

	@RequestMapping("getTree")
	public void tree() throws JsonGenerationException, JsonMappingException,
			IOException {
		String path="D:\\Projects\\Repository\\WebRoot\\sea\\demo\\";
		String[]pathArr=UtilFile.getAllFilePathByFilter(path, "");
		this.print(UtilTree.toTreeJson(pathArr,path));
		//System.out.println(UtilTree.toTreeJson(pathArr,path));
	}
	
}
