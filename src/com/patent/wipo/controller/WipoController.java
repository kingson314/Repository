package com.patent.wipo.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import framework.base.controller.BaseContorller;
import com.patent.wipo.entity.Wipo;
import com.patent.wipo.service.IWipoService;

import common.util.json.UtilJackSon;
import common.util.log.UtilLog;

/**
 * @Description:
 * @date 2016-07-13
 * @author:fgq
 */
@Controller
@RequestMapping("/wipo")
public class WipoController extends BaseContorller<Wipo> {
	@Resource
	private IWipoService wipoService;

	@RequestMapping("/get")
	public void list() {
		for (Map.Entry<String, Object> entry : this.mapParams.entrySet()) {
			UtilLog.logDebug(entry.getKey() + " = " + entry.getValue());
		}
		String applicationNumber = this.mapParams.get("sqh")
				.toString();
		String hql = "from Wipo where applicationNumber='" + applicationNumber
				+ "' order by createdate desc";
		List<Wipo> lstWipo = this.wipoService.list(hql, new Object[] {});
		try {
			System.out.println(UtilJackSon.toJson(lstWipo.get(0)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.print(lstWipo.get(0));
	}
}
