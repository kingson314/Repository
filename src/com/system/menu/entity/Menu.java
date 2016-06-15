package com.system.menu.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import framework.base.entity.BaseEntity;

@Entity
@Table(name = "sys_menu")
public class Menu extends BaseEntity {
	private static final long serialVersionUID = 1L;

	// 父节点Id
	private String parentId;
	// url
	private String url;
	// 图标
	private String icon;

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
}
