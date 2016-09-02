package com.system.database.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.database.dao.IDbDao;
import com.system.database.entity.Db;

import framework.base.service.BaseService;

@Service
public class DbService extends BaseService<Db> implements IDbService {

	@Autowired
	public void setDao(IDbDao dao) {
		setBaseDao(dao);
	}
}
