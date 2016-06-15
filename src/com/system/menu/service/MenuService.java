package com.system.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.menu.dao.IMenuDao;
import com.system.menu.entity.Menu;

import framework.base.service.BaseService;

@Service
public class MenuService extends BaseService<Menu> implements IMenuService {

	@Autowired
	public void setDao(IMenuDao dao) {
		setBaseDao(dao);
	}

	public List<Menu> getTopMenu() {
		String hql = "from Menu  t where parentId='-1'  order by ord";
		return this.baseDao.list(hql);
	}

	public List<Menu> getSubMenu(String parentId) {
		return this.baseDao.listTree(parentId);
	}
}
