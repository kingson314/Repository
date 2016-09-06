package com.system.Database.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.Database.dao.IDatabaseDao;
import com.system.Database.entity.Database;


import framework.base.service.BaseService;

@Service
public class DatabaseService extends BaseService<Database> implements IDatabaseService {

	@Autowired
	public void setDao(IDatabaseDao dao) {
		setBaseDao(dao);
	}
}
