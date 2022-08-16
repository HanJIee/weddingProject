package com.wedding.app.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wedding.app.dao.UserDAO;
import com.wedding.app.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	UserDAO dao;

	@Override
	public UserVO loginOk(UserVO vo) {
		// TODO Auto-generated method stub
		return dao.loginOk(vo);
	}

	@Override
	public int signUpOk(UserVO vo) {
		// TODO Auto-generated method stub
		return dao.signUpOk(vo);
	}

	@Override
	public int idCheck(String userid)throws Exception{
		// TODO Auto-generated method stub
		return dao.idCheck(userid);
	}
}
