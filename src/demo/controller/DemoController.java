package demo.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.system.database.entity.Db;

import common.util.file.UtilFile;
import common.util.tree.UtilTree;

import framework.base.controller.BaseContorller;

/**
 * @Description:
 * @date 2015-05-13
 * @author:fgq
 */
@Controller
@RequestMapping("/demo/")
public class DemoController extends BaseContorller<Db> {
	private static final String FILE_PATH = "C:/uploaddir";

	@RequestMapping("getTree")
	public void tree() throws JsonGenerationException, JsonMappingException,
			IOException {
		String path = "D:\\GitHub\\Repository\\WebRoot\\sea\\demo\\";
		String[] pathArr = UtilFile.getAllFilePathByFilter(path, "");
		this.print(UtilTree.toTreeJson(pathArr, path));
		System.out.println(UtilTree.toTreeJson(pathArr, path));
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("upload")
	public void uploadFile() throws IOException {
		List<MultipartFile> listUpload=(List<MultipartFile>)this.mapParams.get("listUpload");
		for(MultipartFile file:listUpload){
			int pre = (int) System.currentTimeMillis();
			// 取得当前上传文件的文件名称
			String fileName = file.getOriginalFilename();
			// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
			if (fileName.trim() != "") {
				System.out.println(fileName);
				// 重命名上传后的文件名
				// 定义上传路径
				String filePath = FILE_PATH + "/" + fileName;
				UtilFile.writeFile(filePath, file.getBytes());
			}
			// 记录上传该文件后的时间
			int finaltime = (int) System.currentTimeMillis();
			System.out.println(finaltime - pre);
		}
		Map<String, String> resultMap = new HashMap<String, String>(5);
		resultMap.put("result", "success");
		this.print(resultMap);
	}
	 
}
