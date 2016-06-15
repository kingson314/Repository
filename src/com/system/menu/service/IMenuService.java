package com.system.menu.service;

import java.util.List;
import com.system.menu.entity.Menu;
import framework.base.service.IBaseService;

public interface IMenuService extends IBaseService<Menu> {
	public List<Menu> getTopMenu();

	public List<Menu> getSubMenu(String parentId);
}
