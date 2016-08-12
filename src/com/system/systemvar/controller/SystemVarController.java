package com.system.systemvar.controller;

import java.io.IOException;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.system.systemvar.entity.SystemVar;
import framework.base.controller.BaseContorller;

/**
 * @Description:
 * @date Feb 7, 2014
 * @author:fgq
 */

@Controller
@RequestMapping("/systemvar/")
public class SystemVarController extends BaseContorller<SystemVar> {
	    
	@RequestMapping("list")
	public void list() throws JsonGenerationException, JsonMappingException, IOException {
		this.print(SystemVar.listToJson());
	} 
}
