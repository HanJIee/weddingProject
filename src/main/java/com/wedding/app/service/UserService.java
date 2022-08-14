package com.wedding.app.service;

import com.wedding.app.vo.UserVO;

public interface UserService {
	public UserVO loginOk(UserVO vo);
	public int signUpOk(UserVO vo);
}
