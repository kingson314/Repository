package com.system.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.system.user.dao.IUserDao;
import com.system.user.entity.User;

import framework.base.service.BaseService;

@Service
public class UserService extends BaseService<User> implements IUserService {

	@Autowired
	public void setDao(IUserDao dao) {
		setBaseDao(dao);
	}
}
