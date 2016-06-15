package com.system.user.dao;

import org.springframework.stereotype.Component;

import com.system.user.entity.User;

import framework.base.dao.BaseDao;

@Component
public class UserDao extends BaseDao<User> implements IUserDao {

}
