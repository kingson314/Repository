package com.system.menu.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.system.menu.entity.Menu;
import com.system.menu.service.IMenuService;
import com.system.systemvar.entity.SystemVar;
import common.util.conver.UtilConver;
import common.util.json.UtilJackSon;
import framework.base.controller.BaseContorller;
import framework.base.support.Result;
/**
 * @Description:
 * @date Feb 7, 2014
 * @author:fgq
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseContorller<Menu> {

	@Resource
	private IMenuService menuService;

	@RequestMapping("/getMenu")
	public void getMenu() {
		String TopMenuParentId = "-1";
		String roleid = "0";
		String topSql = "";
		String childSql = "";
		String SuperRoleId="";//必填
		String TbAuthority="";
		if (roleid.equals(String.valueOf(SuperRoleId))) {
			topSql = "select a.id,a.parentid,a.url,a.icon,a.name as text  from sys_menu  a where parentId=" + TopMenuParentId + " order by a.ord ";
			childSql = "select  a.id,a.parentid,a.url,a.icon,a.name as text from  sys_menu  a where parentId='" + "%1$s" + "'  order by a.ord ";
		} else {
			topSql = "select a.id,a.parentid,a.url,a.icon,a.name as text from sys_menu a ," + TbAuthority + " b where  "
					+ "a.id=b.componentid and b.componenttype=0 and b.roleid='" + roleid + "' and a.parentId=" + TopMenuParentId + " order by a.ord ";
			childSql = "select a.id,a.parentid,a.url,a.icon,a.name as text from  sys_menu  a ," + TbAuthority + " b where  "
					+ "a.id=b.componentid and b.componenttype=0 and b.roleid='" + roleid + "' and a.parentId='" + "%1$s" + "' order by a.ord ";
		}
		Result result = this.menuService.resultTree(topSql, childSql);
		this.print(result);
	}

	//
	@RequestMapping("/getMenuTreeStandard")
	public void getMenuTreeStandard() {
		try {
			String TopMenuParentId = "-1";
			String roleid = "0";
			String topSql = "";
			String childSql = "";
			String SuperRoleId="";//必填
			String TbAuthority="";//必填
			if (roleid.equals(String.valueOf(SuperRoleId))) {
				topSql = "select a.id,a.parentid,a.url,a.icon,a.name,'true'isParent,'true' open,'pIcon'iconSkin  from sys_menu  a where parentId='" + TopMenuParentId + "' order by a.ord ";
				childSql = "select  a.id,a.parentid,a.url,a.icon,a.name,'true'isParent,'true' open,'pIcon'iconSkin from  sys_menu  a where parentId='" + "%1$s" + "'  order by a.ord ";
			} else {
				topSql = "select a.id,a.parentid,a.url,a.icon,a.name from sys_menu a ," + TbAuthority + " b where  "
						+ "a.id=b.componentid and b.componenttype=0 and b.roleid='" + roleid + "' and a.parentId='" + TopMenuParentId + "' order by a.ord ";
				childSql = "select a.id,a.parentid,a.url,a.icon,a.name from  sys_menu  a ," + TbAuthority + " b where  "
						+ "a.id=b.componentid and b.componenttype=0 and b.roleid='" + roleid + "' and a.parentId='" + "%1$s" + "' order by a.ord ";
			}
			List<Map<String, Object>> listTreeList=this.menuService.listTree(topSql, childSql);
			this.print( UtilJackSon.toJson(listTreeList));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getMenuTree")
	public void getMenuTree() {
		try {
			String TopMenuParentId = "-1";
			String sql = "select id,parentid  ,name,state,ord,memo,icon,url ,decode(parentid,'-1','true','false') isparent,'true' isopen ,'pIcon02'iconSkin from sys_menu start with parentid='"
					+ TopMenuParentId + "'	connect by  prior  id=parentid	order  siblings by ord";

			List<Map<String, Object>> list = this.menuService.listMap(sql);
			List<Map<String, Object>> listResultList = new ArrayList<Map<String, Object>>();
			for (Map<String, Object> map : list) {
				Map<String, Object> mapTemp = new HashMap<String, Object>();
				mapTemp.put("id", map.get("ID"));
				mapTemp.put("pId", map.get("PARENTID"));
				mapTemp.put("name", map.get("NAME"));
				mapTemp.put("open", map.get("ISOPEN"));
				mapTemp.put("iconSkin", map.get("ICONSKIN"));
				listResultList.add(mapTemp);
			}
			String json = UtilJackSon.toJson(listResultList);
			this.print(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/getSubMenu")
	public void getSubMenu() {
		String parentId = this.mapParams.get("id").toString();
		List<Menu> listMenu = this.menuService.getSubMenu(parentId);
		Result result = new Result(listMenu);
		this.print(result);
	}
	@RequestMapping("/navlist")
	public void navlist() throws JsonGenerationException, JsonMappingException, IOException {
		if (SystemVar.isNull("menu","navlist") ) {
			String startParentId = this.mapParams.get("startParentId").toString();// "34001315D7D7466C9D792822526C187E";
			String topSql = "from Menu   where parentId=? order by ord ";
			String childSql = "from Menu  where parentId =? order by ord ";
			List<Menu> list = this.menuService.listTreeEntity(topSql, childSql, new Object[] { startParentId });
			SystemVar.put("menu","navlist", list);
		}
		this.print(SystemVar.toJson("menu","navlist"));
	}
	@RequestMapping("/list")
	public void list() {
		Result result = this.menuService.list(1, 10, "from Menu", null);
		this.print(result);
	}

	@RequestMapping("/save")
	public void save() {
		Menu menu = UtilConver.mapToBean(this.mapParams, Menu.class);
		this.menuService.save(menu);
		this.print(new Result(true));
	}

	@RequestMapping("/update")
	public void update() {
		Menu menu = UtilConver.mapToBean(this.mapParams, Menu.class);
		this.menuService.update(menu);
		this.print(new Result(true));
	}

	@RequestMapping("/delete")
	public void delete() {
		Menu menu = UtilConver.mapToBean(this.mapParams, Menu.class);
		this.menuService.delete(menu);
		this.print(new Result(true));
	}
}
