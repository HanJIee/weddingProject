package com.wedding.app.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.wedding.app.vo.UserVO;

@Mapper
@Repository
public interface UserDAO {
	public UserVO loginOk(UserVO vo);
	public int signUpOk(UserVO vo);
	public int idCheck(String userid)throws Exception;
}
